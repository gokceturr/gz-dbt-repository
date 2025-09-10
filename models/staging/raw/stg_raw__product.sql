with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
          * except(pdt_id, purchse_price),
        pdt_id AS products_id
        purchase_price AS purchase_price
        SAFE_CAST(purchase_price AS FLOAT )

    from source

)

select * from renamed
