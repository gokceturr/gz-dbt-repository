with
  source as (
    select * from {{ source('raw','sales') }}
  ),
  renamed as (
    select
      * except(pdt_id),
      pdt_id as products_id
    from source
  ),
  dedup as (
    select *
    from renamed
    qualify row_number() over (
      partition by orders_id, products_id
      order by orders_id
    ) = 1
  ),
  final as (
    select
      *,
      concat(cast(orders_id as string), '-', cast(products_id as string)) as pk_sales
    from dedup
  )
select * from final;

