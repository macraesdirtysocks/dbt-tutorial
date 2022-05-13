with customers as (
    select customer_id from {{ ref('stg_customers')}}
),

orders as (
    select 
        order_id
        , customer_id
    from {{ ref('stg_orders')}}
),

payments as (
    select 
        order_id
        , order_amount
    from {{ ref('stg_payments')}}
),

final as (
    select
        orders.order_id
        , orders.customer_id
        , payments.order_amount
    from orders
    left join payments on orders.order_id=payments.order_id
)

select * from final
