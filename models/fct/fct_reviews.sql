{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}

WITH src_reviews AS(
    SELECT * FROM {{ref("src_reviews")}}
)

SELECT * FROM src_reviews
WHERE REVIEW_COMMENTS IS NOT NULL
{% if is_incremental() %}
    AND REVIEW_DATE > (select max(REVIEW_DATE) from {{ this }})
{% endif %}