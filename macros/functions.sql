with base as (
  select
    {{ combination_of_columns | join(', ') }}
  from {{ model }}
  {% if ignore_nulls %}
  where
    {%- for c in combination_of_columns -%}
      {{ c }} is not null
      {%- if not loop.last %} and {% endif -%}
    {%- endfor -%}
  {% endif %}
),
dups as (
  select
    {{ combination_of_columns | join(', ') }},
    count(*) as cnt
  from base
  group by {{ combination_of_columns | join(', ') }}
  having count(*) > 1
)

select * from dups

{% endtest %}