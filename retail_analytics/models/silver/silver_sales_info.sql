{{ config(materialized='table') }}

{% set cols_list = ["sales_id", "product_sk", "customer_sk", "payment_method"] %}


WITH silver_sales AS (

        SELECT
            {% for i in cols_list%}
                {{ i }}
                {% if not loop.last %}, {% endif%}
            {% endfor%},
            {{ rnd_amt('gross_amount', 2) }} as gross_amount,
            {{ multiply('quantity', 'unit_price') }} as calculated_gross_amount
        FROM
            {{ ref('bronze_sales')}}
),


silver_products AS (
    SELECT
        product_sk,
        category
    FROM {{ ref('bronze_product') }}
),

silver_customer AS (
    SELECT
        customer_sk,
        gender,
        loyalty_tier
    FROM {{ ref('bronze_customer')}}
)

SELECT
    s.sales_id,
    /*s.product_sk,*/
    p.category,
    /*s.customer_sk,*/
    c.gender,
    c.loyalty_tier,
    s.gross_amount,
    s.calculated_gross_amount,
    s.payment_method
FROM silver_sales s
LEFT JOIN silver_products p
    ON s.product_sk = p.product_sk
LEFT JOIN silver_customer c
    ON s.customer_sk = c.customer_sk