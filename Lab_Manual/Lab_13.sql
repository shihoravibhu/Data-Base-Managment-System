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

	SELECT A.AUTHORNAME, 
		   COUNT(B.BOOKID) AS TotalBooks, 
		   AVG(B.PRICE) AS AvgPrice
	FROM AUTHOR A
	LEFT JOIN BOOK B ON A.AUTHORID = B.AUTHORID
	GROUP BY A.AUTHORNAME;


--9. lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 

	SELECT P.PUBLISHERNAME, 
		   COUNT(B.BOOKID) AS TotalBooks
	FROM PUBLISHER P
	LEFT JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
	GROUP BY P.PUBLISHERNAME
	ORDER BY TotalBooks DESC;

--10. Display number of books published each year. 

	SELECT B.PublicationYear, 
		   COUNT(B.BOOKID) AS TotalBooks
	FROM BOOK B
	GROUP BY B.PublicationYear
	ORDER BY B.PublicationYear;



--Part – B: 
--1. List the publishers whose total book prices exceed 500, ordered by the total price. 

	SELECT P.PUBLISHERNAME, 
		   SUM(B.PRICE) AS TotalPrice
	FROM PUBLISHER P
	JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
	GROUP BY P.PUBLISHERNAME
	HAVING SUM(B.PRICE) > 500
	ORDER BY TotalPrice DESC;

--2. List most expensive book for each author, sort it with the highest price. 

	SELECT A.AUTHORNAME, 
		   B.TITLE, 
		   B.PRICE
	FROM BOOK B
	JOIN AUTHOR A ON A.AUTHORID = B.AUTHORID
	WHERE B.PRICE = (
		SELECT MAX(B2.PRICE)
		FROM BOOK B2
		WHERE B2.AUTHORID = B.AUTHORID
	)
	ORDER BY B.PRICE DESC;



--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 

--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 

-- Country Table
CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL UNIQUE
);

-- State Table
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL UNIQUE,
    Cid INT NOT NULL,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

-- District Table
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL UNIQUE,
    Sid INT NOT NULL,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

-- City Table
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    Did INT NOT NULL,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

-- Department Table
CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL UNIQUE
);

-- Employee Table
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT NOT NULL,
    Cid INT NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);


--2. Insert 5 records in each table. 

-- Country
INSERT INTO Country VALUES (1, 'India'), (2, 'USA'), (3, 'UK'), (4, 'Canada'), (5, 'Japan');

-- State
INSERT INTO State VALUES 
(1, 'Gujarat', 1), 
(2, 'Maharashtra', 1),
(3, 'California', 2), 
(4, 'Ontario', 4), 
(5, 'Tokyo', 5);

-- District
INSERT INTO District VALUES 
(1, 'Ahmedabad', 1),
(2, 'Pune', 2),
(3, 'Los Angeles County', 3),
(4, 'Toronto District', 4),
(5, 'Shinjuku', 5);

-- City
INSERT INTO City_info VALUES 
(1, 'Ahmedabad City', 1),
(2, 'Pune City', 2),
(3, 'Los Angeles', 3),
(4, 'Toronto', 4),
(5, 'Tokyo City', 5);

-- Department
INSERT INTO Dept_info VALUES 
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

-- Employee (try violating Salary < 0 → error)
INSERT INTO Emp_info VALUES 
(1, 'Vibhu', 1, 1, 50000, 3),
(2, 'Ravi', 2, 2, 40000, 5),
(3, 'Sneha', 3, 3, 60000, 7),
(4, 'Ankit', 4, 4, 45000, 2),
(5, 'Yuki', 5, 5, 70000, 10);

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees.

SELECT E.Ename,
       D.Dname AS Department,
       E.Salary,
       E.Experience,
       C.Cname AS City,
       Dist.Dname AS District,
       St.Sname AS State,
       Co.Cname AS Country
FROM Emp_info E,
     Dept_info D,
     City_info C,
     District Dist,
     State St,
     Country Co
WHERE E.Did = D.Did
  AND E.Cid = C.Cid
  AND C.Did = Dist.Did
  AND Dist.Sid = St.Sid
  AND St.Cid = Co.Cid;
