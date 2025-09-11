--Perform SQL queries to implement constraints 

--Part – A: 

--Create below table with following constraints 

--1. Do not allow SPI more than 10 
--2. Do not allow Bklog less than 0. 
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified. 

CREATE TABLE STU_MASTER (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Branch VARCHAR(20) DEFAULT 'General',
    SPI DECIMAL(4,2) CHECK (SPI >= 0 AND SPI <= 10), -- must be 0–10
    Bklog INT CHECK (Bklog >= 0) -- no negative backlogs
);

-- Insert given records
INSERT INTO STU_MASTER (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', 'EC', 4.50, 3);

-- 4. Try to update SPI of Raju from 8.80 to 12 → will fail (check constraint)
UPDATE STU_MASTER SET SPI = 12 WHERE Name = 'Raju';

-- 5. Try to update Bklog of Neha from 0 to -1 → will fail (check constraint)
UPDATE STU_MASTER SET Bklog = -1 WHERE Name = 'Neha';


--Part – B: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 

--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_details(Did, Dname) 
--City_details(Cid, Cname) 

CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT FOREIGN KEY REFERENCES Dept_details(Did),
    Cid INT FOREIGN KEY REFERENCES City_details(Cid),
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0)
);

-- Insert sample data
INSERT INTO Dept_details VALUES (1, 'HR'), (2, 'Finance'), (3, 'IT');
INSERT INTO City_details VALUES (1, 'Rajkot'), (2, 'Ahmedabad'), (3, 'Surat');

-- Valid insert
INSERT INTO Emp_details VALUES (101, 'Amit', 1, 1, 30000, 2);

-- Invalid insert (negative salary → will fail)
INSERT INTO Emp_details VALUES (102, 'Sanjay', 2, 2, -25000, 3);

--Insert valid data
INSERT INTO Dept_details VALUES (1, 'HR'), (2, 'IT');
INSERT INTO City_details VALUES (1, 'Ahmedabad'), (2, 'Surat');

INSERT INTO Emp_details VALUES (101, 'Ravi', 1, 1, 35000, 5);
INSERT INTO Emp_details VALUES (102, 'Amit', 2, 2, 45000, 3);

--Insert invalid data (violates validation)
-- Negative salary (violates Salary > 0)
INSERT INTO Emp_details VALUES (103, 'Sanjay', 1, 1, -5000, 2);

-- Negative experience (violates Experience >= 0)
INSERT INTO Emp_details VALUES (104, 'Neha', 2, 2, 40000, -1);


--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 

--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 
-- Country table
CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname NVARCHAR(50) NOT NULL UNIQUE
);

-- State table
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname NVARCHAR(50) NOT NULL,
    Cid INT FOREIGN KEY REFERENCES Country(Cid)
);

-- District table
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname NVARCHAR(50) NOT NULL,
    Sid INT FOREIGN KEY REFERENCES State(Sid)
);

-- City table
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname NVARCHAR(50) NOT NULL,
    Did INT FOREIGN KEY REFERENCES District(Did)
);

-- Department table
CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname NVARCHAR(50) NOT NULL
);

-- Employee table
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename NVARCHAR(50) NOT NULL,
    Did INT FOREIGN KEY REFERENCES Dept_info(Did),
    Cid INT FOREIGN KEY REFERENCES City_info(Cid),
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Experience INT CHECK (Experience >= 0)
);

--2. Insert 5 records in each table. 
-- Country
INSERT INTO Country VALUES (1, 'India'), (2, 'USA'), (3, 'UK'), (4, 'Canada'), (5, 'Australia');

-- State
INSERT INTO State VALUES 
(1, 'Gujarat', 1),
(2, 'Maharashtra', 1),
(3, 'California', 2),
(4, 'London State', 3),
(5, 'Ontario', 4);

-- District
INSERT INTO District VALUES 
(1, 'Ahmedabad District', 1),
(2, 'Pune District', 2),
(3, 'LA District', 3),
(4, 'London Central', 4),
(5, 'Toronto District', 5);

-- City
INSERT INTO City_info VALUES 
(1, 'Ahmedabad', 1),
(2, 'Pune', 2),
(3, 'Los Angeles', 3),
(4, 'London', 4),
(5, 'Toronto', 5);

-- Department
INSERT INTO Dept_info VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Admin'),
(5, 'Sales');

-- Employee
INSERT INTO Emp_info VALUES 
(101, 'Ravi', 1, 1, 40000, 5),
(102, 'Amit', 2, 2, 50000, 3),
(103, 'Sanjay', 3, 3, 60000, 6),
(104, 'Neha', 4, 4, 70000, 7),
(105, 'Meera', 5, 5, 80000, 8);

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees.

SELECT * FROM Emp_info;
SELECT * FROM Dept_info;
SELECT * FROM City_info;
SELECT * FROM District;
SELECT * FROM State;
SELECT * FROM Country;

SELECT E.Ename, D.Dname, E.Salary, E.Experience, C.Cname
FROM Emp_info E
JOIN Dept_info D ON E.Did = D.Did
JOIN City_info C ON E.Cid = C.Cid;

