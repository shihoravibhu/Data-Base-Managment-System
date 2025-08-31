select * from Person
select * from dept


--From the above given table perform the following queries:  

--Part – A: 

--1. Combine information from Person and Department table using cross join or Cartesian product. 
	
	select *
	from dept cross join person
	
--2. Find all persons with their department name 
	
	select person.personName , dept.departmentName
	from dept join person
	on dept.departmentID = person.departmentID

--3. Find all persons with their department name & code. 
	
	select person.personName , dept.departmentName , dept.departmentcode
	from dept join person
	on dept.departmentID = person.departmentID

--4. Find all persons with their department code and location. 
	
	select person.personName , dept.departmentcode , dept.Location
	from dept join person
	on dept.departmentID = person.departmentID

--5. Find the detail of the person who belongs to Mechanical department.
	
	select *
	from dept join person
	on person.departmentID = dept.departmentID 
	where dept.departmentName = 'Mechanical'


--6. Final person’s name, department code and salary who lives in Ahmedabad city.
	
	select person.personname , dept.departmentcode , person.salary
	from dept join person
	on person.departmentID = dept.departmentID 
	where person.city = 'Ahmedabad'

--7. Find the person's name whose department is in C-Block. 
	
	select person.personname 
	from dept join person
	on person.departmentID = dept.departmentID 
	where dept.location = 'c-block'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
	
	select person.personname , person.salary , dept.departmentname
	from dept join person 
	on dept.departmentID = person.departmentID
	where person.city = 'jamnagar' 

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 

	select person.personname , person.salary , dept.departmentname
	from dept join person 
	on dept.departmentID = person.departmentID
	where dept.departmentName = 'civil' and person.JoiningDate > '2001-08-01'
	
--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 

	select person.personname , dept.departmentname
	from dept join person 
	on dept.departmentID = person.departmentID
	where datediff(day,person.JoiningDate,GETDATE()) > 365
	
--11. Find department wise person counts. 
	
	select count(person.personName) as count , dept.departmentName
	from dept join person
	on dept.DepartmentID = person.departmentID
	group by dept.departmentName
	
--12. Give department wise maximum & minimum salary with department name. 
	
	select max(person.salary) as max, min(person.salary) as min , dept.departmentName
	from dept join person
	on dept.departmentID = person.departmentID
	group by dept.departmentName

--13. Find city wise total, average, maximum and minimum salary. 
	
	SELECT city,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary,
       MAX(salary) AS max_salary,
       MIN(salary) AS min_salary
	FROM person
	GROUP BY city;

 
--14. Find the average salary of a person who belongs to Ahmedabad city. 
	
	select avg(salary) as avg_salary
	from person
	where city = 'ahmedabad'

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)

	select person.personName + 'lives in ' + person.city + ' and works in ' + dept.departmentName 
	from dept join person
	on dept.departmentID = person.departmentID

	--or

	SELECT CONCAT(person.personName, ' lives in ', person.city, ' and works in ', dept.departmentName, ' Department.')
	FROM dept JOIN person 
	ON dept.departmentID = person.departmentID;



--	Part – B: 


--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
	
	select person.personName + ' earns ' + cast(person.salary as varchar) + ' from ' + dept.departmentName + ' department monthly' 
	from dept join person
	on dept.departmentID = person.departmentID

	--or

	SELECT CONCAT(person.personName, ' earns ', 
              person.salary, 
              ' from ', dept.departmentName, 
              ' department monthly.') AS description
	FROM person
	JOIN dept ON person.departmentID = dept.departmentID;


--2. Find city & department wise total, average & maximum salaries.

	SELECT p.city,
       d.departmentName,
       SUM(p.salary) AS total_salary,
       AVG(p.salary) AS avg_salary,
       MAX(p.salary) AS max_salary
	FROM person p
	JOIN dept d ON p.departmentID = d.departmentID
	GROUP BY p.city, d.departmentName;

--3. Find all persons who do not belong to any department.
	
	select personName 
	from person
	where departmentID IS NULL

	--or

	SELECT p.personName
	FROM person p
	LEFT JOIN dept d ON p.departmentID = d.departmentID
	WHERE d.departmentID IS NULL;


--4. Find all departments whose total salary is exceeding 100000. 
	
	select dept.departmentName , sum(salary) as total
	from dept join person
	on dept.departmentID = person.departmentID
	group by dept.departmentName
	having sum(salary) > 100000



--Part – C: 

--1. List all departments who have no person. 
	
	select dept.departmentName , count(person.personName) AS personCount
	from dept left join person
	on dept.departmentID = person.departmentID
	group by dept.departmentName
	having count(person.personName) = 0

--2. List out department names in which more than two persons are working. 
	
	select dept.departmentName , count(person.personName) AS personCount
	from dept join person
	on dept.departmentID = person.departmentID
	group by dept.departmentName
	having count(person.personName) > 2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update)

	update person 
	set person.salary = person.salary * 0.1 + person.salary
	from dept join person
	on dept.departmentID = person.departmentID
	where dept.departmentName = 'computer'