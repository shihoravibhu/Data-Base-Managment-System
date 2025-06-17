CREATE DATABASE XYZ;

USE XYZ;

CREATE TABLE employee(
	id Int ,
	name varchar(50),
	salary Int
);

INSERT INTO employee(
id,name,salary)
VALUES
(1,'ADAM',25000),
(2,'BOB',30000),
(3,'CASEY',40000);

SELECT * FROM employee;

DROP DATABASE XYZ;
