


USE bdBancoEtec



CREATE TABLE tbCorrentista
(
    idCorrentista INT IDENTITY(1,1) PRIMARY KEY
    , nomeCorrentista VARCHAR(60) NOT NULL
    , dataNascCorrentista SMALLDATETIME NOT NULL
    , cpfCorrentista VARCHAR(14) NOT NULL
    , rgCorrentista VARCHAR(13) NOT NULL
)



CREATE TABLE tbContaPoupanca
(
    idContaPoupanca INT IDENTITY(1,1) PRIMARY KEY
    , numeroAgenciaCP VARCHAR(4) NOT NULL
    , numeroCP VARCHAR(7) NOT NULL
    , digitoCP VARCHAR(1) NOT NULL
    , saldoCP MONEY NOT NULL
    , dataAberturaCP SMALLDATETIME NOT NULL
    , idCorrentista INT FOREIGN KEY REFERENCES tbCorrentista(idCorrentista)
)



CREATE TABLE tbContaCorrente
(
    idContaCorrente INT PRIMARY KEY IDENTITY(1,1) 
    , numeroAgenciaCC VARCHAR(4) NOT NULL
    , digitoCC VARCHAR(8) NOT NULL
    , senhaNumericaCC VARCHAR(16) NOT NULL
    , saldoCC SMALLMONEY NOT NULL
    , dataAberturaCC DATE NOT NULL
    , idCorrentista INT FOREIGN KEY REFERENCES tbCorrentista(idCorrentista)

)


SELECT * FROM tbCorrentista

DROP TABLE tbContaCorrente

ALTER TABLE tbCorrentista
	ALTER COLUMN dataNascCorrentista DATE NOT NULL


ALTER TABLE tbContaCorrente
	ADD senhaAlfanumericaCC VARCHAR(60) NOT NULL

ALTER TABLE tbContaCorrente
	ALTER COLUMN dataAberturaCC DATE NOT NULL

ALTER TABLE tbContaCorrente
	ALTER COLUMN digitoCC VARCHAR(12) NOT NULL


ALTER TABLE tbContaCorrente
	ALTER COLUMN senhaNumericaCC VARCHAR(16) NOT NULL


ALTER TABLE tbContaCorrente
	ADD numeroCC DECIMAL(3, 3) NOT NULL


ALTER TABLE tbContaPoupanca
	ALTER COLUMN dataAberturaCP DATE NOT NULL


INSERT INTO tbCorrentista(nomeCorrentista, dataNascCorrentista, cpfCorrentista, rgCorrentista)
VALUES('Rogerio Ceni', '1965-05-15 00:00:00', '123.456.789-00', '12.545.122-01'),
('Raí Vieira de Oliveira', '1965-05-15 00:00:00', '232.322.321-99', '19.332.232-10'),
('Armelindo Donizetti', '1965-10-10 00:00:00', '222.333.232-0', '12.433.233-00')



INSERT INTO tbContaCorrente(numeroAgenciaCC, numeroCC, digitoCC, senhaNumericaCC, senhaAlfanumericaCC, salcoCC, dataAberturaCC, idCorrentista)
VALUES('1021', '123.122', '11', '111111', '6B3L3M', '100000.00', '2017-10-10 00:00:00', 1),
('1022', '212.121', '12', '12211', '2x1SP', '90000.00', '2014-12-12 00:00:00', 2),
('1021', '123.121', '11', '123456', '01MITO', '1200000.00', '2017-05-10 00:00:00', 1),
('1021', '324.544', '10', '839222', 'ZETT01', '23498.00', '2015-05-10 00:00:00', 3);


INSERT INTO tbContaPoupanca(numeroAgenciaCP, numeroCP, digitoCP, saldoCP, dataAberturaCP, idCorrentista)
VALUES
	('1021', '434433', '4', '2000000,00', '2017-06-10 00:00:00', 16),
	('1022', '322222', '5', '4000000,00', '2017-05-10 00:00:00', 17),
	('1021', '232222', '6', '220000,00', '2017-04-10 00:00:00', 18);
