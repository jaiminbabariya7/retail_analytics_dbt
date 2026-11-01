select
    gender,
    category,
    count(*) as row_count
from {{ ref('gold_gender_by_product_category') }}
group by gender, category
having count(*) > 1