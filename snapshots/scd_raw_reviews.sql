{% snapshot scd_raw_reviews %}

{{
    config(
        target_schema='dev',
        unique_key='listing_id',
        strategy='check',
        check_cols=['sentiment','date']
    )
}}

select * from {{source('airbnb','reviews')}}

{% endsnapshot %}

