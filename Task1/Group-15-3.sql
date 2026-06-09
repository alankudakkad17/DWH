SELECT table_name, num_rows ,num_colums
FROM all_tables
WHERE owner = 'DWT_BRANCH_3'
ORDER BY table_name;

SELECT owner, table_name, column_name, column_id, data_type, data_length, data_precision, data_scale, nullable
FROM all_tab_columns
WHERE owner = 'DWT_BRANCH_3'
ORDER BY table_name, column_id;


SELECT owner, table_name, constraint_name, constraint_type
FROM all_constraints
WHERE owner = 'DWT_BRANCH_3'
ORDER BY table_name, constraint_type;

SELECT table_name,constraint_name,search_condition
FROM all_constraints
WHERE owner = 'DWT_BRANCH_3'
AND constraint_type = 'C'
ORDER BY table_name, constraint_name;

SELECT table_name,constraint_name,search_condition
FROM all_constraints
WHERE owner = 'DWT_BRANCH_3'
AND constraint_type = 'P'
ORDER BY table_name, constraint_name;

SELECT table_name,constraint_name,search_condition
FROM all_constraints
WHERE owner = 'DWT_BRANCH_3'
AND constraint_type = 'R'
ORDER BY table_name, constraint_name;

SELECT table_name,constraint_name,search_condition
FROM all_constraints
WHERE owner = 'DWT_BRANCH_3'
AND constraint_type = 'U'
ORDER BY table_name, constraint_name;




CREATE TABLE BOTTLE (
    OID NUMBER(2,0) PRIMARY KEY,
    VOL NUMBER(3,2),
    UNIT VARCHAR2(15)
);

CREATE TABLE SORT (
    SID NUMBER(2,0) PRIMARY KEY,
    NAME VARCHAR2(20)
);


CREATE TABLE CUSTOMER (
    ID NUMBER(10,0) PRIMARY KEY,
    NAME VARCHAR2(25) NOT NULL,
    SURNAME VARCHAR2(25) NOT NULL,
    STR VARCHAR2(50),
    NO VARCHAR2(5),
    ZIP CHAR(5) NOT NULL,
    PLACE VARCHAR2(60) NOT NULL,
    GEND NUMBER(1,0),
    BDAY DATE
);

CREATE TABLE PRODUCT (
    ID NUMBER(10,0) PRIMARY KEY,
    NAME VARCHAR2(35) NOT NULL,
    SID NUMBER(2,0),
    OID NUMBER(2,0),
    PRICE NUMBER(3,2) NOT NULL,
    FOREIGN KEY (SID) REFERENCES SORT(SID),
    FOREIGN KEY (OID) REFERENCES BOTTLE(OID)
);

CREATE TABLE ORDER(
    ORDER NUMBER(15,0) PRIMARY KEY,
    DATE DATE NOT NULL UNIQUE,
    AMOUNT NUMBER(5,0) NOT NULL,
    CSTMR NUMBER(10,0),
    PRO NUMBER(10,0),
    FOREIGN KEY (CSTMR) REFERENCES CUSTOMER(ID),
    FOREIGN KEY (PRO) REFERENCES PRODUCT(ID)
);


