-- singular test:
-- make sure that every review_date in 
-- fct_reviews is more recent than the associated "created_at" 
-- in the dim_listings_cleansed.
-- 测试目标说人话:
-- listing table和review table. 你每条review的评论时间，总归要在这个listing
-- post出来之后吧

WITH CTE AS (
SELECT
    f.review_date AS review_date,
    l.created_at AS listing_created_at
FROM
    {{ ref('fct_reviews') }} AS f
LEFT JOIN {{ ref('dim_listings_cleansed') }} AS l
ON f.listing_id = l.listing_id
)
SELECT
    *
FROM
    CTE
-- 反向测试结果是否为空集
-- 空集则pass, 非空集则fail
WHERE CTE.review_date < CTE.listing_created_at