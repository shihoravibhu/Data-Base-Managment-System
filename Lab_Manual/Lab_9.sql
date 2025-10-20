--Lab 9 
--Implement SQL In-built functions (Math, String, and Date Functions)

--Math functions 

--Part – A: 

--1. Display the result of 5 multiply by 30. 
	
	SELECT 5 * 30

--2. Find out the absolute value of -25, 25, -50 and 50. 
	
	SELECT ABS(-25) , ABS(25) , ABS(-50) , ABS(50)

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 
	
	SELECT CEILING(25.2)
	
	SELECT CEILING(25.7)
	
	SELECT CEILING(-25.2)

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
	
	SELECT FLOOR(25.2)

	SELECT FLOOR(25.7)
	
	SELECT FLOOR(-25.2)

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
	
	SELECT 5 % 2 , 5 % 3

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
	
	SELECT POWER(3, 2) AS ThreeSq,       -- 3² = 9
       POWER(4, 3) AS FourCube;      -- 4³ = 64

--7. Find out the square root of 25, 30 and 50. 
	
	SELECT SQRT(25) AS Sqrt25,           -- 5
       SQRT(30) AS Sqrt30,           -- ~5.477
       SQRT(50) AS Sqrt50;           -- ~7.071

--8. Find out the square of 5, 15, and 25. 
	
	SELECT SQUARE(5)  AS Sq5,            -- 25
       SQUARE(15) AS Sq15,           -- 225
       SQUARE(25) AS Sq25;           -- 625


--9. Find out the value of PI. 
	
	SELECT PI() AS PiValue;              -- 3.14159265358979

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points. 
	
	SELECT ROUND(157.732, 2)  AS Round2,   -- 157.73
       ROUND(157.732, 0)  AS Round0,   -- 158
       ROUND(157.732, -2) AS RoundNeg2;-- 200

--11. Find out exponential value of 2 and 3. 
	
	SELECT EXP(2) AS Exp2,              -- e² ≈ 7.389
       EXP(3) AS Exp3;              -- e³ ≈ 20.085

--12. Find out logarithm having base e of 10 and 2. 
	
	SELECT LOG(10) AS Ln10,             -- ln(10) ≈ 2.302
       LOG(2)  AS Ln2;              -- ln(2) ≈ 0.693

--13. Find out logarithm having base b having value 10 of 5 and 100. 
	
	SELECT LOG10(5)   AS Log10_5,       -- ≈ 0.699
       LOG10(100) AS Log10_100;     -- 2

	   --OR

	   -- log base b of x = log(x) / log(b)
	SELECT LOG(5)/LOG(10)   AS LogBase10_5, 
       LOG(100)/LOG(10) AS LogBase10_100;


--14. Find sine, cosine and tangent of 3.1415. 
	
	SELECT SIN(3.1415) AS SinVal,       -- ≈ 0
       COS(3.1415) AS CosVal,       -- ≈ -1
       TAN(3.1415) AS TanVal;       -- ≈ 0

--15. Find sign of -25, 0 and 25. 
	
	SELECT SIGN(-25) AS SignNeg,        -- -1
       SIGN(0)   AS SignZero,       -- 0
       SIGN(25)  AS SignPos;        -- 1

--16. Generate random number using function.
	
	SELECT RAND() AS RandomVal;         -- random float between 0 and 1

	-- OR (If you want an integer random between 1 and 100:)
	SELECT FLOOR(RAND() * 100) + 1 AS RandomInt;



--Part – B: 

	CREATE TABLE EMP_MASTER (
    EmpNo INT PRIMARY KEY,
    EmpName VARCHAR(50),
    JoiningDate DATE,
    Salary DECIMAL(10,2),
    Commission DECIMAL(10,2),
    City VARCHAR(50),
    DeptCode VARCHAR(10)
);

INSERT INTO EMP_MASTER (EmpNo, EmpName, JoiningDate, Salary, Commission, City, DeptCode)
VALUES 
(101, 'Keyur',  '2002-01-05', 12000.00, 4500.00, 'Rajkot',   '3@g'),
(102, 'Hardik', '2004-02-15', 14000.00, 2500.00, 'Ahmedabad','3@'),
(103, 'Kajal',  '2006-03-14', 15000.00, 3000.00, 'Baroda',   '3-GD'),
(104, 'Bhoomi', '2005-06-23', 12500.00, 1000.00, 'Ahmedabad','1A3D'),
(105, 'Harmit', '2004-02-15', 14000.00, 2000.00, 'Rajkot',   '312A');

