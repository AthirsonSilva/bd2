create database dbInvetory2

use dbInvetory2

create table tb_client (
	id_client int primary key identity(1,1),
	name_client varchar(70) not null,
	cpf_client char(11) not null,
	email_client varchar(40) not null,
	gender_client char(1) not null,
	birth_date_client smalldatetime not null
)

create table tb_sale (
	id_sale int primary key identity(1,2),
	date_sale smalldatetime not null,
	total_value_sale float not null,
	id_client int foreign key references tb_client(id_client)
)

create table tb_provider (
	id_provider int primary key identity(1,1),
	name_provider varchar(70) not null,
	contact_provider varchar(50) not null
)

create table tb_producer (
	id_producer int primary key identity(1,1),
	name_producer varchar(70) not null
)

create table tb_product (
	id_product int primary key identity(1,1),
	description_product varchar(50) not null,
	value_product float not null,
	quantity_product int not null,
	id_producer int foreign key references tb_producer(id_producer),
	id_provider int foreign key references tb_provider(id_provider)
)

create table tb_sale_items (
	id_sale_items int primary key identity(1,1),
	id_sale int foreign key references tb_sale(id_sale),
	id_product int foreign key references tb_product(id_product),
	sub_total_sale_items float not null,
	quantity_sale_items int not null
)

select * from tb_client
insert into tb_client (
	name_client, 
	cpf_client, 
	email_client, 
	gender_client, 
	birth_date_client
) 
values 
(
'Amando Jos� Santana',
'12345678900',
'amandojsantana@outlook.com',
'm',
'02-21-1961'
),
(
'Sheila Carvalho Leal',
'45678909823',
'scarvalho@ig.com.br',
'f',
'09-13-1978'
),
(
'Carlos Henrique Souza',
'76598278299',
'chenrique@ig.com.br',
'm',
'09-08-1981'
),
(
'Maria Aparecida Souza',
'87365309899',
'mapdasouza@outlook.com',
'f',
'07-07-1962'
),
(
'Adriana Nogueira Silva',
'76354309388',
'drica1977@ig.com.br',
'f',
'04-09-1977'
),
(
'Paulo Henrique SIlva',
'87390123111',
'phsilva80@hotmail.com',
'm',
'02-02-1987'
);

select * from tb_sale
insert into tb_sale (date_sale, total_value_sale, id_client)
values 
	('02-01-2014', 4500.00, 1),
	('02-03-2014', 3400.00, 1), 
	('02-10-2014', 2100.00, 2),
	('02-15-2014', 2700.00, 3),
	('03-17-2014', 560.00, 3),
	('04-09-2014', 1200.00, 4),
	('05-07-2014', 3500.00, 5),
	('05-07-2014', 3400.00, 1),
	('05-05-2014', 4000.00, 2);

select * from tb_provider
insert into tb_provider (name_provider, contact_provider) 
values 
	('Atacadao', 'Carlos Santos'),
 	('Assai', 'Maria Stela'),
 	('Roldao', 'Paulo Cesar');

select * from tb_producer 
insert into tb_producer (name_producer)
values
 	('Unilever'),
 	('P&G'),
 	('Bunge');

select * from tb_product
insert into tb_product (description_product, value_product, quantity_product, id_producer, id_provider)
values 
(
	'Amaciante Downy', 
	5.76,
	1500,
	2,
	1
),
(
	'Amaciante Downy', 
	5.76,
	1500,
	2,
	1
),
(
	'Amaciante Downy', 
	5.76,
	1500,
	2,
	1
),
(
	'Amaciante Comfort', 
	5.45,
	2300,
	1,
	1
),
(
	'Sabao em po OMO', 
	5.99,
	1280,
	1,
	2
),
(
	'Margarina Qually', 
	4.76,
	2500,
	3,
	1
),
(
	'Salsicha Hot Dog Sadia', 
	2.50,
	1200,
	3,
	3
),
(
	'Mortadela Perdigao', 
	2.50,
	1200,
	3,
	3
),

(
	'Hamburguer Sadia', 
	9.89,
	1600,
	3,
	1
),
(
	'Fralda Pampers', 
	36.00,
	340,
	2,
	3
),
(
	'Xampu Seda', 
	5.89,
	800,
	1,
	2
),
(
	'Condicionar Seda', 
	6.50,
	700,
	1,
	3
);

select * from tb_sale_items
insert into tb_sale_items (id_sale, id_product, sub_total_sale_items, quantity_sale_items)
values
	(1, 1, 200, 1500),
	(1, 2, 300, 3000),
	(2, 4, 120, 1400),
	(2, 2, 200, 1000),
	(2, 3, 130, 1000),
	(3, 5, 200, 2100),
	(4, 4, 120, 1000),
	(4, 5, 450, 700),
	(5, 5, 200, 560),
	(6, 7, 200, 600),
	(6, 6, 300, 600),
	(8, 1, 300, 2500),
	(8, 2, 200, 1000),
	(9, 6, 250, 1700),
	(9, 5, 200, 1700),
	(10, 4, 1000, 4000);