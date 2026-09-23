select
    o.order_id,
    o.date_date,
    o.revenue,
    o.quantity,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.logcost,
    s.ship_cost,
    round(o.margin + s.shipping_fee - s.logcost - s.ship_cost, 2) as operational_margin
from {{ ref('int_orders_margin') }} as o
left join {{ ref('stg_raw__ship') }} as s
    on o.order_id = s.orders_id