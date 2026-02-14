create database week8;
use week8;
-- 8.1 CREATE USER
-- Create User
CREATE USER 'iare'@'localhost' IDENTIFIED BY 'iare123';
-- See List of Users
SELECT user FROM mysql.user;
-- See Current User
SELECT CURRENT_USER();
-- See Description of mysql.user Table
DESC mysql.user;
-- See List of Users with Host
SELECT user, host FROM mysql.user;


-- 8.2 GRANT ALL PRIVILEGES / SPECIFIC PRIVILEGES
-- Grant All Privileges
GRANT ALL PRIVILEGES ON *.* TO '2nduser'@'localhost';
-- Grant Specific Privileges
GRANT CREATE, SELECT ON *.* TO '2nduser'@'localhost';
-- Show Privileges
SHOW GRANTS FOR '2nduser'@'localhost';

-- 8.3 REVOKE PRIVILEGES
REVOKE ALL PRIVILEGES ON *.* FROM '2nduser'@'localhost';
SHOW GRANTS FOR '2nduser'@'localhost';


-- 8.4 LOGIN AS USER (Run in Command Prompt)
-- mysql -u 2nduser -p


-- 8.5 DROP USER
DROP USER '2nduser'@'localhost';
SELECT user, host FROM mysql.user;


-- TRY PROGRAM


-- Create New User
CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'test123';

-- Grant Specific Privileges
GRANT SELECT, INSERT ON *.* TO 'testuser'@'localhost';

-- Show Granted Privileges
SHOW GRANTS FOR 'testuser'@'localhost';

-- Revoke Privilege
REVOKE INSERT ON *.* FROM 'testuser'@'localhost';

SHOW GRANTS FOR 'testuser'@'localhost';

-- Drop Test User
DROP USER 'testuser'@'localhost';

SELECT user, host FROM mysql.user;
