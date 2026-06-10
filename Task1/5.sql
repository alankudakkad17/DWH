SELECT table_name, num_rows
FROM all_tables
WHERE owner = 'DWT_BRANCH_5'
ORDER BY table_name;

SELECT owner, table_name, column_name, column_id, data_type, data_length, data_precision, data_scale, nullable
FROM all_tab_columns
WHERE owner = 'DWT_BRANCH_5'
ORDER BY table_name, column_id;



SELECT owner, table_name, constraint_name, constraint_type
FROM all_constraints
WHERE owner = 'DWT_BRANCH_5'
ORDER BY table_name, constraint_type;

SELECT owner, table_name, constraint_name, search_condition
FROM all_constraints
WHERE owner = 'DWT_BRANCH_5'
  AND constraint_type = 'C'
ORDER BY table_name, constraint_name;


SELECT uc.owner,uc.table_name,uc.constraint_name, ucc.column_name,ucc.position
FROM all_constraints uc
JOIN all_cons_columns ucc 
    ON uc.owner = ucc.owner AND uc.constraint_name = ucc.constraint_name
WHERE uc.owner = 'DWT_BRANCH_5'
  AND uc.constraint_type IN ('P', 'R', 'U')
ORDER BY uc.constraint_type, uc.table_name, ucc.position;


CREATE TABLE PLACE (
    ZIP CHAR(5) PRIMARY KEY,
    PLACE VARCHAR2(30)
);


CREATE TABLE CUSTOMER (
    ID NUMBER(10,0) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    SURNAME VARCHAR2(30),
    STR VARCHAR2(40) NOT NULL,
    NO NUMBER(3,1) NOT NULL,
    ZIP CHAR(5),
    GEND CHAR(1),
    BDAY DATE,
    FOREIGN KEY (ZIP) REFERENCES PLACE(ZIP)
);

CREATE TABLE PRODUCT (
    ID NUMBER(10,0) NOT NULL UNIQUE,
    NAME VARCHAR2(30) NOT NULL,
    SORT VARCHAR2(25),
    SZ NUMBER(3,2),
    PRICE NUMBER(3,2) NOT NULL
);


CREATE TABLE ORDER (
    OID VARCHAR2(30) PRIMARY KEY,
    DATE DATE NOT NULL,
    CUSTOMER VARCHAR2(50) NOT NULL
);

CREATE TABLE ORDERS (
    "ORDER" VARCHAR2(30),
    PRODUCT NUMBER(10,0),
    AMOUNT NUMBER(2,0) NOT NULL
);
