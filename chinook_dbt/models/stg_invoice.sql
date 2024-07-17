{{config(
    materialized="table"
)}}


SELECT
    "InvoiceId" as invoice_id,
    "CustomerId" as customer_id,
    "InvoiceDate" as invoice_date,
    "BillingAddress" as billing_address,
    "BillingCity" as billing_city,
    "BillingState" as billing_state,
    "BillingCountry" as billing_country,
    "BillingPostalCode" as billing_postal_code,
    "Total" as invoice_total
FROM {{source('public', 'Invoice')}} 