create database week3;
use week3;
CREATE TABLE department (
    deptno INT,
    deptname VARCHAR(10),
    location VARCHAR(10)
);

desc department;
select * from department;
SELECT deptno, deptname FROM department GROUP BY deptno, deptname;
UPDATE department
SET designation = 'accountant'
WHERE deptno = 17;
select count(*) from department;