use EtecBank

create view vwSaldoTotal as
	select dbo.accountHolder.name holder, dbo.checkingAccount.balance ccBalance, dbo.savingAccount.balance sBalance, dbo.savingAccount.balance + dbo.savingAccount.balance sumBalance
	from dbo.accountHolder
		inner join dbo.checkingAccount on dbo.accountHolder.id = dbo.checkingAccount.accountHolderID
		inner join dbo.savingAccount on dbo.checkingAccount.accountHolderID = dbo.savingAccount.accountHolderID

select * from vwSaldoTotal order by holder ASC

create view vwProjecaoSaldoPoupanca as
	select dbo.accountHolder.name holder, dbo.savingAccount.balance / 0.5 projection
		from dbo.accountHolder
			inner join dbo.savingAccount on dbo.accountHolder.id = dbo.savingAccount.accountHolderID

select * from vwProjecaoSaldoPoupanca

create view vwExibeCorrentista as
	select dbo.accountHolder.name holder, dbo.checkingAccount.agencyNumber, dbo.checkingAccount.number, dbo.checkingAccount.digit, dbo.checkingAccount.balance, dbo.checkingAccount.createdAt, dbo.checkingAccount.accountHolderID
	from dbo.accountHolder
		inner join dbo.checkingAccount on dbo.accountHolder.id = dbo.checkingAccount.accountHolderID

select * from vwExibeCorrentista

create view vwCorrentistaConta as
	select dbo.accountHolder.name, dbo.checkingAccount.number, dbo.checkingAccount.balance
	from dbo.accountHolder
		inner join dbo.checkingAccount on dbo.accountHolder.id = dbo.checkingAccount.accountHolderID 
			where dbo.checkingAccount.balance > 500000.00
			
select * from vwCorrentistaConta

create view vwCorrentePoupança as
	select dbo.accountHolder.name, dbo.accountHolder.cpf, dbo.checkingAccount.balance ccBalance, dbo.savingAccount.balance saBalance
	from dbo.accountHolder	
		inner join dbo.checkingAccount on dbo.accountHolder.id = dbo.checkingAccount.accountHolderID
		inner join dbo.savingAccount on dbo.savingAccount.accountHolderID = dbo.checkingAccount.accountHolderID

select * from vwCorrentePoupança

create view vwClienteProdutos as
	select dbo.accountHolder.name holder, COUNT(dbo.checkingAccount.id) accounts
	from dbo.accountHolder
		inner join dbo.checkingAccount on dbo.checkingAccount.accountHolderID = dbo.accountHolder.id
		group by dbo.accountHolder.name

select * from vwClienteProdutos

		                     
