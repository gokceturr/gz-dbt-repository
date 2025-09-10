{{ config(materialized='view') }}

with
source as (
  select * from {{ source('raw','product') }}
),
renamed as (
  select
    * except(pdt_id, purchse_price),
    pdt_id as products_id,                         
    safe_cast(purchse_price as float64) as purchase_price 
  from source
)
select * from renamed
