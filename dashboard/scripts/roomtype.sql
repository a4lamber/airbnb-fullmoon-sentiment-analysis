SELECT 
  room_type,
  count(*) as number_of_types
FROM 
  dim_listings_cleansed 
group by room_type 