select *
from {{ref('stg_customers')}} c
join {{ref('stg_orders')}} o
on c.customer_id = o.customer_id
