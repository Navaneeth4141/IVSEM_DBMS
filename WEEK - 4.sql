create database week4;
use week4;

CREATE TABLE PUBLISHER( PID INT PRIMARY KEY, PNAME VARCHAR(50), ADDRESS VARCHAR(100), STATE VARCHAR(50), PHONE VARCHAR(15), EMAILID VARCHAR(50) );

CREATE TABLE BOOK( ISBN VARCHAR(10) PRIMARY KEY, BOOK_TITLE VARCHAR(100), CATEGORY VARCHAR(50), PRICE DECIMAL(8,2), COPYRIGHT_DATE DATE, YEAR INT, PAGE_COUNT INT, PID INT, FOREIGN KEY (PID) REFERENCES PUBLISHER(PID) );

CREATE TABLE AUTHOR( AID INT PRIMARY KEY, ANAME VARCHAR(50), STATE VARCHAR(50), CITY VARCHAR(50), ZIP VARCHAR(10), PHONE VARCHAR(15), URL VARCHAR(100) );

CREATE TABLE AUTHOR_BOOK( AID INT, ISBN VARCHAR(10), PRIMARY KEY(AID,ISBN), FOREIGN KEY(AID) REFERENCES AUTHOR(AID), FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN) );

CREATE TABLE REVIEW( RID INT PRIMARY KEY, ISBN VARCHAR(10), RATING INT, FOREIGN KEY(ISBN) REFERENCES BOOK(ISBN) );

INSERT INTO PUBLISHER VALUES
(1,'MEHTA','Mumbai','Maharashtra','9876543210','mehta@gmail.com'),
(2,'KORTH','Bangalore','Karnataka','9123456780','korth@gmail.com'),
(3,'PEARSON','Chennai','Tamil Nadu','9988776655','pearson@gmail.com'),
(4,'MCGRAW','Delhi','Delhi','9090909090','mcgraw@gmail.com'),
(5,'OXFORD','Pune','Maharashtra','8080808080','oxford@gmail.com');

INSERT INTO AUTHOR VALUES
(1,'CHETAN BHAGAT','Maharashtra','Mumbai','400001','9000000001','www.chetanbhagat.com'),
(2,'Chetna Kulkarni','Maharashtra','Pune','411001','9000000002','www.chetnakulkarni.com'),
(3,'Catherine Paul','Maharashtra','Pune','411002','9000000003','www.catherinepaul.com'),
(4,'Kiran Desai','Karnataka','Bangalore','560001','9000000004','www.kirandesai.com'),
(5,'Ravi Kumar','Tamil Nadu','Chennai','600001','9000000005','www.ravikumar.com');

INSERT INTO BOOK VALUES
('B101','2 States','Novel',350.00,'2009-01-01',2009,269,1),
('B102','Half Girlfriend','Novel',300.00,'2014-01-01',2014,260,1),
('B103','Data Structures','Education',450.00,'2010-01-01',2010,550,2),
('B104','C Programming','Education',250.00,'2008-01-01',2008,120,3),
('B105','Short Stories','Literature',150.00,'2005-01-01',2005,80,5);

INSERT INTO AUTHOR_BOOK VALUES
(1,'B101'),
(1,'B102'),
(2,'B103'),
(3,'B104'),
(5,'B105');

INSERT INTO REVIEW VALUES
(1,'B101',4),
(2,'B102',5),
(3,'B103',3),
(4,'B104',4),
(5,'B105',2);

select * from BOOK;

-- 1 Retrieve city, phone, url of author CHETAN BHAGAT
SELECT CITY, PHONE, URL FROM AUTHOR WHERE ANAME='CHETAN BHAGAT';

-- 2 Retrieve book title, review id and rating of all books
SELECT B.BOOK_TITLE, R.RID, R.RATING FROM BOOK B JOIN REVIEW R ON B.ISBN=R.ISBN;

-- 3 Retrieve book title, price, author name and url for publisher MEHTA
SELECT B.BOOK_TITLE, B.PRICE, A.ANAME, A.URL FROM BOOK B JOIN AUTHOR_BOOK AB ON B.ISBN=AB.ISBN JOIN AUTHOR A ON AB.AID=A.AID JOIN PUBLISHER P ON B.PID=P.PID WHERE P.PNAME='MEHTA';

-- 4 Change phone number of MEHTA publisher
UPDATE PUBLISHER SET PHONE='123456' WHERE PNAME='MEHTA';

-- 5 Average, maximum and minimum price of each publisher
SELECT P.PNAME, AVG(B.PRICE), MAX(B.PRICE), MIN(B.PRICE) FROM BOOK B JOIN PUBLISHER P ON B.PID=P.PID GROUP BY P.PNAME;

-- 6 Delete books with page count less than 100
DELETE FROM BOOK WHERE PAGE_COUNT < 100;

-- 7 Authors in Pune whose name starts with C
SELECT * FROM AUTHOR WHERE CITY='Pune' AND ANAME LIKE 'C%';

-- 8 Authors living in same city as KORTH publisher
SELECT * FROM AUTHOR WHERE CITY = ( SELECT ADDRESS FROM PUBLISHER WHERE PNAME='KORTH' );

-- 9 Procedure to update page count
DELIMITER $$
CREATE PROCEDURE update_page_count( IN p_isbn VARCHAR(10), IN new_pages INT ) BEGIN UPDATE BOOK SET PAGE_COUNT=new_pages WHERE ISBN=p_isbn; END$$ DELIMITER ;
CALL update_page_count('B101',300);

-- 10 Function to return price of a book
DELIMITER $$
CREATE FUNCTION get_book_price(p_isbn VARCHAR(10)) RETURNS DECIMAL(8,2) DETERMINISTIC BEGIN DECLARE p DECIMAL(8,2);
    SELECT PRICE INTO p FROM BOOK WHERE ISBN=p_isbn; RETURN p; END$$ DELIMITER ;
SELECT get_book_price('B101');
