with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        * except(shipping_fee, shipping_fee_1, ship_cost)

        case
      when SAFE_CAST(shipping_fee   AS FLOAT64) is not null
        then SAFE_CAST(shipping_fee   AS FLOAT64)
      when SAFE_CAST(shipping_fee_1 AS FLOAT64) is not null
        then SAFE_CAST(shipping_fee_1 AS FLOAT64)
      else null
    end as shipping_fee,

   
    CAST(ship_cost AS STRING) as ship_cost
  
       

    from source

)

select * from renamed
