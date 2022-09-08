-- a.
SELECT tbCurso.nomeCurso, tbCurso.valorCurso FROM tbCurso
WHERE tbCurso.valorCurso < (SELECT AVG(tbCurso.valorCurso) FROM tbCurso)

-- b.
SELECT tbAluno.rgAluno, tbAluno.nomeAluno FROM tbAluno
WHERE (GETDATE() - tbAluno.dataNascAluno) = (SELECT MIN(GETDATE() - tbAluno.dataNascAluno) FROM tbAluno)

-- c.
SELECT tbAluno.rgAluno, tbAluno.nomeAluno FROM tbAluno
WHERE (GETDATE() - tbAluno.dataNascAluno) = (SELECT MAX(GETDATE() - tbAluno.dataNascAluno) FROM tbAluno)

-- d.
SELECT tbCurso.nomeCurso, tbCurso.valorCurso FROM tbCurso
WHERE tbCurso.valorCurso = (SELECT MAX(tbCurso.valorCurso) FROM tbCurso)

-- e.
SELECT tbAluno.nomeAluno, tbCurso.nomeCurso FROM tbAluno
INNER JOIN tbMatricula 
	ON tbMatricula.idAluno  = tbAluno.idAluno  
	INNER JOIN tbTurma 
		ON tbTurma.idTurma = tbMatricula.idTurma
		INNER JOIN tbCurso
			ON tbTurma.idCurso = tbCurso.idCurso 
			WHERE (GETDATE() - tbMatricula.dataMatricula) = (SELECT MIN(GETDATE() - tbMatricula.dataMatricula) FROM tbMatricula)
			

-- f.
SELECT tbMatricula.dataMatricula, tbAluno.nomeAluno FROM tbAluno
INNER JOIN tbMatricula 
	ON tbMatricula.idAluno = tbAluno.idAluno 
		WHERE (GETDATE() - tbMatricula.dataMatricula) = (SELECT MAX(GETDATE() - tbMatricula.dataMatricula) FROM tbMatricula)		
			
-- g.
SELECT tbAluno.nomeAluno, tbAluno.rgAluno, tbAluno.dataNascAluno, tbCurso.nomeCurso  FROM tbAluno
INNER JOIN tbMatricula 
	ON tbMatricula.idAluno = tbAluno.idAluno 
	INNER JOIN tbTurma 
		ON tbTurma.idTurma = tbMatricula.idTurma
		INNER JOIN tbCurso
			ON tbCurso.idCurso = tbTurma.idCurso 
				WHERE tbCurso.nomeCurso = 'ingl?s'
		
		