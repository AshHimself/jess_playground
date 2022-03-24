{{ config(schema='gold') }}




with customer_orders as (
    select
        customerid,
        min(orderDate) as first_order_date,
        max(orderDate) as most_recent_order_date,
        count(orderID) as number_of_orders

    from {{ ref('silver_orders') }}

    group by 1
)

select
    customerid,
    contactname,
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders

from {{ ref('silver_customers') }}

left join customer_orders using (customerid)