with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        * except(pdt_id, products_id),
    case when products_id is not null then products_id else pdt_id end as products_id

    from source

)

select * from renamed
