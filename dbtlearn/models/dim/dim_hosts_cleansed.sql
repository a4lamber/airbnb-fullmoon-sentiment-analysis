-- creating dimension table for hosts

{{
    config(
        materialized = 'view'
    )
}}

with src_hosts AS (
    SELECT * FROM {{ref("src_hosts")}}
)
SELECT
    host_id,
    -- handling null
    NVL(host_name,'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts