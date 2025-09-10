with

source as (

  select * from {{ source('raw','product') }}

),

renamed as (

  select
    *,   
       case                                            
      when s.products_id is not null then s.products_id
      else s.pdt_id
    end as products_id,                    
    safe_cast(purchse_price as float64) as purchase_price 
  from source

)

select * from renamed
