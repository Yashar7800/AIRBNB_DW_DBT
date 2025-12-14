{{
    config(
        materialized='view'
    )
}}


WITH src_listings AS (
    SELECT * FROM {{ref('src_listings')}}
)

SELECT
    listing_id,
    listing_name,
    room_type,
    case
        when min_nights = 0 then 1
        else min_nights
    end as min_nights,
    host_id,
    replace(price_str,'$') :: NUMBER(10,2) as price,
    created_at,
    updated_at
from src_listings
