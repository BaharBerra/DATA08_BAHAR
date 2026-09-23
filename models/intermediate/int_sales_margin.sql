select
    s.date_date,
    s.order_id,
    s.product_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    round(s.quantity * p.purchase_price, 2)             as purchase_cost,
    round(s.revenue - s.quantity * p.purchase_price, 2) as margin
from {{ ref('stg_raw__sales') }} as s
left join {{ ref('stg_raw__product') }} as p
    using (product_id)