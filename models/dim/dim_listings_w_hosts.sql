{{
    config(
        materialized='table'
    )
}}

WITH
L AS (
    SELECT * FROM {{ref("dim_listings_cleansed")}}
),
H AS (
    SELECT * FROM {{ref("dim_hosts_cleansed")}}
)

SELECT 
    L.listing_id,
    L.listing_name,
    L.room_type,
    L.min_nights,
    L.price,
    L.host_id,
    H.host_name,
    H.is_superhost as host_is_superhost,
    L.created_at,
    GREATEST(L.updated_at, H.updated_at) as updated_at


 FROM L
LEFT JOIN H
ON L.host_id = H.host_id