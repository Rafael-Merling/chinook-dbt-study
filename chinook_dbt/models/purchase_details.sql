{{
    config(
        materialized="table"
    )
}}

select
    stg_customer.customer_id,
    stg_customer.first_name,
    stg_customer.last_name,
    stg_invoice.invoice_id,
    stg_invoice.invoice_date,
    stg_invoice.invoice_total,
    stg_invoice_line.invoice_line_id,
    stg_invoice_line.unit_price,
    stg_invoice_line.quantity,
    stg_track.track_name,
    stg_track.track_id,
    stg_album.album_id,
    stg_album.album_name
from {{ref('stg_customer')}} 
left join {{ref('stg_invoice')}} on stg_invoice.customer_id = stg_customer.customer_id
left join {{ref('stg_invoice_line')}}  on stg_invoice_line.invoice_id = stg_invoice.invoice_id 
left join {{ref('stg_track')}} on stg_track.track_id = stg_invoice_line.track_id
left join {{ref('stg_album')}} on stg_album.album_id = stg_track.album_id



