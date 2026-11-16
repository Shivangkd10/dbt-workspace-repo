with  scd_raw_customer as (
select * from {{ ref ('scd_raw_customer')}}
)

select * from scd_raw_customer 
where DBT_VALID_TO is Null