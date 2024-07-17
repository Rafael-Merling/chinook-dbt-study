{{config(
    materialized="table"
)}}


SELECT
    stg_invoice.invoice_id,
    stg_invoice.invoice_date,
    stg_invoice_line.invoice_line_id,
    stg_track.track_id,
    stg_track.track_name,
    stg_genre.genre_name,
    stg_genre.genre_id,
    stg_media_type.media_type_name,
    stg_media_type.media_type_id,
    stg_invoice_line.unit_price,
    stg_invoice_line.quantity,
    stg_album.album_id,
    stg_album.album_name
FROM {{ ref('stg_invoice_line')}} 
left join {{ ref('stg_invoice')}}  on stg_invoice_line.invoice_id = stg_invoice.invoice_id
left join {{ ref('stg_track')}} on stg_track.track_id = stg_invoice_line.track_id
left join {{ ref('stg_media_type')}} on stg_media_type.media_type_id = stg_track.media_type_id
left join {{ ref('stg_genre')}} on stg_genre.genre_id = stg_track.genre_id
left join {{ ref('stg_album')}} on stg_album.album_id = stg_track.album_id