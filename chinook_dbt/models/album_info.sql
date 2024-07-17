{{config(
    materialized="table"
)}}


SELECT
    album_id,
    album_name,
    genre_name,
    count(track_name) as number_of_tracks
from {{ref('fct_sales')}}
GROUP BY album_id, album_name, genre_name