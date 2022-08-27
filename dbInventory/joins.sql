USE bdEstoque

-- 1.
SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto
FROM tbFornecedor
INNER JOIN tbProduto ON tbFornecedor.codFornecedor = tbProduto.codFornecedor

-- 2.
SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto
FROM tbFornecedor
LEFT JOIN tbProduto ON tbFornecedor.codFornecedor = tbProduto.codFornecedor

-- 3.
SELECT tbProduto.descricaoProduto, tbFornecedor.nomeFornecedor
FROM tbProduto
RIGHT JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

-- 4.
SELECT tbProduto.descricaoProduto, tbFornecedor.nomeFornecedor
FROM tbProduto
FULL JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor

-- 5.
SELECT tbProduto.descricaoProduto, tbFornecedor.nomeFornecedor
FROM tbProduto
CROSS JOIN tbFornecedor 
