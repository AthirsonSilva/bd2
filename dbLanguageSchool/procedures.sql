use dbLanguageSchool

-- 1.
create procedure spBuscaAluno
	@idAluno int

	as
		begin
			if not exists (select * from tbAluno where idAluno = @idAluno)
				begin
					print('Aluno correspondente ao ID informado não existe')
				end

			else
				begin
					select * from tbAluno 
						where idAluno = @idAluno
				end
		end
		
exec spBuscaAluno 1

-- 2.
create procedure spInsereAluno
	@nomeAluno varchar(60),
	@dataNascAluno smalldatetime,
	@rgAluno char(13),
	@naturalidadeAluno varchar(60)
		
	as
		begin
			declare @idAluno int

			if exists (select rgAluno from tbAluno where rgAluno like @rgAluno)
				begin
					print('Não é possível cadastrar novo registro aluno do rg: ' + @rgAluno + ' já existe')
				end
			else
				begin
					insert into tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
					values 
						(@nomeAluno, @dataNascAluno, @rgAluno, @naturalidadeAluno)

						set @idAluno = (select max(idAluno) from tbAluno)
						print('Aluno ' + @nomeAluno + ' cadastrado com sucesso com ID: ' + convert(varchar(5), @idAluno))
				end
		end

exec spInsereAluno 'Fulano', '12/12/2002', '000.000.000-X', 'Wok'
select * from tbAluno

-- 3.
create procedure spAumentaPreco
	@nomeCurso varchar(60),
	@percentual float

	as
		begin
			declare @idCurso int
			declare @valorCurso smallmoney

			if not exists (select * from tbCurso where nomeCurso like @nomeCurso)
				begin
					print('O Curso informado não existe')
				end

			else
				begin
					update tbCurso
						set valorCurso = valorCurso + (valorCurso * (@percentual / 100))
						where nomeCurso like @nomeCurso

					set @idCurso = (select idCurso from tbCurso where nomeCurso like @nomeCurso)
					set @valorCurso = (select valorCurso from tbCurso where nomeCurso like @nomeCurso)

					print('Valor do curso de ID: ' + convert(varchar(4), @idCurso) + 
					' atualizado com sucesso para: R$ ' + convert(varchar(60), @valorCurso))
				end
		end

exec spAumentaPreco 'Espanhol', 10.0

-- 4.
create procedure spExibeTurma
	@nomeTurma varchar(60)

	as 
		begin
			print('Informações da turma: ' + @nomeTurma)

			select * from tbTurma where nomeTurma like @nomeTurma
		end

exec spExibeTurma '1|A'
