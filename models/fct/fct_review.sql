{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

WITH src_reviews AS (

    SELECT *
    FROM {{ ref('src_reviws') }}

)

SELECT
{{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
AS review_id,
*
FROM src_reviews

where review_text is not null
{% if is_incremental() %}

    and  review_date >
    (
        SELECT MAX(review_date)
        FROM {{ this }}
    )

{% endif %}