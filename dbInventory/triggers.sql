use bdEstoque

create trigger tgAtualizaVenda on tbItensVenda for insert
as
	declare @qtdProdutos int, @codVenda int, @codProduto int
	set @codVenda = (select codVenda from inserted)
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