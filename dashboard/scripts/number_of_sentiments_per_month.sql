SELECT YEAR(review_date) AS YEAR, 
       month(review_date) AS month,
       TO_DATE(CONCAT(YEAR, '-', LPAD(month, 2, '0'), '-01'), 'YYYY-MM-DD') AS year_month,
       SUM(CASE WHEN review_sentiment  = 'positive' THEN 1 ELSE 0 END) as positive,
       SUM(CASE WHEN review_sentiment  = 'negative' THEN 1 ELSE 0 END) as negative,
       SUM(CASE WHEN review_sentiment  = 'neutral' THEN 1 ELSE 0 END) as neutral
FROM fct_reviews 
GROUP BY month, year
order by year,month