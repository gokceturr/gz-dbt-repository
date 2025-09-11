with 

source as (

    select * from {{ source('raw', 'ship') }}

),

	renamed as (
	select
		orders_id,
		shipping_fee,
		logcost AS log_cost,
		CAST(ship_cost AS INT64) AS ship_cost
	from source
)

 SELECT
      *
  FROM data-analytics-bootcamp-363212.gz_raw_data.raw_gz_ship
  WHERE shipping_fee <> shipping_fee_1

select * from renamed
