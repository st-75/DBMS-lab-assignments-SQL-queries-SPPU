-- Account(Acc_no, branch_name,balance)
-- branch(branch_name,branch_city,assets)
-- customer(cust_name,cust_street,cust_city)
-- Depositor(cust_name,acc_no)
-- Loan(loan_no,branch_name,amount)
-- Borrower(cust_name,loan_no)
-- Create Table, View, Index, Sequence, Synonym ,different constraints for above schema
;



-- Create Branch Table
CREATE TABLE branch (
    branch_name VARCHAR(255) PRIMARY KEY,
    branch_city VARCHAR(255) NOT NULL,
    assets DECIMAL(10, 2) NOT NULL
);

-- Create Account Table
CREATE TABLE account (
    acc_no INT PRIMARY KEY,
    branch_name VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

-- Create Customer Table
CREATE TABLE customer (
    cust_name VARCHAR(255) PRIMARY KEY,
    cust_street VARCHAR(255) NOT NULL,
    cust_city VARCHAR(255) NOT NULL
);

-- Create Depositor Table
CREATE TABLE depositor (
    cust_name VARCHAR(255) NOT NULL,
    acc_no INT NOT NULL,
    PRIMARY KEY (cust_name, acc_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (acc_no) REFERENCES account(acc_no)
);

-- Create Loan Table
CREATE TABLE loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

-- Create Borrower Table
CREATE TABLE borrower (
    cust_name VARCHAR(255) NOT NULL,
    loan_no INT NOT NULL,
    PRIMARY KEY (cust_name, loan_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (loan_no) REFERENCES loan(loan_no)
);


-- Create a view that lists all customers who have loans
CREATE VIEW customers_with_loans AS
SELECT c.cust_name, l.loan_no, l.amount
FROM customer c
JOIN borrower b ON c.cust_name = b.cust_name
JOIN loan l ON b.loan_no = l.loan_no;


-- Create an index on the 'balance' column of the 'account' table
CREATE INDEX idx_balance ON account (balance);


-- Create a sequence for generating unique loan numbers
CREATE SEQUENCE loan_seq START WITH 1 INCREMENT BY 1;


-- Create a synonym for the 'customer' table
CREATE SYNONYM cust FOR customer;


-- Add a CHECK constraint to the 'loan' table
ALTER TABLE loan
ADD CONSTRAINT check_positive_amount CHECK (amount > 0);
