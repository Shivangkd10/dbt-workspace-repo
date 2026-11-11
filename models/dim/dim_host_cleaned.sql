-------host name null to be renamed
----  So NVL is a generic SQL function which allows you
--  to replace null with more meaningful alternatives. ----

WITH src_hosts AS (

    SELECT *
    FROM {{ ref('src_hosts') }}

)

SELECT
    host_id,

    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,

    is_superhost,
    created_at,
    updated_at

FROM src_hosts