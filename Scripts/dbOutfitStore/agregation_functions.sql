USE dbOutifitStore

-- Apresente o total de fabricantes cadastrados no banco de dados.
SELECT nameFabricator FROM tbFabricator
SELECT COUNT(nameFabricator) FROM tbFabricator

-- Apresente o número de funcionários cadastrados.
SELECT nameEmployer FROM tbEmployer
SELECT COUNT(nameEmployer) FROM tbEmployer

-- Selecione e apresente o total de clientes cadastrados.
SELECT nameClient FROM tbClient
SELECT COUNT(nameClient) FROM tbClient

-- Calcule e apresente a média aritmética dos preços de todos os produtos cadastrados.
SELECT priceProduct FROM tbProduct
SELECT AVG(priceProduct) FROM tbProduct

-- Calcule o preço da maior venda realizada.
SELECT totalSales FROM tbSale
SELECT MAX(totalSales) FROM tbSale

-- Calcule e apresente o valor da menor venda.
SELECT totalSales FROM tbSale
SELECT MIN(totalSales) FROM tbSale

-- Apresente o valor do menor produto cadastrado.
SELECT priceProduct FROM tbProduct
SELECT MIN(priceProduct) FROM tbProduct

-- Apresente o valor do maior produto cadastrado. 
SELECT priceProduct FROM tbProduct
SELECT MAX(priceProduct) FROM tbProduct

-- Calcule o total de vendas realizadas.
SELECT totalSales FROM tbSale
SELECT COUNT(totalSales) FROM tbSale

-- Calcule a soma de todas as vendas.
SELECT totalSales FROM tbSale
SELECT SUM(totalSales) FROM tbSale

-- Calcule a média de todas as vendas.
SELECT totalSales FROM tbSale
SELECT AVG(totalSales) FROM tbSale
