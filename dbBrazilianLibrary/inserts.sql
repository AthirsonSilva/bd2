USE dbBrazilianLibrary

INSERT INTO Gender(name)
VALUES
	('Fiction'),
	('Romance'),
	('Tragedy')

INSERT INTO Author(name)
VALUES
	('Chico Buarque'),
	('Jorge Amado'),
	('J. K. Rowling'),
	('William Shakespare'),
	('Monteiro Lobato'),
	('Cora Coralina'),
	('Claice Lispector')

INSERT INTO Editor(name)
VALUES 
	('Melhoramentos'),
	('Globo'),
	('Atica'),
	('Companhia das Letras'),
	('Abril')

INSERT INTO Book(name, pages, genderID, editorID, authorID)
VALUES 
	('Budapeste', 176, 2, 4, 1),
	('O Bicho-da-Seda', 456, 2, 5, 3),
	('Gabrila. Cravo e Canela', 214, 1, 2, 2),
	('Reinacoes de Narizinho', 143, 2, 2, 5),
	('Romeu e Julieta', 421, 1, 3, 4),
	('O Irmao Alemao', 478, 1, 4, 1),
	('Terras do Sem-Fim', 125, 1, 3, 2),
	('Animais Fantastifcos e Onde Habitam', 257, 2, 4, 3)