with
source as (
  select * from {{ source('raw','sales') }}
),
renamed as (
  select
    * except(pdt_id),       
    pdt_id as products_id     
  from source
)
select
  renamed.*,
  concat(cast(orders_id as string), '-', cast(products_id as string)) as pk_sales
from renamed
