-- Write your own SQL object definition here, and it'll be included in your package.
-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE bdEmpresa
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'bdEmpresa'
)
CREATE DATABASE DatabaseName
GO

CREATE TABLE tbDepartamento(
	idDepartamento INT PRIMARY KEY IDENTITY(1,1),
	nomeDepartamento VARCHAR(40) NOT NULL
)

create table tbFuncionario(
	idFuncionario INT PRIMARY KEY IDENTITY (1,1),
	nomeFuncionario VARCHAR(50),
	dnFuncionario SMALLDATETIME NOT NULL,
	cpfFuncionario char(14),
	idDepartamento INT FOREIGN KEY REFERENCES tbDepartamento(idDepartamento),
)

create table tbDependente(
	idDependente INT PRIMARY KEY IDENTITY (1,1),
	nomeDependente VARCHAR(50),
    dnDependente SMALLDATETIME NOT NULL,
    idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario)
)