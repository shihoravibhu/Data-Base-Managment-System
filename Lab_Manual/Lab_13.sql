--Part – A: 

--1. List all books with their authors. 

	SELECT AUTHOR.AUTHORNAME , BOOK.TITLE
	FROM AUTHOR JOIN BOOK
	ON AUTHOR.AUTHORID = BOOK.AUTHORID
	
--2. List all books with their publishers. 
	
	SELECT Publisher.PUBLISHERNAME , BOOK.TITLE
	FROM PUBLISHER JOIN BOOK
	ON PUBLISHER.PUBLISHERID = BOOK.PUBLISHERID

--3. List all books with their authors and publishers. 
	
	SELECT Publisher.PUBLISHERNAME ,AUTHOR.AUTHORNAME, BOOK.TITLE
	FROM BOOK
	JOIN PUBLISHER ON PUBLISHER.PUBLISHERID = BOOK.PUBLISHERID
	JOIN AUTHOR ON AUTHOR.AUTHORID = BOOK.AUTHORID

--4. List all books published after 2010 with their authors and publisher and price. 

	SELECT BOOK.TITLE , AUTHOR.AUTHORNAME , PUBLISHER.PUBLISHERNAME , BOOK.PRICE
	FROM BOOK
	JOIN PUBLISHER ON PUBLISHER.PUBLISHERID = BOOK.PUBLISHERID
	JOIN AUTHOR ON AUTHOR.AUTHORID = BOOK.AUTHORID
	WHERE BOOK.PublicationYear > 2010
	
--5. List all authors and the number of books they have written. 
	
	SELECT AUTHOR.AUTHORNAME , COUNT(AUTHOR.AUTHORNAME) AS WRITTEN
	FROM AUTHOR JOIN BOOK
	ON AUTHOR.AUTHORID = BOOK.AUTHORID
	GROUP BY AUTHOR.AUTHORNAME

--6. List all publishers and the total price of books they have published. 
	
	SELECT PUBLISHER.PUBLISHERNAME , SUM(BOOK.PRICE) AS TOTAL
	FROM PUBLISHER JOIN BOOK 
	ON PUBLISHER.PUBLISHERID = BOOK.PUBLISHERID
	GROUP BY PUBLISHER.PUBLISHERNAME

--7. List authors who have not written any books. 
	
	SELECT AUTHOR.AUTHORNAME
	FROM AUTHOR LEFT JOIN BOOK
	ON AUTHOR.AUTHORID = BOOK.AUTHORID
	GROUP BY AUTHOR.AUTHORNAME
	HAVING COUNT(BOOK.BOOKID) = 0

--8. Display total number of Books and Average Price of every Author. 
--9. lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 
--10. Display number of books published each year. 