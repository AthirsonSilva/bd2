-- Teste
CREATE FUNCTION fcRetornaCliente(@codCliente INT)
RETURNS VARCHAR(40)
AS
BEGIN
	DECLARE @dadosCliente VARCHAR(40)
	SET @dadosCliente = (SELECT nomeCliente + ' de CPF: ' + cpfCliente FROM tbCliente WHERE codCliente = @codCliente)

	RETURN @dadosCliente
END

SELECT myFunction = dbo.fcRetornaCliente(1)

