-- this is fact table

-- set up configuration for this 
--  1. set materialzed to be incremental since it's a fact table; 
--  2. fail if upstream changes;
{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}


with src_reviews AS (
    SELECT * FROM {{ ref("src_reviews")}}
)
SELECT * FROM src_reviews
WHERE review_text IS NOT NULL
-- jinja if statement
{% if is_incremental() %}
    AND review_date > (SELECT MAX(review_date) from {{ this }}) -- this refers to this script
{% endif%}
