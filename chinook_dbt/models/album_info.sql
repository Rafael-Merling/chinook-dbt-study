{{config(
    materialized="table"
)}}


SELECT
    "AlbumId",
    Album,
    Genre,
    count(Track) as number_of_tracks
from {{ref('fct_sales')}}
GROUP BY "AlbumId", Album, Genre