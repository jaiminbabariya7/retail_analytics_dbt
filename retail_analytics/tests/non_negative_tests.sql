SELECT
    *
FROM
    {{ ref('bronze_sales')}}
WHERE
    gross_amount < 0 AND net_amount < 0

/*
Singular Test: Check for negative gross_amount and net_amount in bronze_sales
*/