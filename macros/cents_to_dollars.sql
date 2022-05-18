{%- macro cents_to_dollary_dos(column_name, decimal_places=2) -%}

round(cast({{ column_name }} as decimal)/100, {{ decimal_places }})

{%- endmacro %}