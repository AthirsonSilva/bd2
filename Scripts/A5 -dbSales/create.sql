create database db_sales
use db_sales

create table tb_fabricator(
	id_fabricator int primary key identity(01,1),
	name_fabricator varchar(60) not null,
	cnpj_fabricator char(18) not null,
)

create table tb_product(
	id_product int primary key identity(1000,1),
	name_product varchar(60) not null,
	price_product smallmoney not null,
	weight_product int not null,
	id_fabricator int foreign key references tb_fabricator(id_fabricator)
)

