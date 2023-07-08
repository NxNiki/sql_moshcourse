

select *
from employees e
where salary > (
	select avg(salary)
	from employees
);	

# find products that have never been ordered:
select *
from products
where product_id not in (
	select distinct product_id
	from order_items
)

## subqueries vs joins:
# quite often, we can rewrite subqueries using a join and vice versa.
# performance and readability:

select *
from clients
left join invoices using (client_id)
where invoice_id is null

# find customers who have ordered lettuce:

select *
from customers
where customer_id in (
	select o.customer_id
	from order_items oi
	join orders o using (order_id)
	where product_id = 3
)

# using join:
select distinct customer_id, first_name, last_name
from customers c
join orders o using (customer_id)
join order_items oi using (order_id)
where oi.product_id = 3

	
## correlated subqueries:
# select employees with salary higher than the avg salary in the same office:
	
select *
from employees e
where salary > (
	select avg(salary)
	from employees
    where office_id = e.office_id
);

# correlated subquery get executed for each row of the main query. So it can sometimes be slow.
use sql_invoicing;
select *
from invoices i
where invoice_total > (
	select avg(invoice_total)
    from invoices
    where client_id = i.client_id
);

## exist operator:
# select clients that has an invoice:
select *
from clients
where client_id in (select distinct client_id from invoices);

# the above query is inefficient if the result of subquery is huge.

select *
from clients c
where exists (select client_id from invoices where c.client_id = client_id)
;

# find the product that has never been ordered:
use sql_store;

select *
from products p
where not exists (select product_id from order_items where p.product_id = product_id);

## subquery in the select clause:
use sql_invoicing;
select 
	invoice_id
    , invoice_total
    , (select avg(invoice_total) from invoices) as invoice_avg
    , invoice_total - (select invoice_avg) as diff
from
	invoices
;

select
	client_id
    , name
    , (select sum(invoice_total) from invoices where client_id = c.client_id) as total_sales
    , (select avg(invoice_total) from invoices) as avg_invoice
    , (select total_sales - avg_invoice) as difference
from
	clients c
;

## subquery in from clause:
select *
from (
	select
		client_id
		, name
		, (select sum(invoice_total) from invoices where client_id = c.client_id) as total_sales
		, (select avg(invoice_total) from invoices) as avg_invoice
		, (select total_sales - avg_invoice) as difference
	from
		clients c
) as sales_summary
where total_sales is not null
;
