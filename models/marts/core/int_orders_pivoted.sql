 {%- set payment_methods = ["bank_transfer", "credit_card", "gift_card", "coupon"] -%}

with payments as (
    select * from {{ ref('stg_payments') }}
),

pivoted as (
    select
        order_id,
        {%- for payment_method in payment_methods %}
        {% if loop.index != loop.length -%}
        sum(case when payment_method = '{{ payment_method }}' then order_amount else 0 end) as {{ payment_method }}_amount,
        {%- else -%}
        sum(case when payment_method = '{{ payment_method }}' then order_amount else 0 end) as {{ payment_method }}_amount
        {%- endif -%}
        {% endfor %}
    from payments
    where order_status = 'success'
    group by 1
)

select * from pivoted