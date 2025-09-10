with

source as (

  select * from {{ source('raw','product') }}

),

renamed as (

  select
    *,   
       case
      when products_id is not null then products_id
      else pdt_id
    end as products_id,

)

select * from renamed
