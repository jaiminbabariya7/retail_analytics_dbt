{% set cols_list = ["quantity", "unit_price"]%} 

SELECT
    {% for i in cols_list %}
        {{ i }}
        
    {% if not loop.last %}, {% endif %}
    {% endfor %},

   {{ multiply('quantity', 'unit_price') }} as gross_amt
   FROM {{ ref('bronze_sales')}}