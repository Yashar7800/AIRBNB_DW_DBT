{{
    config(
        materialized='table'
    )
}}

with fct_reviews as (
    select * from {{ref('fct_reviews')}}
),
fullmoon_dates as (
    select * from {{ref("seed_full_moon_dates")}}
)

select 
    FR.*,
    case
        when FD.full_moon_date is null then 'not full moon'
        else 'full moon'
    end as is_full_moon
 from fct_reviews as FR
 inner join fullmoon_dates as FD
 on (TO_DATE(FR.REVIEW_DATE) = DATEAdd(DAY,1,FD.full_moon_date))