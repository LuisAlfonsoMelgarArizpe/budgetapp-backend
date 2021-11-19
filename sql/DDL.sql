create table users(
	id serial primary key ,
	name varchar not null,
	email varchar not null,
	password varchar not null,
	register_date timestamp not null default NOW()
);

create table category(
	category_id serial primary key,
	user_id int not null,
	category varchar not null,
	constraint fk_user_category_user foreign key (user_id) references users(id)
);

create table account_type(
	account_type_id serial primary key,
	type varchar not null
);

create table currency(
	currency_id serial primary key,
	currency varchar not null,
	rate float not null
);


create table account(
	account_id serial primary key,
	bank varchar not null,
	account_type_id int not null,
	number varchar not null,
	user_id int not null,
	balance float not null,	
	constraint fk_account_type_account foreign key (account_type_id) references account_type(account_type_id),
	constraint fk_account_user foreign key (user_id) references users(id)
);

create table account_currency(
	account_id int not null,
	currency_id int not null,
	constraint fk_account_currency_account foreign key (account_id) references account(account_id),
	constraint fk_account_currency_currency foreign key (currency_id) references currency(currency_id),
	primary key (account_id, currency_id)
);


create table operation_type(
	operation_type_id int null primary key,
	operation_type varchar not null
);

create table operation(
	operation_id int not null,
	operation_type_id int not null,
	account_id int not null,
	currency_id int not null,
	quantity float not null,
	currency_cuantity float not null,
	operation_date timestamp not null,
	category varchar not null,
	description varchar not null,
	constraint fk_opreation_type_opreation foreign key (operation_type_id) references operation_type(operation_type_id),
	constraint fk_operation_account foreign key (account_id) references account(account_id),
	constraint fk_operation_currency foreign key (currency_id) references currency(currency_id)	
);



insert into account_type(type) values ('Savings');
insert into account_type(type) values ('Monetary');

insert into account(bank,account_type,number,user_id,balance) values ('Banco Industrial',1,'555555',1,111.11)

select * from category;



insert into currency(currency,rate) VALUES('USD',7)

insert into account_currency VALUES(1,1);

select * from account_currency;

select * from account;

select * from users;

select * from operation;

delete from users;

