USE bdEstoque

-- 1.
SELECT tbProduto.codProduto, tbProduto.descricaoProduto, tbProduto.valorProduto, tbFabricante.nomeFabricante 
FROM tbProduto
INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE tbProduto.valorProduto = (SELECT MAX(tbProduto.valorProduto) FROM tbProduto)

-- 2.
SELECT AVG(tbProduto.valorProduto) FROM tbProduto

SELECT tbProduto.descricaoProduto, tbProduto.valorProduto, tbFabricante.nomeFabricante 
FROM tbProduto
INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE tbProduto.valorProduto >= (SELECT AVG(tbProduto.valorProduto) FROM tbProduto)

-- 3.
SELECT AVG(tbVenda.valorTotalVenda) FROM tbVenda

SELECT tbCliente.nomeCliente, tbVenda.valorTotalVenda
FROM tbCliente
INNER JOIN tbVenda
	ON tbVenda.codCliente = tbCliente.codCliente
	WHERE tbVenda.valorTotalVenda >= (SELECT AVG(tbVenda.valorTotalVenda) FROM tbVenda)

-- 4.
SELECT tbProduto.descricaoProduto, tbProduto.valorProduto 
FROM tbProduto
	WHERE tbProduto.valorProduto IN (SELECT MAX(tbProduto.valorProduto) FROM tbProduto)

-- 5.
SELECT tbProduto.descricaoProduto, tbProduto.valorProduto 
FROM tbProduto
	WHERE tbProduto.valorProduto IN (SELECT MIN(tbProduto.valorProduto) FROM tbProduto)
 
----- Another one
-- 1.
SELECT tbProduto.codProduto, tbProduto.descricaoProduto, tbFabricante.nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE tbProduto.valorProduto = (SELECT MAX(tbProduto.valorProduto) FROM tbProduto)

-- 2.
SELECT tbProduto.valorProduto, tbProduto.descricaoProduto, tbFabricante.nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE tbProduto.valorProduto >= (SELECT AVG(tbProduto.valorProduto) FROM tbProduto)

-- 3.
SELECT tbCliente.nomeCliente FROM tbCliente
INNER JOIN tbVenda ON tbCliente.codCliente = tbVenda.codCliente
	WHERE tbVenda.valorTotalVenda >= (SELECT AVG(tbVenda.valorTotalVenda) FROM tbVenda)