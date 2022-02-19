with payments as (
    select * from {{ ref('stg_payments') }}
),


orders as (
    select * from {{ ref('stg_orders') }}
),

final as (
    select 
        ods.order_id,
        ods.customer_id,
        SUM(pms.amount) as amount
    from orders as ods
    join payments as pms on ods.order_id = pms.order_id
    where pms.status = 'success'
    group by ods.order_id, ods.customer_id
)

select * from final