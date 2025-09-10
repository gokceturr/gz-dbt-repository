with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
          * except(pdt_id, purchse_price),
        pdt_id AS products_id,
        SAFE_CAST(purchase_price AS FLOAT ) AS purchase_price

    from source

)

select * from renamed
