-- Basic SQL Create following tables with suitable constraints. Make suitable use of AUTO_INCREMENT.
-- Insert data and solve the following queries:
-- PROPERTIES(Pno, Type, Sq_Ft_Area, Rent, Address, Status, Owner No)
-- OWNERS (OwnerNo, OwnerName, Phno)
-- 5. Create a view which shows OwnerName along with his Pno, type, Address and Rent
-- 6. Display the names of all Owners whose name has “ee”
-- 7. Display Pno, Type, Address, Rent and status of all properties with rent greater than 15000/- and less
-- than 22000/-
-- 8. Display different property types registered with the real estate agency
;

CREATE TABLE PROPERTIES (
    Pno INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(255) NOT NULL,
    Sq_Ft_Area INT NOT NULL,
    Rent DECIMAL(10, 2) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Status VARCHAR(255) NOT NULL,
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
    ('John Doe', '123-456-7890'),
    ('Jane Smith', '987-654-3210'),
    ('Mike Lee', '555-555-5555');

-- Insert data into PROPERTIES
INSERT INTO PROPERTIES (Type, Sq_Ft_Area, Rent, Address, Status, OwnerNo) VALUES
    ('Apartment', 1000, 20000, '123 Main St', 'Available', 1),
    ('House', 1500, 25000, '456 Elm St', 'Rented', 2),
    ('Condo', 800, 18000, '789 Oak St', 'Available', 3);



-- 5. Create a view which shows OwnerName along with his Pno, type, Address and Rent
CREATE VIEW Owner_Property_View AS
SELECT o.OwnerName, p.Pno, p.Type, p.Address, p.Rent
FROM OWNERS o
JOIN PROPERTIES p ON o.OwnerNo = p.OwnerNo;

-- 6. Display the names of all Owners whose name has “ee”
SELECT OwnerName
FROM OWNERS
WHERE OwnerName LIKE '%ee%';

-- 7. Display Pno, Type, Address, Rent and status of all properties with rent greater than 15000/- and less than 22000/-
SELECT Pno, Type, Address, Rent, Status
FROM PROPERTIES
WHERE Rent > 15000 AND Rent < 22000;

-- 8. Display different property types registered with the real estate agency
SELECT DISTINCT Type
FROM PROPERTIES;
