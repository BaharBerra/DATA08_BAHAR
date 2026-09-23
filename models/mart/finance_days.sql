with orders_per_day as (

    select
        date_date,
        count(distinct order_id)       as nb_transactions,
        round(sum(revenue), 2)          as revenue,
        round(sum(operational_margin), 2) as operational_margin,
        round(sum(purchase_cost), 2)    as purchase_cost,
        round(sum(shipping_fee), 2)     as shipping_fee,
        round(sum(logcost), 2)          as logcost,
        sum(quantity)                   as quantity
    from {{ ref('int_orders_operational') }}
    group by date_date

)

select
    date_date,
    nb_transactions,
    revenue,
    round(revenue / nullif(nb_transactions, 0), 2) as average_basket,
    operational_margin,
    purchase_cost,
    shipping_fee,
    logcost,
    quantity
from orders_per_day
order by date_date desc