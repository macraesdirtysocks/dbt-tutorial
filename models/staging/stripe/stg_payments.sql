select 
    id
    , orderid as order_id
    , paymentmethod as payment_method
    , `status` as order_status
    , {{ cents_to_dollary_dos('amount') }} as order_amount
    , created
    , _batched_at
from {{ source('stripe', 'payment') }}
order by order_id