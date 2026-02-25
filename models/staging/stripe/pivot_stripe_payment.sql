with payment as (
select *
from {{ref('stg_stripe__payments')}}
where status='success')


select order_id,
{%- set order_methods=['credit_card','bank_transfer','coupon','gift_card'] -%}
{%- for order_method in order_methods -%}
   sum(case when payment_method='{{order_method}}' then amount else 0 end) as {{order_method}}_amount
   {% if not loop.last %} , {% endif %}
{%- endfor -%}
from payment
group by order_id