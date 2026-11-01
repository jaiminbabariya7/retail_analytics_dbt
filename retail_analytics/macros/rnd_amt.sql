{% macro rnd_amt(col1, precision=2)%}
    round({{ col1 }}, {{precision}})
{% endmacro %}