-- Write your own SQL object definition here, and it'll be included in your package.
-- Create a new database called 'DatabaseName'
-- Connect to the 'master' database to run this snippet
USE bdCasamento
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'bdCasamento'
)
CREATE DATABASE DatabaseName
GO
-- Writing the database

GO
IF OBJECT_ID('tbTipoDeco', 'U') IS NOT NULL
DROP TABLE tbTipoDeco
GO
-- Create the table in the specified schema
CREATE TABLE tbTipoDeco
(
    descTipoDeco INT NOT NULL PRIMARY KEY, -- primary key column
    -- specify more columns here
);

IF OBJECT_ID('tbCasamento', 'U') IS NOT NULL
DROP TABLE tbCasamento
GO
-- Create the table in the specified schema
CREATE TABLE tbCasamento
(
    idCasamento INT NOT NULL PRIMARY KEY, -- primary key column
    dataCasamento SMALLDATETIME NOT NULL,
    descTipoDeco INT NOT NULL FOREIGN KEY REFERENCES tbTipoDeco(descTipoDeco),
    -- specify more columns here
);

GO
IF OBJECT_ID('tbPadrinho', 'U') IS NOT NULL
DROP TABLE tbPadrinho
GO
-- Create the table in the specified schema
CREATE TABLE tbPadrinho
(
    cpfPadrinho INT NOT NULL PRIMARY KEY, -- primary key column
    nomePadrinho VARCHAR (50) NOT NULL,
    idadePadrinho INT NOT NULL,
    civilPadrinho VARCHAR (15) NOT NULL
    -- specify more columns here
);

GO
IF OBJECT_ID('tbNoivo', 'U') IS NOT NULL
DROP TABLE tbNoivo
GO
-- Create the table in the specified schema
CREATE TABLE tbNoivo
(
    cpfNoivo INT NOT NULL PRIMARY KEY, -- primary key column
    nomeNoivo VARCHAR (50) NOT NULL,
    nascNoivo SMALLDATE NOT NULL
    -- specify more columns here
);
GO
