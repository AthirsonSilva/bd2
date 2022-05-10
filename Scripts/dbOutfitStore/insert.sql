use dbOutifitStore

select * from tbFabricator

insert into tbFabricator(nameFabricator)
values
	('Malwee'),
	('Marisol'),
	('Cia da Malha')

select * from tbProduct 
insert into tbProduct(idEmployer, idFabricator, nameProduct, priceProduct, entryDateProduct)
values 
	(1, 1, 'Scikit-learn', 00.00, 2002-12-12),
	(1, 1, 'Pandas', 00.00, 2002-12-12),
	(1, 1, 'Seaborn', 00.00, 2002-12-12),
	(2, 2, 'TensorFlow', 00.00, 2002-12-12),
	(2, 2, 'MatplotLib', 00.00, 2002-12-12),
	(2, 2, 'Numpy', 00.00, 2002-12-12),
	(2, 3, 'Keras', 00.00, 2002-12-12),
	(2, 3, 'Plotly', 00.00, 2002-12-12),
	(2, 3, 'PyTorch', 00.00, 2002-12-12)

select * from tbEmployer
insert into tbEmployer(nameEmployer, ageEmployer, admissionDate, salaryEmployer)
values
	('Python2', 22, 2000-12-12, 5250.50),
	('Python3', 14, 2000-12-12, 10275.25)


select * from tbClient
insert into tbClient(nameClient, ageClient)
values
	('Python3.10', 22),
	('Python3.11', 22)

select * from tbSaler
insert into tbSaler(nameSaler)
values
	('Pyhon3.10.4'),
	('Python3.11.0a')

select * from tbSale
insert into tbSale(idClient, idSaler, totalSales)
values
	(1, 1, 1250.00),
	(2, 2, 2000.00)

update tbSaler
set nameSaler = 'João Santana'
where idSaler = 1

update tbSaler
set nameSaler = 'Raquel Torres'
where idSaler = 2

select * from tbSaleItens
insert into tbSaleitens(idSale, idProduct, quantityitens, subTotalItens)
values
	(1, 1, 1, 0),
	(1, 4, 1, 0),
	(2, 7, 1, 0),
	(2, 9, 1, 0)