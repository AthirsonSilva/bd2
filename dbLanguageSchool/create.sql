CREATE DATABASE bdEscolaIdiomas;

CREATE TABLE tbAluno (
	idAluno INT PRIMARY KEY IDENTITY(1, 1),
	nomeAluno VARCHAR(60) NOT NULL,
	dataNascAluno SMALLDATETIME NOT NULL,
	rgAluno CHAR(13) NOT NULL,
	naturalidadeAluno VARCHAR(60) NOT NULL,
);

CREATE TABLE tbTurma (
	idTurma INT PRIMARY KEY IDENTITY(1, 1),
	nomeTurma VARCHAR(60) NOT NULL,
	horarioTurma VARCHAR(60) NOT NULL,
)

CREATE TABLE tbMatricula (
	idMatricula INT PRIMARY KEY IDENTITY(1, 1),
	dataMatricula SMALLDATETIME NOT NULL,
	idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno),
	idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma),
);

CREATE TABLE tbCurso (
	idCurso INT PRIMARY KEY IDENTITY(1, 1),
	nomeCurso VARCHAR(60) NOT NULL,
	cargaHorarioCurso VARCHAR(60) NOT NULL,
	valorCurso SMALLMONEY NOT NULL,
);


ALTER TABLE tbTurma
ADD idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)

ALTER TABLE tbCurso 
ALTER COLUMN cargaHorarioCurso INT;

ALTER TABLE tbTurma
ALTER COLUMN horarioTurma SMALLDATETIME