create database Week2;
use Week2;

-- 2.1 : --------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE employee (
    empno INT,
    ename VARCHAR(20),
    job VARCHAR(20),
    mgr INT,
    sal INT
);

ALTER TABLE employee ADD commission INT;

INSERT INTO employee VALUES
(10, 'Arun', 'Manager', NULL, 50000, 5000),
(11, 'Kiran', 'Clerk', 10, 20000, 2000),
(12, 'Meena', 'Analyst', 10, 40000, 4000),
(13, 'Ravi', 'Salesman', 10, 25000, 2500),
(19, 'Sita', 'Clerk', 11, 18000, 1800);

set sql_safe_updates = 0;
UPDATE employee
SET job = 'Senior Clerk'
WHERE job = 'Clerk';

ALTER TABLE employee
RENAME COLUMN ename TO emp_name;

DELETE FROM employee
WHERE empno = 19;

select * from employee;

-- 2.2 : --------------------------------------------------------------------------------------------------------------------------------------


-- Try - 1 :
SELECT MAX(sal) FROM employee WHERE job = 'Salesman';

-- Try - 2 :
SELECT emp_name FROM employee WHERE emp_name LIKE 'A%';

-- Try - 3 :
SELECT * FROM employee WHERE hiredate < '1981-09-30';

-- Try - 4 : 
SELECT * FROM employee ORDER BY sal DESC;

-- Try - 5 : 
SELECT empno, sal FROM employee WHERE job = 'Senior Clerk';
