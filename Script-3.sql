create table customer(
	customer_id serial primary key,
	ticket_id integer not null,
	concession_id integer not null,
	seat_id integer not null,
	foreign key (ticket_id) references tickets(ticket_id)
);
insert into customer(
	ticket_id,
	concession_id,
	seat_id
)values(
	1,
	2,
	3
),(
	2,
	4,
	1
);

select *
from customer

create table purchase(
	purchase serial primary key,
	concession_id integer,
	customer_id integer,
	foreign key(concession_id) references products_for_concession(item_id),
	foreign key(customer_id) references customer(customer_id)
);

drop table if exists tickets cascade;
create table tickets(
	movie_id serial primary key,
	pricing float not null,
	seat_num integer,
	customer_id integer,
	foreign key(customer_id) references customer(customer_id)
);
insert into tickets(
	pricing,
	seat_num
)values(
	8.50,
	1
),(
	10.50,
	2
),(
	7.50,
	3
);

select *
from tickets

drop table if exists products_for_concession;
create table products_for_concession(
	item_id serial primary key,
	pricing float not null,
	concession_items integer
);

insert into products_for_concession(
	pricing,
	concession_items
)values(
	5.50,
	10
),(
	6.20,
	15
),(
	4.20,
	10
);

select *
from products_for_concession
