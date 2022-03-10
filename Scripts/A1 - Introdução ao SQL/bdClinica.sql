CREATE TABLE tbPaciente (
	idPaciente INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nomePaciente VARCHAR(50) NOT NULL,
	cpfPaciente NVARCHAR(11) NOT NULL,
	estadoPaciente VARCHAR(15) NOT NULL,
	cidadePaciente VARCHAR(15) NOT NULL,
	bairroPaciente VARCHAR(20) NOT NULL,
	cepPaciente NVARCHAR(8) NOT NULL,
	compPaciente VARCHAR(15) NOT NULL,
	logPaciente VARCHAR(10) NOT NULL,
	numPaciente INT NOT NULL
)

CREATE TABLE tbTelefonePaciente (
	idTelefonePaciente INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idPaciente INT NOT NULL FOREIGN KEY REFERENCES tbPaciente(idPaciente),
	numTelefonePaciente INT NOT NULL
)
--------------------------------------------------------------------------
CREATE TABLE tbDentista (
	idDentista INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nomeDentista VARCHAR(50) NOT NULL,
	cpfDentista NVARCHAR(11) NOT NULL
)

CREATE TABLE tbTelefoneDentista (
	idTelefoneDentista INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idDentista INT NOT NULL FOREIGN KEY REFERENCES tbDentista(idDentista),
	numTelefoneDentista INT NOT NULL
)
--------------------------------------------------------------------------
CREATE TABLE tbServicos (
	idServicos INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nomeServicos VARCHAR(20) NOT NULL
)
--------------------------------------------------------------------------
CREATE TABLE tbOrcamento (
	idOrcamento INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idPaciente INT NOT NULL FOREIGN KEY REFERENCES tbPaciente(idPaciente),
	idServicos INT NOT NULL FOREIGN KEY REFERENCES tbServicos(idServicos),
	dataOrcamentos SMALLDATETIME NOT NULL,
	valorTotalOrcamento FLOAT NOT NULL
)
--------------------------------------------------------------------------
CREATE TABLE tbFicha (
	idFicha INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idOrcamento INT NOT NULL FOREIGN KEY REFERENCES tbOrcamento(idOrcamento),
	idDentista INT NOT NULL FOREIGN KEY REFERENCES tbDentista(idDentista)
)
--------------------------------------------------------------------------
CREATE TABLE tbConsulta(
	idConsulta INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	idPaciente INT NOT NULL FOREIGN KEY REFERENCES tbPaciente(idPaciente),
	idDentista INT NOT NULL FOREIGN KEY REFERENCES tbDentista(idDentista),
	idServicos INT NOT NULL FOREIGN KEY REFERENCES tbServicos(idServicos),
	idOrcamento INT NOT NULL FOREIGN KEY REFERENCES tbOrcamento(idOrcamento),
	idFicha INT NOT NULL FOREIGN KEY REFERENCES tbFicha(idFicha),
	dataConsulta SMALLDATETIME NOT NULL
)
---------------------------------------------------------------------------