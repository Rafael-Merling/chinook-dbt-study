{{
    config(
        materialized="table"
    )
}}


SELECT
    customer_id,
    first_name,
    last_name,
    count(distinct invoice_id) as total_purchases,
    sum(unit_price*quantity) as total_spent,
    count(distinct track_id) as tracks_bought,
    count(distinct album_id) as albums_bought
from {{ref('purchase_details')}}
GROUP BY customer_id, first_name, last_name