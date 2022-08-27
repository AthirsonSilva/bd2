USE bdEscolaIdiomas;

SELECT * FROM tbAluno;

INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
VALUES 
	('Paulo Santos', '2003-03-10', '82.202.122-0', 'SP'),
	('Maria da Gloria', '1999-10-03', '45.233.123-0', 'SP'),
	('Pedro Nougueira da Silva', '1998-04-04', '23.533.211.9', 'SP'),
	('Gilson Barros Silva', '1995-09-09', '34.221.111-X', 'PE'),
	('Mariana Barbosa Santos', '2001-10-10', '54.222.122.9', 'RJ'),
	('Alessando Pereira', '2003-10-11', '24.402.454-9', 'ES'),
	('Aline Melo', '2001-10-08', '89.365.012-3', 'RJ')

SELECT * FROM tbCurso;

INSERT INTO tbCurso(nomeCurso, cargaHorarioCurso, valorCurso)
VALUES
	('Inglês', 2000, 356.00),
	('Alemão', 3000, 478.00),
	('Espanhol', 4000, 500.00)

SELECT * FROM tbTurma;

INSERT INTO tbTurma(nomeTurma, horarioTurma, idCurso)
VALUES
	('1|A', '12:00:00', 1),
	('1|C', '18:00:00', 3),
	('1|B', '18:00:00', 1),
	('1AA', '19:00:00', 2)

SELECT * FROM tbMatricula;

INSERT INTO tbMatricula(dataMatricula, idAluno, idTurma)
VALUES
	('2015-10-03', 1, 1),
	('2014-05-04', 2, 1),
	('2014-04-04', 2, 4),
	('2012-05-03', 3, 2),
	('2016-03-03', 1, 3),
	('2015-05-07', 4, 2),
	('2015-07-05', 4, 3)

INSERT INTO tbMatricula(dataMatricula, idAluno, idTurma)
VALUES
	('2015-10-03', 7, 1)