--1. Display the result of Salary plus Commission. 

	SELECT EmpNo, EmpName, Salary, Commission, (Salary + Commission) AS TotalEarnings
	FROM EMP_MASTER;

--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2. 
	
	SELECT CEILING(55.2)  AS Ceil_55_2,
       CEILING(35.7)  AS Ceil_35_7,
       CEILING(-55.2) AS Ceil_Neg55_2;

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2. 
	
	SELECT FLOOR(55.2)  AS Floor_55_2,
       FLOOR(35.7)  AS Floor_35_7,
       FLOOR(-55.2) AS Floor_Neg55_2;

--4. Find out remainder of 55 divided 2 and 55 divided by 3. 
	
	SELECT 55 % 2 AS Rem_55_2,
       55 % 3 AS Rem_55_3;

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power. 
	
	SELECT POWER(23, 2) AS Power_23_2,   -- 529
       POWER(14, 3) AS Power_14_3;   -- 2744

--Part – C: 

--1. Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000. 
	
	SELECT *
	FROM EMP_MASTER
	WHERE (Salary + Commission) > 15000;

--2. Find the details of employees whose commission is more than 25% of their salary. 
	
	SELECT *
	FROM EMP_MASTER
	WHERE COMMISSION > 0.25 * SALARY

--3. List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater 
--than 15000. 
	
	SELECT *
	FROM EMP_MASTER
	WHERE JoiningDate < '2005-01-01'
		AND (Salary + Commission) > 15000;

--4. Find employees whose total earnings (Salary + Commission) are at least double their salary.

	SELECT *
	FROM EMP_MASTER
	WHERE (Salary + Commission) >= 2 * Salary;

--String functions 

--Part – A: 

--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
	
	SELECT LEN(NULL)        AS LenNull,     -- NULL → NULL
       LEN('   hello   ') AS LenHello,  -- Counts chars except trailing spaces → 8  (pachad ni 3 space nai ave)
       LEN(' ')          AS LenBlank;   -- Blank (1 space) → 0

--2. Display your name in lower & upper case. 
	
	SELECT LOWER('Vibhu Shihora') AS LowerName,
       UPPER('Vibhu Shihora') AS UpperName;

--3. Display first three characters of your name. 
	
	SELECT LEFT('Vibhu Shihora', 3) AS First3;

--4. Display 3rd to 10th character of your name. 
	
	SELECT SUBSTRING('Vibhu Shihora',3,8) AS Sub3to10;

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 

	SELECT REPLACE('abc123efg','123','XYZ') AS Replace1,
       REPLACE('abcabcabc','c','5')     AS Replace2; 

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
	
	SELECT ASCII('a') AS A_Lower,
       ASCII('A') AS A_Upper,
       ASCII('z') AS Z_Lower,
       ASCII('Z') AS Z_Upper,
       ASCII('0') AS Zero,
       ASCII('9') AS Nine;

--7. Write a query to display character based on number 97, 65,122,90,48,57. 
	
	SELECT CHAR(97)  AS Ch97,
       CHAR(65)  AS Ch65,
       CHAR(122) AS Ch122,
       CHAR(90)  AS Ch90,
       CHAR(48)  AS Ch48,
       CHAR(57)  AS Ch57;

--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
	
	SELECT LTRIM('   hello world  ') AS NoLeftSpaces;

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘. 

	SELECT RTRIM('   hello world  ') AS NoRightSpaces;

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
	
	SELECT LEFT('SQL Server',4) AS First4,
       RIGHT('SQL Server',5) AS Last5;

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
	
	SELECT CAST('1234.56' AS DECIMAL(10,2)) AS CastNum;

	SELECT CONVERT(DECIMAL(10,2),'1234.56') AS ConvNum;

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function). 

	SELECT CAST(10.58 AS INT) AS CastInt,
       CONVERT(INT,10.58) AS ConvInt;

--13. Put 10 space before your name using function. 
	
	SELECT SPACE(10) + 'Vibhu' AS NameWithSpaces;

--14. Combine two strings using + sign as well as CONCAT (). 
	
	SELECT 'Vibhu' + ' Shihora' AS CombinedPlus,
       CONCAT('Vibhu',' Shihora') AS CombinedConcat;

