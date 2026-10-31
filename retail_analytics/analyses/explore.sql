SELECT
    *
FROM 
    {{ ref('lookup') }}

/*
SQL: This is just for our reference, we will not be running this query in production.
*/
