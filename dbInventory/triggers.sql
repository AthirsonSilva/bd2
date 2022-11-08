use bdEstoque

alter trigger tgShowStuff on tbFornecedor
for insert
as
	declare @codFornecedor int, @nomeFornecedor varchar(60)

	set @codFornecedor = (select max(codFornecedor) from tbFornecedor)
	set @nomeFornecedor = (select nomeFornecedor from INSERTED)

	print('Fornecedor do código: (' + convert(varchar(60), @codFornecedor) + ') e do nome: "' + @nomeFornecedor + '" foi cadastrado com sucesso!')

insert into tbFornecedor (nomeFornecedor, contatoFonecedor)
values ('Zezin do Jamal', 'jamalzezin@gmail.net')

-- 1
alter trigger tgAtualizaVenda on tbItensVenda after insert
as
	declare @qtdProdutos int, @codVenda int, @codProduto int
	set @codVenda = (select codVenda from INSERTED)
	select @qtdProdutos = quantidadeItensVenda from inserted
	set @codProduto = (select codProduto from tbItensVenda where codVenda = @codVenda)
	update tbProduto
		set quantidadeProduto = quantidadeProduto + @qtdProdutos
		where codProduto = @codProduto

select * from tbItensVenda
select * from tbProduto
select * from tbVenda

insert into tbItensVenda (codProduto,codVenda, quantidadeItensVenda, subTotalItensVenda)
values
	(1, 2, 4, 125.00)

-- 2
alter trigger tgAtualizaEntrada on tbEntradaProduto after insert
as
	declare @qtdProdutos int, @codProduto int, @codEntradaProduto int

	set @qtdProdutos = (select quantidadeEntradaProduto from inserted)
	set @codEntradaProduto = (select codEntradaProduto from inserted)
	set @codProduto = (select codProduto from tbEntradaProduto where codEntradaProduto = @codEntradaProduto)

	update tbProduto
		set quantidadeProduto = quantidadeProduto + @qtdProdutos
		where codProduto = @codProduto

-- 3
alter trigger tgAtualizaEntrada on tbItensVenda after insert
as
	declare @qtdProdutos int, @codProduto int, @dataSaidaProduto int

	set @qtdProdutos = (select quantidadeItensVenda from inserted)
	set @dataSaidaProduto = getdate()
	set @codProduto = (select codProduto from tbEntradaProduto where codEntradaProduto = @codEntradaProduto)

	insert into tbSaidaProduto (dataSaidaProduto, codProduto, quantitadadeSaidaProduto)
	values (@dataSaidaProduto, @codProduto, @qtdProdutos)
