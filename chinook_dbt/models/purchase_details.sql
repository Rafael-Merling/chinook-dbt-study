{{
    config(
        materialized="table"
    )
}}

select
    "Customer"."CustomerId",
    "Customer"."FirstName",
    "Customer"."LastName",
    "Invoice"."InvoiceId",
    "Invoice"."InvoiceDate",
    "Invoice"."Total",
    "InvoiceLine"."InvoiceLineId",
    "InvoiceLine"."UnitPrice",
    "InvoiceLine"."Quantity",
    "Track"."Name" as Track,
    "Track"."TrackId",
    "Album"."Title" as Album,
    "Album"."AlbumId"
from {{source('public', 'Customer')}} 
left join {{source('public', 'Invoice')}} on "Invoice"."CustomerId" = "Customer"."CustomerId"
left join {{source('public', 'InvoiceLine')}}  on "InvoiceLine"."InvoiceId" = "Invoice"."InvoiceId" 
left join {{source('public', 'Track')}} on "Track"."TrackId" = "InvoiceLine"."TrackId"
left join {{source('public', 'Album')}} on "Album"."AlbumId" = "Track"."AlbumId"



