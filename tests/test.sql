
select distinct(count(listing_id)) as CNT_listingID, listing_id,reviewer_name,price, sentiment,DATE,minimum_nights from raw.raw_hosts h
inner join raw.raw_listings l
on H.ID = L.HOST_ID 
right join raw.raw_reviews r
on l.id = r.listing_id
where reviewer_name like '%ssa' and minimum_nights > 2
group by listing_id,reviewer_name,price, sentiment,DATE,minimum_nights
order by  CNT_listingID desc
limit 20