{{
    config(
        materialized="table"
    )
}}


SELECT
    "CustomerId",
    "FirstName",
    "LastName",
    count(distinct "InvoiceId") as total_purchases,
    sum("UnitPrice"*"Quantity") as total_spent,
    count(distinct "TrackId") as tracks_bought,
    count(distinct "AlbumId") as albums_bought
from {{ref('purchase_details')}}
GROUP BY "CustomerId", "FirstName", "LastName"