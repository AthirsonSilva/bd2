use db_sales

select * from tb_fabricator

insert into tb_fabricator(name_fabricator, cnpj_fabricator)
values
	('Visconti', '12.345.878/0001-90'),
	('Lacta', '34.567.989/0001-34'),
	('Garoto', '56.784.564/0001-93'),
	('Nestle', '98.543.234/0001-03'),
	('Arcor', '14.545.765/0002-65'),
	('Topcau', '43.876.543/0001-76');

select * from tb_product

insert into tb_product(name_product, price_product, weight_product, id_fabricator)
values 
	('Ovo ao leite', 19.50, 300, 01),
	('Ovo bis', 22.90, 400, 02),
	('Ovo Laka', 21.98, 400, 02),
	('Ovo Shot', 24.56, 400, 02),
	('Ovo Batom ao leit', 26.70, 500, 03),
	('Ovo Batom branco', 28.90, 500, 03),
	('Ovo Tortuguita morango', 18.90, 400, 04),
	('Ovo Aerado', 19.00, 400, 04),
	('Ovo Twist', 19.90, 400, 02),
	('Ovo Toy Story',12.50, 100, 05);