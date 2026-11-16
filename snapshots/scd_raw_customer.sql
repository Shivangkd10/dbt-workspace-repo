{% snapshot scd_raw_customer %}

{{
    config(
        target_schema='dev',
        unique_key='Customer_id',
        strategy='check',
        check_cols=['CUSTOMER_STATE'],
        invalidate_hard_deletes=True
        )
}}

SELECT * FROM  DATA_ENG_DBT.RAW.CUSTOMERS

{% endsnapshot %}