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

-- 3
CREATE FUNCTION fcRetornaVendaNoMes(
	@codCliente INT,
	@mes INT
)
RETURNS INT
BEGIN
	DECLARE @totalVendas INT
	SET @totalVendas = (SELECT COUNT(tbVenda.codCliente) FROM tbVenda 
		WHERE codCliente = @codCliente AND MONTH(tbVenda.dataVenda) = @mes)

	RETURN @totalVendas
END

SELECT totalVendasMes = dbo.fcRetornaVendanoMes(1, 8)

-- 4
CREATE FUNCTION fcValidaCPF(@CPF CHAR(11))
RETURNS CHAR(1)
AS
BEGIN
	DECLARE @INDICE INT,
	@SOMA INT,
	@DIG1 INT,
	@DIG2 INT,
	@CPF_TEMP VARCHAR(11),
	@DIGITOS_IGUAIS CHAR(1),
	@RESULTADO CHAR(1)
	SET @RESULTADO = 'N'
	/*
	Verificando se os digitos são iguais
	A Principio CPF com todos o números iguais são Inválidos
	apesar de validar o Calculo do digito verificado
	EX: O CPF 00000000000 é inválido, mas pelo calculo
	Validaria
	*/
	SET @CPF_TEMP = SUBSTRING(@CPF,1,1)
	SET @INDICE = 1
	SET @DIGITOS_IGUAIS = 'S'
	WHILE (@INDICE <= 11)
	BEGIN
	IF SUBSTRING(@CPF,@INDICE,1) <> @CPF_TEMP
		SET @DIGITOS_IGUAIS = 'N'
		SET @INDICE = @INDICE + 1
	END;
	--Caso os digitos não sejão todos iguais Começo o calculo do digitos
	IF @DIGITOS_IGUAIS = 'N'
	BEGIN
		--Cálculo do 1º dígito
		SET @SOMA = 0
		SET @INDICE = 1
		WHILE (@INDICE <= 9)
		BEGIN
			SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1)) * (11 - @INDICE);
			SET @INDICE = @INDICE + 1
		END
		SET @DIG1 = 11 - (@SOMA % 11)
		IF @DIG1 > 9
		SET @DIG1 = 0;
		-- Cálculo do 2º dígito }
		SET @SOMA = 0
		SET @INDICE = 1
		WHILE (@INDICE <= 10)
		BEGIN
			SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1)) * (12 - @INDICE);
			SET @INDICE = @INDICE + 1
		END
		SET @DIG2 = 11 - (@SOMA % 11)
		IF @DIG2 > 9
			SET @DIG2 = 0;
		-- Validando
		IF (@DIG1 = SUBSTRING(@CPF,LEN(@CPF)-1,1)) AND (@DIG2 =
			SUBSTRING(@CPF,LEN(@CPF),1))
			SET @RESULTADO = 'S'
		ELSE
			SET @RESULTADO = 'N'
		END
	RETURN @RESULTADO
END

DECLARE @cpfCliente CHAR(11) 
SET @cpfCliente = (SELECT tbCliente.cpfCliente FROM tbCliente WHERE tbCliente.codCliente = 1)

SELECT validaCpf = dbo.fcValidaCPF(@cpfCliente)
