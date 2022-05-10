create database dbOutifitStore

use dbOutifitStore

create table tbClient(
	idClient int primary key identity(1, 1),
	nameClient varchar(60) not null,
	ageClient int not null
)

create table tbFabricator(
	idFabricator int primary key identity(1, 1),
	nameFabricator varchar(60) not null
)

create table tbEmployer(
	idEmployer int primary key identity(1, 1),
	nameEmployer varchar(60) not null,
	ageEmployer int not null,
	admissionDate smalldatetime not null,
	salaryEmployer smallmoney not null
)

create table tbSaler(
	idSaler int primary key identity(1, 1),
	nameSaler varchar(60) not null
)

create table tbSale(
	idSale int primary key identity(1, 1),
	idClient int foreign key references tbClient(idClient),
	idSaler int foreign key references tbSaler(idSaler),
	totalSales smallmoney not null
)

create table tbProduct(
	idProduct int primary key identity(1, 1),
	idEmployer int foreign key references tbEmployer(idEmployer),
	idFabricator int foreign key references tbFabricator(idFabricator),
	nameProduct varchar(60) not null,
	priceProduct smallmoney not null,
	entryDateProduct smalldatetime not null
)

create table tbSaleItens(
	idSaleItens int primary key identity(1, 1),
	idSale int foreign key references tbSale(idSale),
	idProduct int foreign key references tbProduct(idProduct),
	quantityItens int not null,
	subTotalItens int not null
)