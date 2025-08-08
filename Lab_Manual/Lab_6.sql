USE CSE_A4_177

CREATE TABLE Students (
    StuID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Website VARCHAR(100),
    City VARCHAR(50),
    Address VARCHAR(255)
);

INSERT INTO Students (StuID, FirstName, LastName, Website, City, Address) VALUES
(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'A-303 ''Vasant Kunj'', Rajkot'),
(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', '"Ram Krupa", Raiya Road'),
(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot, near garden'),
(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', '"Jig�s Home", Narol'),
(1055, 'Harmit', 'Mitel', '@me.darshan.com', 'Rajkot', 'B-55, Raj Residency'),
(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'A502, Club House Building');

TRUNCATE TABLE STUDENTS

-- Perform SQL queries for Like operator 


-- Part � A: 

-- 1. Display the name of students whose name starts with �k�. 

    SELECT * 
    FROM Students
    WHERE FIRSTNAME LIKE 'K%'
    

-- 2. Display the name of students whose name consists of five characters. 

    SELECT *
    FROM Students
    WHERE FirstName LIKE '_____'
    
-- 3. Retrieve the first name & last name of students whose city name ends with �a� & contains six characters. 

    SELECT FirstName,LastName
    FROM Students
    WHERE CITY LIKE '_____A'

-- 4. Display all the students whose last name ends with �tel�. 

    SELECT *
    FROM Students
    WHERE LastName LIKE '%TEL'
    
-- 5. Display all the students whose first name starts with �ha� & ends with�t�. 

    SELECT * 
    FROM Students
    WHERE FIRSTNAME LIKE 'HA%T'
    
-- 6. Display all the students whose first name starts with �k� and third character is �y�.

    SELECT * 
    FROM Students
    WHERE FIRSTNAME LIKE 'K_Y%'

-- 7. Display the name of students having no website and name consists of five characters. 

    SELECT FirstName
    FROM Students 
    WHERE Website IS NULL AND FirstName LIKE '_____'

-- 8. Display all the students whose last name consist of �jer�.  

    SELECT * 
    FROM Students
    WHERE LASTNAME LIKE '%JER%'
    
-- 9. Display all the students whose city name starts with either �r� or �b�. 
    
    SELECT * 
    FROM Students
    WHERE CITY LIKE '[R,B]%'

-- 10. Display all the name students having websites. 

    SELECT FIRSTNAME 
    FROM Students
    WHERE Website IS NOT NULL 
    
-- 11. Display all the students whose name starts from alphabet A to H. 

    SELECT *
    FROM Students
    WHERE FIRSTNAME LIKE '[A-H]%'

-- 12. Display all the students whose name�s second character is vowel. 

    SELECT *
    FROM Students
    WHERE FirstName LIKE '_[A,E,I,O,U]%' 

-- 13. Display the name of students having no website and name consists of minimum five characters. 

    SELECT * 
    FROM Students
    WHERE Website IS NULL AND FIRSTNAME LIKE '_____%'
    
-- 14. Display all the students whose last name starts with �Pat�.   

    SELECT *
    FROM Students
    WHERE LASTNAME LIKE 'PAT%'
    
-- 15. Display all the students whose city name does not starts with �b�. 

    SELECT * 
    FROM Students
    WHERE CITY LIKE '[^B]%'
        --OR
    SELECT * 
    FROM Students
    WHERE CITY NOT LIKE '[B]%'
        --OR
    SELECT * 
    FROM Students
    WHERE NOT CITY LIKE '[B]%'

-- 16. Display all the students whose student ID ends with digit. 

    SELECT * 
    FROM Students
    WHERE StuID LIKE '%[0-9]'

-- 17. Display all the students whose address does not contain any digit. 

    SELECT *
    FROM Students
    WHERE Address NOT LIKE '%[0-9]%'
    

-- 18. Find students whose first name starts with 'B', last name ends with 'A', and their website contains either 
-- 'math' or 'science'. Ensure that their city does not start with 'B'. 

    SELECT *
    FROM Students
    WHERE FIRSTNAME LIKE 'B%' 
        AND LASTNAME LIKE '%A' 
        AND (WEBSITE LIKE '%MATH%' OR WEBSITE LIKE '%SCIENCE%') 
        AND CITY NOT LIKE 'B%'

-- 19. Retrieve students who have 'Shah' in their last name and whose city ends with 'd'. Additionally, their 
-- website should be either null or contain 'com'. 

    SELECT * 
    FROM Students
    WHERE LASTNAME LIKE '%SHAH%' 
        AND CITY LIKE '%D'
        AND (Website IS NULL OR Website LIKE '%COM%')

-- 20. Select students whose first and second character is a vowel. Their city should start with 'R' and they must 
-- have a website containing '.com'. 

    SELECT * 
    FROM Students
    WHERE (FirstName LIKE '[A,E,I,O,U][A,E,I,O,U]%') 
        AND (CITY LIKE 'R%') 
        AND (Website LIKE '%COM%')

        -- OR

    SELECT * 
    FROM Students
    WHERE (FirstName LIKE '[AEIOU][AEIOU]%') 
        AND (CITY LIKE 'R%') 
        AND (Website LIKE '%COM%')

   SELECT * FROM Students


--   Part � B: 


-- 1. Display all the students whose name�s second character is vowel and of and start with H. 

    SELECT *
    FROM Students
    WHERE FIRSTNAME LIKE 'H[AEIOU]%'

-- 2. Display all the students whose last name does not ends with �a�. 


    SELECT *
    FROM Students
    WHERE LASTNAME LIKE '%A'

-- 3. Display all the students whose first name starts with consonant. 

    SELECT * 
    FROM Students
    WHERE FIRSTNAME LIKE '[A,E,I,O,U]%'

-- 4. Retrieve student details whose first name starts with 'K', last name ends with 'tel', and either their 
-- website contains 'tech' or they live in a city starting with 'R'. 

    SELECT *
    FROM Students
    WHERE FIRSTNAME LIKE 'K%' AND LASTNAME LIKE '%TEL'
                    AND (Website LIKE '%TECH%' OR CITY LIKE 'R%')

-- 5. Retrieve students whose address contains a hyphen '-' and whose city starts with either 'R' or 'B'. They 
-- must have a website that ends with '.com' and their first name should not start with 'A'. 

    SELECT * 
    FROM Students
    WHERE Address LIKE '%-%' 
                  AND (CITY LIKE 'R%' OR CITY LIKE 'B%')
                  AND WEBSITE LIKE '%.COM' AND FIRSTNAME NOT LIKE 'A%'



-- Part � C: 


--1. Display all the students whose address contains single quote or double quote. 

    SELECT * 
    FROM Students
    WHERE ADDRESS LIKE '%''%' 
        OR ADDRESS LIKE '%"%'


    SELECT *
    FROM Students;


-- 2. Find students whose city does not contain the letter 'S' and their address contains either single or double 
-- quotes. Their last name should start with 'P' and they must have a website that contains 'on'. 


    SELECT *
    FROM STUDENTS 
    WHERE CITY NOT LIKE '%S%' 
        AND (ADDRESS LIKE '%''%' OR ADDRESS LIKE '%"%')
        AND LASTNAME LIKE 'P%'
        AND WEBSITE LIKE '%ON%'