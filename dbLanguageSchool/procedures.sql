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
			if not exists (select * from tbTurma where nomeTurma like @nomeTurma)
				begin
					print('Turma informada não existe')
				end

			else
				begin
					print('Informações da turma: ' + @nomeTurma)
					select * from tbTurma where nomeTurma like @nomeTurma
				end
		end

exec spExibeTurma '1|A'

-- 5.
create procedure spAlunosDaTurma
	@nomeTurma varchar(60)

	as
		begin
			if not exists (select * from tbTurma where nomeTurma like @nomeTurma)
				begin
					print('Turma informada não existe.')
				end

			else 
				begin
					select nomeAluno, nomeTurma from tbAluno
						inner join tbMatricula
							on tbMatricula.idAluno = tbAluno.idAluno
							inner join tbTurma
								on tbTurma.idTurma = tbMatricula.idTurma
				end
		end

exec spAlunosDaTurma '1|A'

-- 6.: O aluno num tem cpf não boy
-- 7.
create procedure spInsereMatricula
	@dataMatricula smalldatetime,
	@idAluno int,
	@idTurma int

	as
	begin
		declare @idMatricula int

		if exists (select * from tbMatricula where idAluno = @idAluno 
		and idTurma = @idTurma 
		and dataMatricula like @dataMatricula)
		begin
			print('Matricula já existe')
		end

		else 
		begin
			insert into tbMatricula (dataMatricula, idAluno, idTurma)
			values
				(@dataMatricula, @idAluno, @idTurma)

			set @idMatricula = (select max(idMatricula) from tbMatricula)

			print('Matricula de ID: ' + convert(varchar(5), @idMatricula) + ' cadastrada com sucesso.')
		end
	end

exec spInsereMatricula '2015-10-03', 3, 3

create procedure spInsereCursoPretendido
	@nomeCurso varchar(60),
	@nomeAluno varchar(60),
	@horarioPreferido smalldatetime,
	@dataNascAluno smalldatetime,
	@dataMatricula smalldatetime,
	@rgAluno char(13),
	@naturalidadeAluno varchar(60)

	as
		begin
			declare @idAluno int
			declare @idTurma int
			declare @idCurso int

			if not exists (select * from tbCurso where nomeCurso like @nomeCurso)
			begin
				print('Curso informada não existe')
			end
			
			else
			begin
				exec spInsereAluno @nomeAluno, @dataNascAluno, @rgAluno, @naturalidadeAluno

				set @idAluno = (select max(idAluno) from tbAluno)

				if not exists (select * from tbCurso where nomeCurso like @nomeCurso)
				begin
					print('Curso informado não existe')
				end

				else
				begin
					set @idCurso = (select idCurso from tbCurso where nomeCurso like @nomeCurso)
				end

					if @idCurso = 1
					begin
						if not exists (select * from tbTurma where horarioTurma like @horarioPreferido)
						begin
							print('Horário inválido')
						end

						else
						begin
							if @horarioPreferido like '12:00:00'
							begin	
								insert into tbTurma (nomeTurma, horarioTurma, idCurso)
								values
									('1|A', '12:00:00', 1)

								set @idTurma = (select max(idTurma) from tbTurma)

								exec spInsereMatricula @dataMatricula, @idAluno, @idTurma
							end

							else
							begin
								insert into tbTurma (nomeTurma, horarioTurma, idCurso)
								values
									('1|B', '18:00:00', 1)

								set @idTurma = (select max(idTurma) from tbTurma)

								exec spInsereMatricula @dataMatricula, @idAluno, @idTurma
							end
						end
					end

					else if @idCurso = 2
					begin
						insert into tbTurma (nomeTurma, horarioTurma, idCurso)
							values
								('1AA', '19:00:00', 2)

								set @idTurma = (select max(idTurma) from tbTurma)

								exec spInsereMatricula @dataMatricula, @idAluno, @idTurma
					end

					else if @idCurso = 3
					begin
						insert into tbTurma (nomeTurma, horarioTurma, idCurso)
							values
								('1|C', '18:00:00', 3)

								set @idTurma = (select max(idTurma) from tbTurma)

								exec spInsereMatricula @dataMatricula, @idAluno, @idTurma
					end

					else
					begin
						print('Curso informado não existe')
					end
			end
		end	

exec spInsereCursoPretendido 'Espanhol', 'Ciclano', '12:00:00', '12/11/2002', '12/11/2002', '111.111.111-A', 'Jamal'
