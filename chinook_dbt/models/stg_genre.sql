{{config(
    materialized="table"
)}}


SELECT
    "GenreId" as genre_id,
    "Name" as genre_name
FROM {{source('public', 'Genre')}}