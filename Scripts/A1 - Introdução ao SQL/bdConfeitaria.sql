USE bdConfeitaria
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = 'bdConfeitaria'
)
CREATE DATABASE DatabaseName

-- tbCliente

IF OBJECT_ID('idCliente', 'U') IS NOT NULL
DROP TABLE tbTipoDeco

CREATE TABLE tbCliente (
	idCliente INT PRIMARY KEY IDENTITY(1,1),
	nomeCliente VARCHAR(50) NOT NULL,
	cpfCliente NVARCHAR(11) NOT NULL,
	estadoCliente VARCHAR(20) NOT NULL,
	cidadeCliente VARCHAR(20) NOT NULL,
	bairroCliente VARCHAR(20) NOT NULL,
	cepCliente NVARCHAR(8) NOT NULL,
	logCliente VARCHAR(10) NOT NULL,
	compCliente VARCHAR(15) NOT NULL,
	numCliente INT NOT NULL
)

-- tbFoneCliente

IF OBJECT_ID('idFoneCliente', 'U') IS NOT NULL
DROP TABLE tbFoneCliente

CREATE TABLE tbFoneCliente (
	idFoneCliente INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente),
	numFoneCliente INT NOT NULL
)

-- tbCatProduto

IF OBJECT_ID('idCatProduto', 'U') IS NOT NULL
DROP TABLE tbCatProduto

CREATE TABLE tbCatProduto (
	idCatProduto INT PRIMARY KEY IDENTITY(1,1),
	nomeCatProduto VARCHAR(20) NOT NULL
)

-- tbProduto

IF OBJECT_ID('idProduto', 'U') IS NOT NULL
DROP TABLE tbProduto

CREATE TABLE tbProduto (
	idProduto INT PRIMARY KEY IDENTITY(1,1),
	idCatProduto INT FOREIGN KEY REFERENCES tbCatProduto(idCatProduto),
	nomeProduto VARCHAR(20) NOT NULL,
	descProduto VARCHAR(30) NOT NULL,
	valorProduto FLOAT NOT NULL
)

-- tbEncomenda

IF OBJECT_ID('idEncomendas', 'U') IS NOT NULL
DROP TABLE tbEncomenda 

CREATE TABLE tbEncomenda (
	idEncomenda INT PRIMARY KEY IDENTITY(1,1),
	idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto),
	idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente),
	valorProduto FLOAT NOT NULL,
	dataEntregaEncomenda SMALLDATETIME NOT NULL,
	dataPedidoEncomenda SMALLDATETIME NOT NULL,
)