--15. Find reverse of “Darshan”. 
	
	SELECT REVERSE('Darshan') AS Reversed;

--16. Repeat your name 3 times.
	
	SELECT REPLICATE('Vibhu ',3) AS Repeated;

--Part – B: Perform following queries on EMP_MASTER table. 

--1. Find the length of EMP Name and City columns. 
	
	SELECT EmpName, LEN(EmpName) AS NameLen,City, LEN(City) AS CityLen
	FROM EMP_MASTER;

--2. Display EMP Name and City columns in lower & upper case. 
	
	SELECT LOWER(EmpName) AS LowerName,
       UPPER(EmpName) AS UpperName,
       LOWER(City)    AS LowerCity,
       UPPER(City)    AS UpperCity
	FROM EMP_MASTER;

--3. Display first three characters of EMP Name column. 
	
	SELECT EmpName, LEFT(EmpName,3) AS First3
	FROM EMP_MASTER;


--4. Display 3rd to 10th character of city column. 
	
	SELECT City, SUBSTRING(City,3,8) AS Sub3to10
	FROM EMP_MASTER;

--5. Write a query to display first 4 & Last 5 characters of EMP Name column. 
	
	SELECT EmpName,
       LEFT(EmpName,4)  AS First4,
       RIGHT(EmpName,5) AS Last5
	FROM EMP_MASTER;

--Part – C: Perform following queries on EMP_MASTER table. 

--1. Put 10 space before EMP Name using function. 
	
	SELECT SPACE(10) + EmpName AS NameWithSpaces
	FROM EMP_MASTER;

--2. Combine EMP Name and city columns using + sign as well as CONCAT (). 
	
	SELECT EmpName + ' ' + City AS CombinedPlus,
       CONCAT(EmpName,' ',City) AS CombinedConcat
	FROM EMP_MASTER;

--3. Combine all columns using + sign as well as CONCAT (). 
	
	SELECT EmpName + ' ' + City + ' ' + DeptCode AS CombinedPlus,
       CONCAT(EmpName,' ',City,' ',DeptCode) AS CombinedConcat
	FROM EMP_MASTER;

--4. Combine the result as < EMP Name > Lives in <City>. 
	
	SELECT EmpName + ' lives in ' + City AS Statement
	FROM EMP_MASTER;

--5. Combine the result as ‘EMP no of <EMP Name> is <EmpNo>.
	
	SELECT 'EMP no of ' + EmpName + ' is ' + CAST(EmpNo AS VARCHAR) AS Statement
	FROM EMP_MASTER;

--6. Retrieve the names of all employee where the third character of the Name is a vowel. 
	
	SELECT EMPNAME
	FROM EMP_MASTER
	WHERE SUBSTRING(EMPNAME,3,1) LIKE '[AEIOUaeiou]'

	-- OR

	SELECT EmpName
	FROM EMP_MASTER
	WHERE SUBSTRING(EmpName,3,1) IN ('A','E','I','O','U','a','e','i','o','u');


--7. Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that 
--starts with 'R'. 
	
	SELECT EMPNAME + ' ' + CITY 
	FROM EMP_MASTER
	WHERE RIGHT(EMPNAME,1) = 'r' AND LEFT(CITY,1) = 'R'

	--OR

	SELECT EmpName, City, EmpName + ' ' + City AS Combined
	FROM EMP_MASTER
	WHERE EmpName LIKE '%r'
	AND City LIKE 'R%';

--Date Functions 
	
--Part – A: 

--1. Write a query to display the current date & time. Label the column Today_Date.
	
	SELECT GETDATE() AS Today_Date;

--2. Write a query to find new date after 365 day with reference to today. 
	
	SELECT DATEADD(DAY, 365, GETDATE()) AS NewDate;

--3. Display the current date in a format that appears as may 5 1994 12:00AM. 
	
	SELECT CONCAT(DATENAME(MONTH,GETDATE()) , ' ',CAST(DATENAME(DAY,GETDATE()) AS VARCHAR) ,' ' , CAST(DATENAME(YEAR,GETDATE()) AS VARCHAR) , ' ' , RIGHT(CONVERT(VARCHAR, GETDATE()), 7) ) AS CUSTOMDATE

--4. Display the current date in a format that appears as 03 Jan 1995. 
	
	SELECT RIGHT('0' + CAST(DAY(GETDATE()) AS VARCHAR), 2) + ' ' +
       LEFT(DATENAME(MONTH, GETDATE()), 3) + ' ' +
       CAST(YEAR(GETDATE()) AS VARCHAR) AS CustomDate;

