-- Teste
CREATE FUNCTION fcRetornaCliente(@codCliente INT)
RETURNS VARCHAR(40)
AS
BEGIN
	DECLARE @dadosCliente VARCHAR(40)
	SET @dadosCliente = (SELECT nomeCliente + ' de CPF: ' + cpfCliente FROM tbCliente WHERE codCliente = @codCliente)

	RETURN @dadosCliente
END

SELECT dadosCliente = dbo.fcRetornaCliente(1)

-- 1.
CREATE FUNCTION fcRetornaDiaSemanaVenda(@Data SMALLDATETIME)
RETURNS VARCHAR(40) AS
BEGIN
	DECLARE @diaSemana VARCHAR(40)
	DECLARE @dia INT
	
	SET @dia = DATEPART(dw, @Data)

	IF @dia = 1
	BEGIN
		SET @diaSemana = 'Domingo'
	END

	ELSE IF @dia = 2
	BEGIN
		SET @diaSemana = 'Segunda-Feira'
	END

	
	ELSE IF @dia = 3
	BEGIN
		SET @diaSemana = 'Terça-Feira'
	END

	
	ELSE IF @dia = 4
	BEGIN
		SET @diaSemana = 'Quarta-Feira'
	END

	
	ELSE IF @dia = 5
	BEGIN
		SET @diaSemana = 'Quinta-Feira'
	END

	
	ELSE IF @dia = 6
	BEGIN
		SET @diaSemana = 'Sexta-Feira'
	END

	
	ELSE IF @dia = 7
	BEGIN
		SET @diaSemana = 'Sábado'
	END

	RETURN @diaSemana
END

SELECT dbo.tbVenda.codVenda, dbo.tbVenda.valorTotalVenda, dbo.tbVenda.dataVenda, diaSemana = dbo.fcRetornaDiaSemanaVenda(dataVenda) FROM dbo.tbVenda

-- 2
CREATE FUNCTION fcRetornaTotalVendaCliente(@codCliente INT)
RETURNS INT
BEGIN
	DECLARE @totalVendasCliente INT
	SET @totalVendasCliente = (SELECT COUNT(dbo.tbVenda.codVenda) FROM dbo.tbVenda WHERE codCliente = @codCliente)

	RETURN @totalVendasCliente
END

SELECT totalVendasCliente = dbo.fcRetornaTotalVendaCliente(1)
