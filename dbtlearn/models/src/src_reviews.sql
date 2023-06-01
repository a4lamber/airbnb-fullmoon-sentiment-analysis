-- convert raw reviews 
WITH raw_reviews AS (
    SELECT 
        *
    FROM
        -- airbnb.raw.raw_reviews
        {{ source('airbnb', "reviews") }}
)
SELECT
    listing_id,
    RAW_REVIEWS.DATE AS review_date,
    REVIEWER_NAME,
    COMMENTS AS review_text,
    SENTIMENT AS review_sentiment
FROM
    raw_reviews