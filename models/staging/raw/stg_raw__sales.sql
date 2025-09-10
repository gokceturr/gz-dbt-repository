with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        * except(pdt_id),
        pdt_id AS product_id

    from source

)

final as (
  select
    *,
    concat(cast(orders_id as string), '-', cast(products_id as string)) as pk_sales
  from renamed
)

select * from renamed
