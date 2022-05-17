use dbOutifitStore

select * from tbFabricator
update tbFabricator
set nameFabricator = 'Turma da Malha'
where idFabricator = 3

select * from tbSale
update tbSale
set totalSales = totalSales + (totalSales * 0.1)
where idClient = 1

select * from tbProduct
update tbProduct 
set priceProduct = priceProduct + (priceProduct * 0.2)
where idFabricator = 2

select * from tbSaleItens
update tbSaleItens
set quantityItens = quantityItens - 10
where idProduct = 3

select * from tbSaleItens
delete from tbSaleItens
where idSaleItens = 2 and idSale = 2

select * from tbSaleItens
delete from tbSaleItens
where idSale = 3

select * from tbFabricator
delete from tbFabricator 
where idFabricator = 1

select * from tbProduct
delete from tbSaleItens
where idProduct = 1

select * from tbProduct
delete from tbProduct
where idProduct = 1
