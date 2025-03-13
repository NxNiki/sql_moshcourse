# Write your MySQL query statement below

with average_quantity as (
    select
        order_id,
        avg(quantity) avg_quantity
    from
        OrdersDetails
    group by
        order_id
)

select
    order_id
from
    OrdersDetails
group by
    order_id
having max(quantity) > (select max(avg_quantity) from average_quantity)

