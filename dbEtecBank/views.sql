use EtecBank

create view vwTotalBalance as
	select dbo.accountHolder.name holder, dbo.checkingAccount.balance ccBalance, dbo.savingAccount.balance sBalance, dbo.savingAccount.balance + dbo.savingAccount.balance sumBalance
	from dbo.accountHolder
		inner join dbo.checkingAccount on dbo.accountHolder.id = dbo.checkingAccount.accountHolderID
		inner join dbo.savingAccount on dbo.checkingAccount.accountHolderID = dbo.savingAccount.accountHolderID

select * from vwTotalBalance order by holder ASC

create view vwSavingBalanceProjection as
	select dbo.accountHolder.name holder, dbo.savingAccount.balance / 0.5 projection
		from dbo.accountHolder
			inner join dbo.savingAccount on dbo.accountHolder.id = dbo.savingAccount.accountHolderID

select * from vwSavingBalanceProjection

create view vwShowHolder as
	select dbo.accountHolder.name holder, dbo.checkingAccount.agencyNumber, dbo.checkingAccount.number, dbo.checkingAccount.digit, dbo.checkingAccount.balance, dbo.checkingAccount.createdAt, dbo.checkingAccount.accountHolderID
	from dbo.accountHolder
		inner join dbo.checkingAccount on dbo.accountHolder.id = dbo.checkingAccount.accountHolderID

select * from vwShowHolder

