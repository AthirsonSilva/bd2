


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
    idContaCorrente INT IDENTITY(1,1) PRIMARY KEY
    , numeroAgenciaCC VARCHAR(4) NOT NULL
    , digitoCC VARCHAR NOT NULL
    , senhaNumericaCC VARCHAR NOT NULL
    , salcoCC MONEY NOT NULL
    , dataAberturaCC SMALLDATETIME NOT NULL
    , idCorrentista INT FOREIGN KEY REFERENCES tbCorrentista(idCorrentista)

)


ALTER TABLE tbContaCorrente
	ADD senhaAlfanumericaCC INT NOT NULL

ALTER TABLE tbContaCorrente
	ADD numeroCC DECIMAL(3, 3) NOT NULL
