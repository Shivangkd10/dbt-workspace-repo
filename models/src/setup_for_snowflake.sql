-- ##purely for snowflake

use database snowflake_sample_data;
use schema TPCH_SF1;
use warehouse snowflake_learning_wh;

show tables;
select * from customer;


----------------

use role dbt_executor_role;
create database DATA_ENG_DBT;


--------
-- this will be aur target table
create schema dev;


--------

-- populating raw data

use role dbt_executor_role;
use database  DATA_ENG_DBT;
show schemas;
create schema raw;

CREATE OR REPLACE TABLE raw_listings
(
    id integer,
    listing_url string,
    name string,
    room_type string,
    minimum_nights integer,
    host_id integer,
    price string,
    created_at datetime,
    updated_at datetime
);


COPY INTO raw_listings
(
    id,
    listing_url,
    name,
    room_type,
    minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
)
FROM 's3://dbtlearn/listings.csv'
FILE_FORMAT = (
    type = 'CSV'
    skip_header = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);






CREATE OR REPLACE TABLE raw_reviews
(
    listing_id integer,
    date datetime,
    reviewer_name string,
    comments string,
    sentiment string
);

COPY INTO raw_reviews
(
    listing_id,
    date,
    reviewer_name,
    comments,
    sentiment
)
FROM 's3://dbtlearn/reviews.csv'
FILE_FORMAT = (
    type = 'CSV'
    skip_header = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);






CREATE OR REPLACE TABLE raw_hosts
(
    id integer,
    name string,
    is_superhost string,
    created_at datetime,
    updated_at datetime
);

COPY INTO raw_hosts
(
    id,
    name,
    is_superhost,
    created_at,
    updated_at
)
FROM 's3://dbtlearn/hosts.csv'
FILE_FORMAT = (
    type = 'CSV'
    skip_header = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
);


------------------------
-- ###testing raw data##### ------------
select * from data_eng_dbt.raw.raw_hosts limit 100;

select * from raw_hosts limit 100;
----------------------------------------

DATA_ENG_DBT.DEV.SRC_LISTING;





--------

select * from data_eng_dbt.dev.src_listing