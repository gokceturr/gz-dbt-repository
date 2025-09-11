{% macro pk_sales() -%}
  concat(cast(orders_id as string), '-', cast(pdt_id as string))
{%- endmacro %}
