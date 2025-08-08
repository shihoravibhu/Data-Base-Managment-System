select * from Person
select * from dept


--From the above given table perform the following queries:  

--Part – A: 

--1. Combine information from Person and Department table using cross join or Cartesian product. 
	
	select *
	from dept join person
	on dept.departmentID = person.departmentID

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
	


--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
--11. Find department wise person counts. 
--12. Give department wise maximum & minimum salary with department name. 
--13. Find city wise total, average, maximum and minimum salary. 
--14. Find the average salary of a person who belongs to Ahmedabad city. 
--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column)