-- Note: jinja template tag to refer to template variables (dbt heavily reply on it)
{{
    config(
        materialized = 'view'
    )
}}



WITH src_listing AS (
    SELECT * FROM {{ref('src_listings')}}
)
SELECT
    listing_id,
    listing_name,
    room_type,
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    -- replace $ with nothing; convert to number with 10 precision and 2 decimal points
    REPLACE(price_str,'$') :: NUMBER(10,2) AS price,
    created_at,
    updated_at
FROM
    src_listings


