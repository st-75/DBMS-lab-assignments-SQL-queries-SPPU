-- Account(Acc_no, branch_name,balance)
-- branch(branch_name,branch_city,assets)
-- customer(cust_name,cust_street,cust_city)
-- Depositor(cust_name,acc_no)
-- Loan(loan_no,branch_name,amount)
-- Borrower(cust_name,loan_no)
-- Solve following query:
-- a) Find the branches where average account balance > 12000.
-- b) Find number of tuples in customer relation.
-- c) Calculate total loan amount given by bank.
-- d) Delete all loans with loan amount between 1300 and 1500.
;

-- Branch Table
CREATE TABLE branch (
    branch_name VARCHAR(15) PRIMARY KEY,
    branch_city VARCHAR(15) NOT NULL,
    assets DECIMAL(10, 2) NOT NULL
);

-- Account Table
CREATE TABLE account (
    acc_no INT PRIMARY KEY,
    branch_name VARCHAR(15) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

-- Customer Table
CREATE TABLE customer (
    cust_name VARCHAR(15) PRIMARY KEY,
    cust_street VARCHAR(15) NOT NULL,
    cust_city VARCHAR(15) NOT NULL
);

-- Depositor Table
CREATE TABLE depositor (
    cust_name VARCHAR(15) NOT NULL,
    acc_no INT NOT NULL,
    PRIMARY KEY (cust_name, acc_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (acc_no) REFERENCES account(acc_no)
);

-- Loan Table
CREATE TABLE loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(15) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

-- Borrower Table
CREATE TABLE borrower (
    cust_name VARCHAR(15) NOT NULL,
    loan_no INT NOT NULL,
    PRIMARY KEY (cust_name, loan_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (loan_no) REFERENCES loan(loan_no)
);


-- a) Find the branches where average account balance > 12000.
SELECT a.branch_name
FROM account a
GROUP BY a.branch_name
HAVING AVG(a.balance) > 12000;

-- b) Find number of tuples in customer relation.
SELECT COUNT(*) AS num_tuples
FROM customer;

-- c) Calculate total loan amount given by bank.
SELECT SUM(amount) AS total_loan_amount
FROM loan;

-- d) Delete all loans with loan amount between 1300 and 1500.
DELETE FROM loan
WHERE amount BETWEEN 1300 AND 1500;
