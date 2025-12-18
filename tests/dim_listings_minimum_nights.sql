SELECT * FROM {{ ref('dim_listings_cleansed')}}
where min_nights < 1
limit 10