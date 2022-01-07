-- Create a Database Named class_one_assignment
CREATE DATABASE class_one_assignment;

USE class_one_assignment;

-- Create a Table Named Customers.
CREATE TABLE Customers(
Customer_ID INT AUTO_INCREMENT,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Date_of_Birth DATE,
Phone VARCHAR(50),
Address VARCHAR(50) NOT NULL,
City VARCHAR(50),
State VARCHAR(50),
Points FLOAT(50),
PRIMARY KEY(Customer_ID)
);

SELECT * FROM Customers;

DROP TABLE Customers;

ALTER TABLE Customers AUTO_INCREMENT = 101;

--  Insert Customer Data:
INSERT INTO Customers(First_Name, Last_Name, Date_of_Birth, Phone, Address, City, State, Points)
VALUES('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', '2273'),
('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', '947'),
('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', '2967'),
('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', '457'),
('Clemmie', 'Betchley', '1973-11-07', '','5 Spohn Circle', 'Arlington', 'TX', '3675');

-- Show only 2 members whose points are more than 1000.
SELECT * FROM Customers WHERE Points>1000 ORDER BY Points LIMIT 2;

-- Find the customers whose age is in 1980 to 1990 or points less than 1000.
SELECT * FROM Customers WHERE (Date_of_Birth BETWEEN '1980-01-01' AND '1990-12-31') OR Points IN(SELECT Points FROM Customers WHERE Points<1000);

-- Order the customers by points in ascending and descending order.
SELECT * FROM Customers ORDER BY Points ASC;
SELECT * FROM Customers ORDER BY Points DESC;

-- Find the customer whose name contains 'burgh' using like and regexp.
SELECT * FROM Customers WHERE Last_Name LIKE '%burgh%';
SELECT * FROM Customers WHERE Last_Name REGEXP 'burgh';

-- Find the customer who does not have phone number.
SELECT * FROM Customers WHERE Phone = ' ';

-- Change the 'Date of Birth' column name into 'dob'.
ALTER TABLE Customers CHANGE COLUMN Date_of_Birth dob DATE;

-- Find the max point holder customer.
SELECT * FROM Customers WHERE Points=(SELECT MAX(Points)FROM Customers);

-- Execute a query for the following scenario-
-- 	If customers have points less than 1000, they are bronze member.
-- 	If customers have points more than 1000 and less than 2000, they are silver member.
-- 	If customers have points more than 2000 and less than 3000, they are gold member.
-- 	If customers have points more than 3000, they are platinum member.
SELECT Customer_ID, First_Name, Last_Name, Points,
CASE 
	WHEN Points<1000 THEN 'bronze member'
	WHEN Points BETWEEN 1001 AND 1999 THEN 'silver member'
	WHEN Points BETWEEN 2001 AND 2999 THEN 'gold member'
	WHEN Points>3000 THEN 'platinum member'
END AS Membership_Levels FROM Customers ORDER BY Points;

