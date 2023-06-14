with cte_1 as(
SELECT 
  listing_id AS id,
  CONCAT(FLOOR(price/25)*25, '-', FLOOR(price/25)*25+24) AS price_range,
  price
FROM 
  dim_listings_w_hosts
WHERE
  price <= 500),
   cte_2 as(
SELECT 
  listing_id AS id,
  CONCAT('500+', '') AS price_range,
  price
FROM 
  dim_listings_w_hosts
WHERE
  price > 500)
SELECT 
  count(id) AS num_of_listings,
  price_range,
  min(price) as min_in_range
FROM 
  cte_1
group by price_range
UNION
SELECT 
  count(id) AS num_of_listings,
  price_range,
  min(price) as min_in_range
FROM 
  cte_1
group by price_range
ORDER BY min_in_range