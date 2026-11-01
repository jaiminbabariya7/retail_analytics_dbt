{{ config(materialized='table') }}

select
    gender,
    category,
    {{ rnd_amt('sum(gross_amount)') }}                                       as total_spend,
    count(sales_id)                                         as num_orders,
    {{ rnd_amt('sum(gross_amount) / count(sales_id)') }}    as avg_order_value
from {{ ref('silver_sales_info') }}
group by gender, category