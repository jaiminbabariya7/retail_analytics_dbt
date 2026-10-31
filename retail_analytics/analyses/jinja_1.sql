/*
Saved inside the analyses folder, this jinja is used only to explore the data. It is not used in prod.
*/

{%- set payment_type = ["Cash", "Credit Card", "PayPal", "Intrac/E-Transfer", "Cryptocurrency", "Gift Card", "Debit Card", "Check", "Stripe", "Other"] -%}

{% for i in payment_type %}
    
    {% if i != "Other" %}
    
        {{ i }}
    {% endif %}

{% endfor %}