--5. Display the current date in a format that appears as Jan 04, 96. 
	
	SELECT LEFT(DATENAME(MONTH, GETDATE()), 3) + ' ' +
       RIGHT('0' + CAST(DAY(GETDATE()) AS VARCHAR), 2) + ', ' +
       RIGHT(CAST(YEAR(GETDATE()) AS VARCHAR), 2) AS CustomDate;

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 
	
	SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS Months_Diff;

--7. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
	
	SELECT DATEDIFF(HOUR, '2012-01-25T07:00:00', '2012-01-26T10:30:00') AS Hours_Diff;

--8. Write a query to extract Day, Month, Year from given date 12-May-16. 
	
	SELECT DAY('2016-05-12') AS DayPart,
       MONTH('2016-05-12') AS MonthPart,
       YEAR('2016-05-12') AS YearPart;

--9. Write a query that adds 5 years to current date. 

	SELECT DATEADD(YEAR, 5, GETDATE()) AS Plus5Years;

--10. Write a query to subtract 2 months from current date. 
	
	SELECT DATEADD(MONTH, -2, GETDATE()) AS Minus2Months;

--11. Extract month from current date using datename () and datepart () function. 

	SELECT DATENAME(MONTH, GETDATE()) AS Month_Name,
       DATEPART(MONTH, GETDATE()) AS Month_Number;

--12. Write a query to find out last date of current month. 

	SELECT EOMONTH(GETDATE()) AS Last_Date;

--13. Calculate your age in years and months. 
	
	SELECT DATEDIFF(YEAR,'2006-11-07',GETDATE()) Age_Years,
		DATEDIFF(MONTH, '2006-11-07', GETDATE()) % 12 AS Age_Months;

--Part – B: Perform following queries on EMP_MASTER table.  
	
--1. Write a query to find new date after 365 days with reference to JoiningDate. 
	
	SELECT EmpName, DATEADD(DAY, 365, JoiningDate) AS New_Date
	FROM EMP_MASTER;

--2. Write a query to find out total number of months between JoiningDate and 31-Mar-09. 
	
	SELECT EmpName, DATEDIFF(MONTH, JoiningDate, '2009-03-31') AS Month_Diff
	FROM EMP_MASTER;

--3. Write a query to find out total number of years between JoiningDate and 14-Sep-10. 
	
	SELECT EmpName, DATEDIFF(YEAR, JoiningDate, '2010-09-14') AS Year_Diff
	FROM EMP_MASTER;

--Part – C: Perform following queries on EMP_MASTER table. 
	
--1. Write a query to extract Day, Month, Year from JoiningDate. 
	
	SELECT EmpName, DAY(JoiningDate) AS DayPart,
       MONTH(JoiningDate) AS MonthPart,
       YEAR(JoiningDate) AS YearPart
	FROM EMP_MASTER;

--2. Write a query that adds 5 years to JoiningDate. 

	SELECT EmpName, DATEADD(YEAR, 5, JoiningDate) AS Plus5Years
	FROM EMP_MASTER;

--3. Write a query to subtract 2 months from JoiningDate. 
	
	SELECT EmpName, DATEADD(MONTH, -2, JoiningDate) AS Minus2Months
	FROM EMP_MASTER;

--4. Extract month from JoiningDate using datename () and datepart () function. 

	SELECT EmpName, DATENAME(MONTH, JoiningDate) AS MonthName,
       DATEPART(MONTH, JoiningDate) AS MonthNumber
	FROM EMP_MASTER;

--5. Select employee who joined between the 1st and 15th of any month in any year. 
	
	SELECT EmpName, JoiningDate
	FROM EMP_MASTER
	WHERE DAY(JoiningDate) BETWEEN 1 AND 15;

--6. Find employee whose JoiningDate is the last day of any month. 
	
	SELECT EmpName, JoiningDate
	FROM EMP_MASTER
	WHERE JoiningDate = EOMONTH(JoiningDate);

--7. List employee whose JoiningDate is during a leap year. 
	
	SELECT EmpName, JoiningDate
	FROM EMP_MASTER
	WHERE (YEAR(JoiningDate) % 4 = 0 AND YEAR(JoiningDate) % 100 <> 0)
	OR (YEAR(JoiningDate) % 400 = 0);