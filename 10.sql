-- Create following tables with suitable constraints. Make suitable use of AUTO_INCREMENT.
-- Insert data and solve the following queries:
-- CUSTOMERS(CNo, Cname, Ccity, CMobile)
-- ITEMS(INo, Iname, Itype, Iprice, Icount)
-- PURCHASE(PNo, Pdate, Pquantity, Cno, INo)
-- 5. Count the number of customers in every city
-- 6. Display all purchased quantity of Customer Maya
-- 7. Display list of customers whose name ends with 'a'
-- 8. Create view which shows Iname, Price and Count of all stationary items in descending order of price
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
    ('Maya', 'Mumbai', '123-456-7890'),
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



-- 5. Count the number of customers in every city
SELECT Ccity, COUNT(*) AS CustomerCount
FROM CUSTOMERS
GROUP BY Ccity;

-- 6. Display all purchased quantity of Customer Maya
SELECT SUM(Pquantity) AS TotalPurchasedQuantity
FROM PURCHASE
WHERE Cno = (SELECT CNo FROM CUSTOMERS WHERE Cname = 'Maya');

-- 7. Display list of customers whose name ends with 'a'
SELECT Cname
FROM CUSTOMERS
WHERE Cname LIKE '%a';

-- 8. Create view which shows Iname, Price and Count of all stationary items in descending order of price
CREATE VIEW Stationary_Items_View AS
SELECT Iname, Iprice, Icount
FROM ITEMS
WHERE Itype = 'Stationary'
ORDER BY Iprice DESC;
