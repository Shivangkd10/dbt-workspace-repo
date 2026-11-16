-- testing merge with incremental--------


------------------TESTING MERGE for UPDATES WITH INCREMENTAL------------------

CREATE OR REPLACE TABLE DATA_ENG_DBT.RAW.CUSTOMERS (
    CUSTOMER_ID NUMBER(38, 0) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(150),
    EMAIL VARCHAR(255),
    CREATED_AT TIMESTAMP_NTZ
);

INSERT INTO DATA_ENG_DBT.RAW.CUSTOMERS (
    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    CREATED_AT
)
VALUES
    (1, 'Alice Johnson', 'alice.johnson@example.com', CURRENT_TIMESTAMP),
    (2, 'Bob Smith', 'bob.smith@example.com', CURRENT_TIMESTAMP),
    (3, 'Charlie Lee', 'charlie.lee@example.com', CURRENT_TIMESTAMP);



-------testing data-------
    select * from DATA_ENG_DBT.RAW.CUSTOMERS;

      select * from DATA_ENG_DBT.DEV.FACT_TEST_CUSTOMER;

---------inserting dummy records  -----------

INSERT INTO DATA_ENG_DBT.RAW.CUSTOMERS (
    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    CREATED_AT
)
VALUES
    (4, 'Ale Jo', 'ale.jon@example.com', CURRENT_TIMESTAMP),
    (5, 'BoSih', 'bobth@example.com', CURRENT_TIMESTAMP);


    ------------updateing record for incremnetal merge--------

    update DATA_ENG_DBT.RAW.CUSTOMERS 
    set     CUSTOMER_NAME ='Ale Jo upadted',
    EMAIL='ale.upp@example.com',
    CREATED_AT = CURRENT_TIMESTAMP
    where CUSTOMER_ID=1;


 ---------------------------