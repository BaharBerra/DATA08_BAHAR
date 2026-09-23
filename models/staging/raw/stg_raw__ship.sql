with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        CAST(logCost AS FLOAT64) as logcost,
        CAST(ship_cost AS INT64) 

    from source

)

select * from renamed