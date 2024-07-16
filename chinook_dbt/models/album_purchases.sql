{{
    config(
        materialized="table"
    )
}}


SELECT
    "AlbumId",
    Album,
    count(distinct "InvoiceId") as total_purchases,
    sum("UnitPrice"*"Quantity") as total_spent_album,
    count(Track) as tracks_bought_from_album
from {{ref('purchase_details')}}
GROUP BY "AlbumId", Album
ORDER BY tracks_bought_from_album desc