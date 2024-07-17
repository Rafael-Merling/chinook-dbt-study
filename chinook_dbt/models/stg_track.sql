{{config(
    materialized="table"
)}}


SELECT 
    "TrackId" as track_id,
    "Name" as track_name,
    "AlbumId" as album_id,
    "MediaTypeId" as media_type_id,
    "GenreId" as genre_id,
    "Composer" as composer,
    "Milliseconds" as milliseconds,
    "Bytes" as bytes,
    "UnitPrice" as unit_price
FROM {{source('public', 'Track')}}