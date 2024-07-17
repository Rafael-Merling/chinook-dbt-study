{{config(
    materialized="table"
)}}


SELECT
    "AlbumId" as album_id,
    "Title" as album_name,
    "ArtistId" as artist_id
FROM {{source('public', 'Album')}}