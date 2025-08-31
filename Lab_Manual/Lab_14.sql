-- Create Tables
CREATE TABLE STUDENT_DATA (
    Rno INT ,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

CREATE TABLE DEPARTMENT (
    DID INT ,
    DName VARCHAR(50)
);

CREATE TABLE ACADEMIC (
    RNO INT ,
    SPI DECIMAL(3,1),
    BKLOG INT
);

-- Insert Values into STUDENT_DATA
INSERT INTO STUDENT_DATA VALUES (101, 'Raju', 'Rajkot', 10);
INSERT INTO STUDENT_DATA VALUES (102, 'Amit', 'Ahmedabad', 20);
INSERT INTO STUDENT_DATA VALUES (103, 'Sanjay', 'Baroda', 40);
INSERT INTO STUDENT_DATA VALUES (104, 'Neha', 'Rajkot', 20);
INSERT INTO STUDENT_DATA VALUES (105, 'Meera', 'Ahmedabad', 30);
INSERT INTO STUDENT_DATA VALUES (106, 'Mahesh', 'Baroda', 10);

-- Insert Values into DEPARTMENT
INSERT INTO DEPARTMENT VALUES (10, 'Computer');
INSERT INTO DEPARTMENT VALUES (20, 'Electrical');
INSERT INTO DEPARTMENT VALUES (30, 'Mechanical');
INSERT INTO DEPARTMENT VALUES (40, 'Civil');

-- Insert Values into ACADEMIC
INSERT INTO ACADEMIC VALUES (101, 8.8, 0);
INSERT INTO ACADEMIC VALUES (102, 9.2, 2);
INSERT INTO ACADEMIC VALUES (103, 7.6, 1);
INSERT INTO ACADEMIC VALUES (104, 8.2, 4);
INSERT INTO ACADEMIC VALUES (105, 7.0, 2);
INSERT INTO ACADEMIC VALUES (106, 8.9, 3);

--Part – A: 

--1. Display details of students who are from computer department.
SELECT * 
FROM STUDENT_DATA
WHERE DID = (
    SELECT DID 
    FROM DEPARTMENT
    WHERE DName = 'Computer'
);


--2. Displays name of students whose SPI is more than 8.
SELECT Name 
FROM STUDENT_DATA
WHERE Rno IN (
    SELECT Rno 
    FROM ACADEMIC
    WHERE SPI > 8
);



--3. Display details of students of computer department who belongs to Rajkot city.
SELECT * 
FROM STUDENT_DATA
WHERE City = 'Rajkot'
AND DID = (
    SELECT DID 
    FROM DEPARTMENT
    WHERE DName = 'Computer'
);


--4. Find total number of students of electrical department.
SELECT COUNT(*) AS total_num
FROM STUDENT_DATA
WHERE DID = (
    SELECT DID 
    FROM DEPARTMENT
    WHERE DName = 'Electrical'
);  

--5. Display name of student who is having maximum SPI. 
    
   SELECT NAME 
   FROM STUDENT_DATA
   WHERE RNO = (
        SELECT TOP 1 RNO
        FROM ACADEMIC
        ORDER BY SPI DESC
   )    

   -- OR

    select name from STUDENT_DATA
    where rno=(select rno
    from ACADEMIC
    where spi in (select max(spi) from ACADEMIC)
    )

--6. Display details of students having more than 1 backlog.

    SELECT *
    FROM STUDENT_DATA
    WHERE Rno IN (
        SELECT Rno
        FROM ACADEMIC
        WHERE BKLOG > 1
    );

--Part – B: 

--1. Display name of students who are either from computer department or from mechanical department.

    SELECT Name
    FROM STUDENT_DATA
    WHERE DID IN (
        SELECT DID
        FROM DEPARTMENT
        WHERE DName IN ('Computer', 'Mechanical')
    ); 

--2. Display name of students who are in same department as 102 studying in. 

    SELECT Name
    FROM STUDENT_DATA
    WHERE DID = (
        SELECT DID
        FROM STUDENT_DATA
        WHERE Rno = 102
    );

--Part – C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
--2. Display name of student who is having second highest SPI. 
--3. Display city names whose students SPI is 9.2 
--4. Find the names of students who have more than the average number of backlogs across all students. 
--5. Display the names of students who are in the same department as the student with the highest SPI.


-- Part A: COMPUTER & ELECTRICAL


CREATE TABLE COMPUTER (
    RollNo INT,
    Name VARCHAR(50)
);

CREATE TABLE ELECTRICAL (
    RollNo INT,
    Name VARCHAR(50)
);

INSERT INTO COMPUTER VALUES (101, 'Ajay');
INSERT INTO COMPUTER VALUES (109, 'Haresh');
INSERT INTO COMPUTER VALUES (115, 'Manish');

INSERT INTO ELECTRICAL VALUES (105, 'Ajay');
INSERT INTO ELECTRICAL VALUES (107, 'Mahesh');
INSERT INTO ELECTRICAL VALUES (115, 'Manish');


-- 1. Students either in Computer or Electrical
SELECT Name FROM COMPUTER                   -- SARKHA HOI TE EK J VAR (COMMAN HOI TE EK J VAR)
UNION
SELECT Name FROM ELECTRICAL;

-- 2. Students either in Computer or Electrical (with duplicates)
SELECT Name FROM COMPUTER                   -- ALL
UNION ALL
SELECT Name FROM ELECTRICAL;

-- 3. Students in both Computer and Electrical      
SELECT Name FROM COMPUTER               -- JE BEY MA COMMAN HOI TE AVSE
INTERSECT
SELECT Name FROM ELECTRICAL;

-- 4. Students in Computer but not in Electrical
SELECT Name FROM COMPUTER               -- ELECTRICAL MA NO HOI ANE COMPUET MA HOI
EXCEPT
SELECT Name FROM ELECTRICAL;

-- 5. Students in Electrical but not in Computer
SELECT Name FROM ELECTRICAL
EXCEPT
SELECT Name FROM COMPUTER;

-- 6. All details of students either in Computer or Electrical
SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL;

-- 7. All details of students in both Computer and Electrical
SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL;



-- Part B: EMP_DATA & CUSTOMER


CREATE TABLE EMP_DATA (
    EID INT,
    Name VARCHAR(50)
);

CREATE TABLE CUSTOMER (
    CID INT,
    Name VARCHAR(50)
);


INSERT INTO EMP_DATA VALUES (1, 'Ajay');
INSERT INTO EMP_DATA VALUES (9, 'Haresh');
INSERT INTO EMP_DATA VALUES (5, 'Manish');

INSERT INTO CUSTOMER VALUES (5, 'Ajay');
INSERT INTO CUSTOMER VALUES (7, 'Mahesh');
INSERT INTO CUSTOMER VALUES (5, 'Manish');


-- 1. Persons either Employee or Customer
SELECT Name FROM EMP_DATA
UNION
SELECT Name FROM CUSTOMER;

-- 2. Persons either Employee or Customer (with duplicates)
SELECT Name FROM EMP_DATA
UNION ALL
SELECT Name FROM CUSTOMER;

-- 3. Persons both Employee and Customer
SELECT Name FROM EMP_DATA
INTERSECT
SELECT Name FROM CUSTOMER;

-- 4. Persons who are Employee but not Customer
SELECT Name FROM EMP_DATA
EXCEPT
SELECT Name FROM CUSTOMER;

-- 5. Persons who are Customer but not Employee
SELECT Name FROM CUSTOMER
EXCEPT
SELECT Name FROM EMP_DATA;


-- Part C: Same as Part B but with IDs


-- 1. Persons either Employee or Customer
SELECT EID AS ID, Name FROM EMP_DATA
UNION
SELECT CID AS ID, Name FROM CUSTOMER;

-- 2. Persons either Employee or Customer (with duplicates)
SELECT EID AS ID, Name FROM EMP_DATA
UNION ALL
SELECT CID AS ID, Name FROM CUSTOMER;

-- 3. Persons both Employee and Customer
SELECT EID AS ID, Name FROM EMP_DATA
INTERSECT
SELECT CID AS ID, Name FROM CUSTOMER;

-- 4. Persons who are Employee but not Customer
SELECT EID AS ID, Name FROM EMP_DATA
EXCEPT
SELECT CID AS ID, Name FROM CUSTOMER;

-- 5. Persons who are Customer but not Employee
SELECT CID AS ID, Name FROM CUSTOMER
EXCEPT
SELECT EID AS ID, Name FROM EMP_DATA;
