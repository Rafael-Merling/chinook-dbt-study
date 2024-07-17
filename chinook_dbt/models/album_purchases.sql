{{
    config(
        materialized="table"
    )
}}


SELECT
    album_id,
    album_name,
    count(distinct invoice_id) as total_purchases,
    sum(unit_price*quantity) as total_spent_album,
    count(track_name) as tracks_bought_from_album
from {{ref('purchase_details')}}
GROUP BY album_id, album_name
ORDER BY tracks_bought_from_album desc