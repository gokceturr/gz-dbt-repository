with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        * except(shipping_fee, shipping_fee_1, ship_cost)

        case
      when safe_cast(shipping_fee   as float64) is not null then safe_cast(shipping_fee   as float64)
      when safe_cast(shipping_fee_1 as float64) is not null then safe_cast(shipping_fee_1 as float64)
      else null
    end as shipping_fee,

   
     safe_cast(ship_cost as float64) as ship_cost
  
       

    from source

)

select * from renamed
