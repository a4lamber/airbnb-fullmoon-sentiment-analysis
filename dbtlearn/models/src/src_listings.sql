-- raw layer to staging layer
-- convert raw_listing to src_listing
-- renamed the columns

WITH raw_listings AS (
    SELECT 
        *
    FROM
        -- AIRBNB.RAW.RAW_LISTINGS
        {{ source('airbnb', "listings") }}
)
-- some renaming in the staging layer
SELECT
    id as listing_id,
    name as listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings






    



    