-- SQL queries
-- Create following tables with suitable constraints. Make suitable use of AUTO_INCREMENT.
-- Insert data and solve the following queries:
-- CUSTOMERS(CNo, Cname, Ccity, CMobile)
-- ITEMS(INo, Iname, Itype, Iprice, Icount)
-- PURCHASE(PNo, Pdate, Pquantity, Cno, INo)
-- 1. List all stationary items with price between 400/- to 1000/-
-- 2. Change the mobile number of customer “Gopal”
-- 3. Display the item with maximum price
-- 4. Display all purchases sorted from the most recent to the oldest
;


CREATE TABLE CUSTOMERS (
    CNo INT AUTO_INCREMENT PRIMARY KEY,
    Cname VARCHAR(255) NOT NULL,
    Ccity VARCHAR(255) NOT NULL,
    CMobile VARCHAR(15) NOT NULL
);

CREATE TABLE ITEMS (
    INo INT AUTO_INCREMENT PRIMARY KEY,
    Iname VARCHAR(255) NOT NULL,
    Itype VARCHAR(255) NOT NULL,
    Iprice DECIMAL(10, 2) NOT NULL,
    Icount INT NOT NULL
);

CREATE TABLE PURCHASE (
    PNo INT AUTO_INCREMENT PRIMARY KEY,
    Pdate DATE NOT NULL,
    Pquantity INT NOT NULL,
    Cno INT NOT NULL,
    INo INT NOT NULL,
    FOREIGN KEY (Cno) REFERENCES CUSTOMERS(CNo),
    FOREIGN KEY (INo) REFERENCES ITEMS(INo)
);

-- Insert data into CUSTOMERS
INSERT INTO CUSTOMERS (Cname, Ccity, CMobile) VALUES
    ('Gopal', 'Mumbai', '123-456-7890'),
    ('Alice', 'Delhi', '987-654-3210'),
    ('Bob', 'Kolkata', '555-555-5555');

-- Insert data into ITEMS
INSERT INTO ITEMS (Iname, Itype, Iprice, Icount) VALUES
    ('Pen', 'Stationary', 10.50, 100),
    ('Notebook', 'Stationary', 25.00, 50),
    ('Mobile Phone', 'Electronics', 15000.00, 10);

-- Insert data into PURCHASE
INSERT INTO PURCHASE (Pdate, Pquantity, Cno, INo) VALUES
    ('2023-10-01', 5, 1, 1),
    ('2023-10-02', 2, 2, 2),
    ('2023-10-03', 1, 3, 3);


-- 1. List all stationary items with price between 400/- to 1000/-
SELECT *
FROM ITEMS
WHERE Itype = 'Stationary' AND Iprice BETWEEN 400 AND 1000;

-- 2. Change the mobile number of customer “Gopal”
UPDATE CUSTOMERS
SET CMobile = '999-999-9999'
WHERE Cname = 'Gopal';

-- 3. Display the item with maximum price
SELECT *
FROM ITEMS
WHERE Iprice = (SELECT MAX(Iprice) FROM ITEMS);

-- 4. Display all purchases sorted from the most recent to the oldest
SELECT *
FROM PURCHASE
ORDER BY Pdate DESC;


