use db_sales

select * from tb_fabricator
update tb_fabricator
set name_fabricator = 'Bauducco'
where name_fabricator like 'Visconti'

select * from tb_product
update tb_product
set price_product = price_product + ((20 * price_product) / 100)
where price_product < 19.00 

update tb_product
set price_product = price_product - ((5 * price_product) / 100)
where price_product >= 19.00

update tb_product
set price_product = price_product + ((5 * price_product) / 100)
where name_product like 'Ovo Tortuguita morango' or name_product like 'Ovo Twist' or name_product like 'Ovo Toy Story'

update tb_product
set name_product = 'Ovo Tradicional'
where id_product = 1000

delete from tb_product
where id_product > 1005 and 1005 < id_product

delete from tb_product
where weight_product < 400 and name_product not like 'Laka'
