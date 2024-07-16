{{config(
    materialized="table"
)}}


SELECT
    "Invoice"."InvoiceId",
    "Invoice"."InvoiceDate",
    "InvoiceLine"."InvoiceLineId",
    "Track"."TrackId",
    "Track"."Name" as Track,
    "Genre"."Name" as Genre,
    "Genre"."GenreId",
    "MediaType"."Name" as MediaType,
    "MediaType"."MediaTypeId",
    "InvoiceLine"."UnitPrice",
    "InvoiceLine"."Quantity",
    "Album"."AlbumId",
    "Album"."Title" as Album
FROM {{ source('public', 'InvoiceLine')}} 
left join {{ source('public', 'Invoice')}}  on "InvoiceLine"."InvoiceId" = "Invoice"."InvoiceId"
left join {{ source('public', 'Track')}} on "Track"."TrackId" = "InvoiceLine"."TrackId"
left join {{ source('public', 'MediaType')}} on "MediaType"."MediaTypeId" = "Track"."MediaTypeId"
left join {{ source('public', 'Genre')}} on "Genre"."GenreId" = "Track"."GenreId"
left join {{ source('public', 'Album')}} on "Album"."AlbumId" = "Track"."AlbumId"