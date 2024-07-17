{{config(
    materialized="table"
)}}


SELECT
    "MediaTypeId" as media_type_id,
    "Name" as media_type_name
FROM {{source('public', "MediaType")}}