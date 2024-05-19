-- Account(Acc_no, branch_name,balance)
-- branch(branch_name,branch_city,assets)
-- customer(cust_name,cust_street,cust_city)
-- Depositor(cust_name,acc_no)
-- Loan(loan_no,branch_name,amount)
-- Borrower(cust_name,loan_no)
-- Solve following query:
-- a) Find all customers who have an account or loan or both at bank.
-- b) Find all customers who have both account and loan at bank.
-- c) Find all customers who have account but no loan at the bank.
-- d) Find average account balance at Akurdi branch.
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

-- a) Find all customers who have an account or loan or both at bank.
SELECT DISTINCT c.cust_name
FROM customer c
LEFT JOIN depositor d ON c.cust_name = d.cust_name
LEFT JOIN borrower b ON c.cust_name = b.cust_name
WHERE d.cust_name IS NOT NULL OR b.cust_name IS NOT NULL;

-- b) Find all customers who have both account and loan at bank.
SELECT DISTINCT c.cust_name
FROM customer c
JOIN depositor d ON c.cust_name = d.cust_name
JOIN borrower b ON c.cust_name = b.cust_name;

-- c) Find all customers who have account but no loan at the bank.
SELECT DISTINCT c.cust_name
FROM customer c
LEFT JOIN depositor d ON c.cust_name = d.cust_name
WHERE d.cust_name IS NOT NULL
AND c.cust_name NOT IN (SELECT b.cust_name FROM borrower b);

-- d) Find average account balance at Akurdi branch.
SELECT AVG(a.balance)
FROM account a
JOIN branch b ON a.branch_name = b.branch_name
WHERE b.branch_city = 'Akurdi';
