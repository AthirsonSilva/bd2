USE dbBrazilianLibrary

-- a.
SELECT Book.name FROM Book WHERE Book.name LIKE 'a%'

-- b.
SELECT MAX(Book.pages)FROM Book

-- c.
SELECT MIN(Book.pages) FROM Book

-- d.
SELECT AVG(Book.pages) FROM Book

-- e.
SELECT SUM(Book.pages) FROM Book Where Book.editorID = 4

-- f.
SELECT SUM(Book.pages) FROM Book WHERE Book.name LIKE 'a%'

-- g.
SELECT AVG(Book.pages) FROM Book WHERE Book.authorID = 3

-- h.
SELECT COUNT(Book.ID) FROM Book WHERE Book.editorID = 4

-- i.
SELECT AVG(Book.pages) FROM Book WHERE Book.name LIKE '%estrela%'

-- j.
SELECT COUNT(Book.pages) FROM Book WHERE Book.name LIKE '%poema%'

-- k.
SELECT COUNT(pages), Gender.name FROM Book
INNER JOIN Gender
	ON Gender.ID = Book.genderID
	GROUP BY Gender.name

-- m.
SELECT SUM(pages), Author.name FROM Book 
INNER JOIN Author
	ON Author.ID = Book.authorID
	GROUP BY Author.name

-- n.
SELECT Author.name, AVG(Book.pages)FROM Book
INNER JOIN Author
	 ON Author.ID = Book.authorID 
	 GROUP BY Author.name
	 ORDER BY Author.name ASC
	 
-- o.
SELECT Editor.name, COUNT(Book.pages) FROM Book
INNER JOIN Editor
	ON Editor.ID = Book.editorID
	GROUP BY Editor.name
	ORDER BY Editor.name DESC

-- p.
SELECT SUM(Book.pages) FROM Book
INNER JOIN Author
	ON Author.ID = Book.authorID
	WHERE Author.name LIKE 'a%'
	GROUP BY Author.name

-- q.
SELECT COUNT(Book.ID), Author.name FROM Book
INNER JOIN Author
	ON Author.ID = Book.authorID
	WHERE Author.name LIKE 'Machado de Assis' 
		OR Author.name LIKE 'Cora Coralina'
		OR Author.name LIKE 'Graciliano Ramos'
		OR Author.name LIKE 'Clarice Lispector'
	GROUP BY Author.name
	

-- r.
SELECT SUM(Book.pages), Editor.name FROM Book
INNER JOIN Editor
	ON Book.editorID = Editor.ID
	WHERE Book.pages BETWEEN 200 AND 501
	GROUP BY Editor.name

-- s.
SELECT Book.name, Author.name FROM Book
INNER JOIN Author
	ON Book.authorID = Author.ID
	INNER JOIN Editor
		ON Book.editorID = Editor.ID
	WHERE Editor.name LIKE 'Companhia das Letras'
	
	
-- t.
SELECT Book.name, Author.name FROM Book
INNER JOIN Author	
	ON Book.authorID = Author.ID
	WHERE Author.name NOT LIKE 'Erico Verissimo'
	
-- u.
SELECT Author.name, Book.name FROM Author
LEFT JOIN Book
	ON Author.ID = Book.authorID 
	
-- v.
SELECT Book.name, Author.name FROM Book
RIGHT JOIN Author
	ON Author.ID = Book.authorID 
	
-- w.
SELECT Author.name, Book.name FROM Book
FULL JOIN Author
	ON Author.ID = Book.authorID 
	
-- x.	
SELECT Editor.name, Book.name FROM Editor 
CROSS JOIN Book
WHERE Editor.name LIKE 'Atica'
	
-- y.
SELECT Author.name, Book.name FROM Author
INNER JOIN Book
	ON Author.ID = Book.authorID
	WHERE Book.authorID LIKE NULL
	
-- z.
	