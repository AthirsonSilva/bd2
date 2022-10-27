-- 1.
create procedure spCadastraAluno
	@cpfAluno char(11),
	@nomeAluno varchar(255)

	as
	begin
		declare @idAluno int 
		
		if exists (select * from tbAluno where cpfAluno like @cpfAluno)
		begin
			print('O aluno com cpf: ' + @cpfAluno + ' e nome: ' + @nomeAluno + ' j� existe.')
		end

		else
		begin
			insert into tbAluno(nomeAluno, cpfAluno)
			values
				(@nomeAluno, @cpfAluno)

				set @idAluno = (select max(idAluno) from tbAluno)
				print('Aluno ' + @nomeAluno + ' cadastrado com sucesso pelo ID: ' + convert(varchar(255), @idAluno))
		end
	end

exec spCadastraAluno '11122233344', 'Bruno gra�do'

-- 2.
alter procedure spCadastraOcorrencia
	@cpfAluno char(11),
	@descricaoOcorrencia varchar(255)

	as
	begin
		declare @idOcorrencia int
		declare @nomeAluno varchar(255)
		declare @idAluno int
		
		if not exists (select * from tbAluno where cpfAluno like @cpfAluno)
		begin
			print('O aluno com cpf: ' + @cpfAluno +' n�o est� cadastrado para ser poss�vel o cadastro da sua ocorr�ncia.')
		end

		else
		begin
			set @idAluno = (select idAluno from tbAluno where cpfAluno like @cpfAluno)


			insert into tbOcorrenciaAluno(dataOcorrencia, descricaoOcorrencia, idAluno)
			values
				(GETDATE(), @descricaoOcorrencia, @idAluno)

				set @idOcorrencia = (select max(idOcorrencia) from tbOcorrenciaAluno)
				set @nomeAluno = (select nomeAluno from tbAluno where cpfAluno like @cpfAluno)

				print('Ocorrencia do aluno ' + @nomeAluno + ' cadastrado com sucesso pelo ID: ' + convert(varchar(255), @idOcorrencia))
		end
	end

exec spCadastraOcorrencia 'xxxxxxxxxxx', 'Brun�o rei delas'

-- 3.
alter procedure spVerificaOcorrencia
	@cpfAluno char(11)

	as
	begin
		declare @idAluno int
		declare @countOcorrencias int

		if not exists (select * from tbAluno where cpfAluno like @cpfAluno)
		begin
			print('Esse aluno nem existe meo')
		end

		else
		begin
			set @idAluno = (select idAluno from tbAluno where cpfAluno like @cpfAluno)

			if not exists (select * from tbOcorrenciaAluno where idAluno like @idAluno)
			begin
				print('Esse aluno n�o possui ocorr�ncias')
			end

			else 
			begin
				set @countOcorrencias = (select COUNT(idOcorrencia) from tbOcorrenciaAluno where idAluno like @idAluno)

				print('Esse aluno j� possui ocorr�ncias no nome dele, m� vacil�o. Olha quantas vzs esse safado fez merda: '  + convert(varchar(255), @countOcorrencias))
			end
		end
	end

exec spVerificaOcorrencia 'xxxxxxxxxxx'