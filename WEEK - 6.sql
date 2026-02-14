DROP DATABASE IF EXISTS dbms_lab6;
CREATE DATABASE dbms_lab6;
USE dbms_lab6;

-- 6.1 Create officers table
CREATE TABLE officers(officer_id INT PRIMARY KEY, officer_name VARCHAR(20), fficer_address VARCHAR(20));

INSERT INTO officers VALUES
(1,'ajeet','mau'),
(2,'deepika','lucknow'),
(3,'vimal','hyderabad'),
(4,'rahul','delhi'),
(5,'sneha','pune');

-- 6.1 Create students table
CREATE TABLE students(student_id INT PRIMARY KEY, student_name VARCHAR(20), course_name VARCHAR(20));

INSERT INTO students VALUES
(1,'aryan','java'),
(2,'rohini','hadoop'),
(3,'lallu','mongodb'),
(4,'kiran','python'),
(5,'meena','mysql');

-- 6.2 Inner Join
SELECT officers.officer_name, officers.officer_address, students.course_name
FROM officers
INNER JOIN students
ON officers.officer_id = students.student_id;

-- 6.3 Left Outer Join
SELECT officers.officer_name, officers.officer_address, students.course_name
FROM officers
LEFT JOIN students
ON officers.officer_id = students.student_id;

-- 6.4 Right Outer Join
SELECT officers.officer_name, officers.officer_address, students.course_name, students.student_name
FROM officers
RIGHT JOIN students
ON officers.officer_id = students.student_id;

-- 6.5 Cross Join
SELECT officers.officer_name, officers.officer_address, students.course_name
FROM officers
CROSS JOIN students;

-- Try Program 1 Self Join
SELECT a.officer_name AS Officer1, b.officer_name AS Officer2, a.officer_address
FROM officers a
JOIN officers b
ON a.officer_address = b.officer_address
AND a.officer_id <> b.officer_id;

-- Try Program 2 Equi Join
SELECT officers.officer_name, students.student_name
FROM officers
JOIN students
ON officers.officer_id = students.student_id;

-- Try Program 3 Natural Join
SELECT officer_id, officer_name, officer_address
FROM officers
NATURAL JOIN students;

-- 6.6 Create employee table
CREATE TABLE employee(emp_id INT PRIMARY KEY, name VARCHAR(20), working_hours INT);

INSERT INTO employee VALUES
(1,'arun',8),
(2,'bala',7),
(3,'charan',9),
(4,'divya',6),
(5,'eshwar',8),
(6,'farah',7);

-- 6.6 COUNT()
SELECT COUNT(name) FROM employee;

-- 6.6 SUM()
SELECT SUM(working_hours) AS Total_working_hours FROM employee;

-- 6.6 AVG()
SELECT AVG(working_hours) AS Average_working_hours FROM employee;

-- 6.6 MIN()
SELECT MIN(working_hours) AS Minimum_working_hours FROM employee;

-- 6.6 MAX()
SELECT MAX(working_hours) AS Maximum_working_hours FROM employee;

-- Try Aggregate FIRST
SELECT * FROM employee ORDER BY emp_id ASC LIMIT 1;

-- Try Aggregate LAST
SELECT * FROM employee ORDER BY emp_id DESC LIMIT 1;
