#use sql_invoicing; 

drop procedure if exists get_clients;
delimiter $$
create procedure get_clients()
begin
	select * from clients;
end $$
delimiter ; #get_clients

## call procedure in other sql scripts:
call get_clients();

drop procedure if exists get_payments;

delimiter $$
create procedure get_payments (
	client_id INT,
    payment_method TINYINT
)
begin
	select *
    from payments p
    where p.client_id = ifnull(client_id, p.client_id)
		and p.payment_method = ifnull(payment_method, p.payment_method)
	;
end $$

delimieter ;



