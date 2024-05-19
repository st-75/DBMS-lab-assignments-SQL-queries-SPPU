-- Create table Cust_Master(Cust_no, Cust_name, Qty_Ordered, Order_date, Cust_addr )
-- Cust_no is defined as primary key,
-- Insert ten records in the table.
-- • List names of customers having 'a' as second letter in their name.
-- • List customers who stay in city whose first letter is 'M'
-- • Display order from Customer no C1002,C1005,C1007 and C1008
-- • List Clients who stay in either 'Banglore or 'Manglore'
-- • Create view Customer_View consisting of Cust_no, Qty_ordered and Order_date
;

CREATE TABLE Cust_Master (
    Cust_no VARCHAR(5) PRIMARY KEY,
    Cust_name VARCHAR(255),
    Qty_Ordered INT,
    Order_date DATE,
    Cust_addr VARCHAR(255)
);

INSERT INTO Cust_Master (Cust_no, Cust_name, Qty_Ordered, Order_date, Cust_addr)
VALUES
    ('C1001', 'Alice', 5, '2023-10-01', 'Bangalore'),
    ('C1002', 'Bob', 3, '2023-10-02', 'Mangalore'),
    ('C1003', 'Charlie', 8, '2023-10-03', 'Chennai'),
    ('C1004', 'David', 2, '2023-10-04', 'Mumbai'),
    ('C1005', 'Eve', 6, '2023-10-05', 'Delhi'),
    ('C1006', 'Frank', 4, '2023-10-06', 'Kolkata'),
    ('C1007', 'Grace', 7, '2023-10-07', 'Mangalore'),
    ('C1008', 'Hannah', 9, '2023-10-08', 'Bangalore'),
    ('C1009', 'Isaac', 3, '2023-10-09', 'Pune'),
    ('C1010', 'Jack', 5, '2023-10-10', 'Mysore');

-- • List names of customers having 'a' as second letter in their name.
SELECT Cust_name
FROM Cust_Master
WHERE SUBSTRING(Cust_name, 2, 1) = 'a';

-- • List customers who stay in city whose first letter is 'M'
SELECT Cust_name
FROM Cust_Master
WHERE LEFT(Cust_addr, 1) = 'M';

-- • Display order from Customer no C1002,C1005,C1007 and C1008
SELECT *
FROM Cust_Master
WHERE Cust_no IN ('C1002', 'C1005', 'C1007', 'C1008');

-- • List Clients who stay in either 'Banglore or 'Manglore'
SELECT Cust_name
FROM Cust_Master
WHERE Cust_addr IN ('Bangalore', 'Mangalore');

-- • Create view Customer_View consisting of Cust_no, Qty_ordered and Order_date
CREATE VIEW Customer_View AS
SELECT Cust_no, Qty_Ordered, Order_date
FROM Cust_Master;
