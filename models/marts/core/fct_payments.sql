with payments as (
    select * from {{ ref('stg_payments') }}
),


orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select 
        orders.order_id,
        orders.customer_id,
        SUM(payments.amount)
    from orders 
    join payments on orders.order_id = payments.order_id
    where payments.status = 'success'
    group by orders.order_id, orders.customer_id
)

select * from final