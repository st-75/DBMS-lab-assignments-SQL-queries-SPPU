-- Create following tables with suitable constraints. Make suitable use of AUTO_INCREMENT.
-- Insert data and solve the following queries:
-- PROPERTIES(Pno, Type, Sq_Ft_Area, Rent, Address, Status, Owner No)
-- OWNERS (OwnerNo, OwnerName, Phno)
-- 1. Display all 1BHK apartments in Kothrud which are not rented
-- 2. Display all properties owned by “Gopal”
-- 3. Write a query to display the smallest property of each owner
-- 4. Display all properties in Kothrud in Descending order of rent
;

CREATE TABLE PROPERTIES (
    Pno INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(10) NOT NULL,
    Sq_Ft_Area INT NOT NULL,
    Rent DECIMAL(10, 2) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Status VARCHAR(10) NOT NULL,
    OwnerNo INT NOT NULL,
    FOREIGN KEY (OwnerNo) REFERENCES OWNERS(OwnerNo)
);

CREATE TABLE OWNERS (
    OwnerNo INT AUTO_INCREMENT PRIMARY KEY,
    OwnerName VARCHAR(255) NOT NULL,
    Phno VARCHAR(15) NOT NULL
);


-- Insert data into OWNERS
INSERT INTO OWNERS (OwnerName, Phno) VALUES
    ('Gopal', '123-456-7890'),
    ('Alice', '987-654-3210'),
    ('Bob', '555-555-5555');

-- Insert data into PROPERTIES
INSERT INTO PROPERTIES (Type, Sq_Ft_Area, Rent, Address, Status, OwnerNo) VALUES
    ('1BHK', 800, 12000, 'Kothrud', 'Not Rented', 1),
    ('2BHK', 1200, 18000, 'Baner', 'Rented', 2),
    ('3BHK', 1500, 25000, 'Kothrud', 'Not Rented', 2),
    ('1BHK', 700, 11000, 'Kothrud', 'Rented', 3),
    ('2BHK', 1000, 16000, 'Wakad', 'Not Rented', 3);




-- 1. Display all 1BHK apartments in Kothrud which are not rented
SELECT * FROM PROPERTIES WHERE Type = '1BHK' AND Address = 'Kothrud' AND Status = 'Not Rented';

-- 2. Display all properties owned by “Gopal”
-- Assuming Gopal's OwnerNo is 1
SELECT * FROM PROPERTIES WHERE OwnerNo = 1; 

-- 3. Write a query to display the smallest property of each owner
SELECT OwnerNo, MIN(Sq_Ft_Area) AS Smallest_Property FROM PROPERTIES GROUP BY OwnerNo;

-- 4. Display all properties in Kothrud in Descending order of rent
SELECT * FROM PROPERTIES WHERE Address = 'Kothrud' ORDER BY Rent DESC;
