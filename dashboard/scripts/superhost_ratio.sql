SELECT
  is_superhost,
  count(*) as NUMBER 
FROM 
  dim_hosts_cleansed 
WHERE 
  is_superhost in ('f','t')
group by is_superhost;