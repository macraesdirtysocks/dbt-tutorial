{%- macro limit_data_in_dev(column_name, from_date = today(), interval=3, datepart='day') -%}
{% if target.name == 'default' %}

where {{ column_name }} >= date_add( {{ from_date }}, interval -{{ interval }} {{ datepart }} )

{%- endif %}
{%- endmacro%}