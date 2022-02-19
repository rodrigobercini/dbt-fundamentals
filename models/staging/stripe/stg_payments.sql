select
    orderid as order_id,
    paymentmethod as payment_method,
    amount as amount,
    status,
    created as created_at
from raw.stripe.payment