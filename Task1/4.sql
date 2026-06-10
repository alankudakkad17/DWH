SELECT table_name, num_rows
FROM all_tables
WHERE owner = 'DWT_BRANCH_4'
ORDER BY table_name;

SELECT owner, table_name, column_name, column_id, data_type, data_length, data_precision, data_scale, nullable
FROM all_tab_columns
WHERE owner = 'DWT_BRANCH_4'
ORDER BY table_name, column_id;


SELECT owner, table_name, constraint_name, constraint_type
FROM all_constraints
WHERE owner = 'DWT_BRANCH_4'
ORDER BY table_name, constraint_type;


SELECT table_name,constraint_name,search_condition
FROM all_constraints
WHERE owner = 'DWT_BRANCH_4'
AND constraint_type = 'C'
ORDER BY table_name, constraint_name;

SELECT table_name,constraint_name,search_condition
FROM all_constraints
WHERE owner = 'DWT_BRANCH_4'
AND constraint_type = 'P'
ORDER BY table_name, constraint_name;


SELECT 
    uc.owner,
    uc.table_name,
    uc.constraint_name,
    ucc.column_name,
    ucc.position
FROM all_constraints uc
JOIN all_cons_columns ucc 
    ON uc.owner = ucc.owner AND uc.constraint_name = ucc.constraint_name
WHERE uc.owner = 'DWT_BRANCH_4'
  AND uc.constraint_type = 'P'
ORDER BY uc.table_name, ucc.position;

SELECT 
    uc.owner,
    uc.table_name,
    uc.constraint_name,
    ucc.column_name,
    ucc.position
FROM all_constraints uc
JOIN all_cons_columns ucc 
    ON uc.owner = ucc.owner AND uc.constraint_name = ucc.constraint_name
WHERE uc.owner = 'DWT_BRANCH_4'
  AND uc.constraint_type = 'C'
ORDER BY uc.table_name, ucc.position;

CREATE TABLE SORT (
    SORTNUMBER NUMBER(3,0) PRIMARY KEY,
    NAME VARCHAR2(25)
);

CREATE TABLE CUSTOMER (
    CUSTUMERNUMBER NUMBER(10,0) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    FIRSTNAME VARCHAR2(30) NOT NULL,
    STREET_NO VARCHAR2(40),
    ZIP NUMBER(5,0),
    PLACE VARCHAR2(30),
    GENDER CHAR(1),
    BDAY DATE
);

CREATE TABLE PRODUCT (
    PRODUCTNUMBER NUMBER(12,0) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    SID NUMBER(5,0) NOT NULL,
    SIZE VARCHAR2(20),
    PRICE NUMBER(3,2) NOT NULL
);


CREATE TABLE ORDER (
    ORDERID NUMBER(13,0) PRIMARY KEY,
    CID NUMBER(10,0) NOT NULL,
    "DATE" DATE NOT NULL
);

CREATE TABLE ITEM (
    OID NUMBER(13,0) NOT NULL,
    AMOUNT NUMBER(5,0) NOT NULL,
    PID NUMBER(12,0) NOT NULL,
    PRIMARY KEY (OID, AMOUNT, PID)
);



