-- joing two tables amd using CTE 

with l as (select * from {{ref('dim_listings_cleaned')}} ),
h as ( select * from {{ref('dim_host_cleaned')}})


SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM l
LEFT JOIN h ON (h.host_id = l.host_id)