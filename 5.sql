-- Account(Acc_no, branch_name,balance)
-- branch(branch_name,branch_city,assets)
-- customer(cust_name,cust_street,cust_city)
-- Depositor(cust_name,acc_no)
-- Loan(loan_no,branch_name,amount)
-- Borrower(cust_name,loan_no)
-- all types of Join, Sub-Query and View
;

-- Inner Join
SELECT a.acc_no, c.cust_name
FROM account a
INNER JOIN depositor d ON a.acc_no = d.acc_no
INNER JOIN customer c ON d.cust_name = c.cust_name;


-- LEFT JOIN
SELECT c.cust_name, a.acc_no
FROM customer c
LEFT JOIN depositor d ON c.cust_name = d.cust_name
LEFT JOIN account a ON d.acc_no = a.acc_no;

-- RIGHT JOIN
SELECT a.acc_no, c.cust_name
FROM account a
RIGHT JOIN depositor d ON a.acc_no = d.acc_no
RIGHT JOIN customer c ON d.cust_name = c.cust_name;

-- FULL OUTER JOIN
SELECT c.cust_name, a.acc_no
FROM customer c
FULL JOIN depositor d ON c.cust_name = d.cust_name
FULL JOIN account a ON d.acc_no = a.acc_no;

-- SELF JOIN
SELECT c1.cust_name, c2.cust_name AS related_cust_name
FROM customer c1
JOIN customer c2 ON c1.cust_city = c2.cust_city
WHERE c1.cust_name <> c2.cust_name;

-- SUB QUERY
SELECT cust_name, loan_no, amount
FROM loan
WHERE amount > (SELECT AVG(amount) FROM loan);

-- VIEW
CREATE VIEW customer_account_balances AS
SELECT c.cust_name, a.balance
FROM customer c
LEFT JOIN depositor d ON c.cust_name = d.cust_name
LEFT JOIN account a ON d.acc_no = a.acc_no;

