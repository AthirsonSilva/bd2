USE dbLanguageSchool

-- 1.
CREATE VIEW vwPreçoBaixo AS 
	SELECT tbCurso.idCurso, tbCurso.nomeCurso, tbCurso.cargaHorarioCurso, tbCurso.valorCurso
	FROM tbCurso WHERE tbCurso.valorCurso < (SELECT AVG(tbCurso.valorCurso) FROM tbCurso)

-- 2.
SELECT * FROM vwPreçoBaixo ORDER BY cargaHorarioCurso
	
-- 3.
CREATE VIEW vwAlunosTurma AS
	SELECT  tbCurso.nomeCurso, tbTurma.nomeTurma, COUNT(tbAluno.idAluno) AS QuantitadeAlunos FROM tbAluno
	INNER JOIN tbMatricula
		ON tbMatricula.idAluno = tbAluno.idAluno
		INNER JOIN tbTurma
			ON tbTurma.idTurma = tbMatricula.idTurma
			INNER JOIN tbCurso
				ON tbTurma.idCurso = tbCurso.idCurso
				GROUP BY tbCurso.nomeCurso, tbTurma.nomeTurma
	
-- 4.
SELECT nomeTurma FROM vwAlunosTurma WHERE QuantitadeAlunos = (SELECT MAX(QuantitadeAlunos) FROM vwAlunosTurma)

-- 5.
CREATE VIEW vwTurmaCurso AS
	SELECT tbCurso.nomeCurso, COUNT(tbTurma.idTurma) AS QuantidadeTurmas FROM tbCurso
	INNER JOIN tbTurma 
		ON tbCurso.idCurso = tbTurma.idCurso
		GROUP BY tbCurso.nomeCurso
		
-- 6.
SELECT MIN(QuantidadeTurmas) from vwTurmaCurso 