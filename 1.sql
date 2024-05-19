-- Account(Acc_no, branch_name,balance)
-- branch(branch_name,branch_city,assets)
-- customer(cust_name,cust_street,cust_city)
-- Depositor(cust_name,acc_no)
-- Loan(loan_no,branch_name,amount)
-- Borrower(cust_name,loan_no)
-- Solve following query:
-- Create above tables with appropriate constraints like primary key, foreign key, check constrains, not
-- null etc.
-- a) Find the names of all branches in loan relation.
-- b) Find all loan numbers for loans made at 'Shivaji Nagar' Branch with loan amount > 12000.
-- c) Find all customers who have a loan from bank. Find their names,loan_no and loan amount.
-- d) List all customers in alphabetical order who have loan from Akurdi branch.
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



--insert
insert into branch values('Shivaji Nagar','Pune','Loan');
insert into branch values('Akurdi','Pune','Loan');
insert into branch values('Kothrud','Pune','Loan');
insert into branch values('Swargate','Pune','Loan');
insert into branch values('Sadashivpet','Pune','Loan');

insert into account values(101,'Kothrud',20000);
insert into account values(102,'Shivaji Nagar',30000);
insert into account values(103,'Shivaji Nagar',35000);
insert into account values(104,'Kothrud',45000);
insert into account values(105,'Swargate',40000);
insert into account values(106,'Swargate',40000);
insert into account values(107,'Sadashivpet',49000);
insert into account values(108,'Sadashivpet',55000);
insert into account values(109,'Kothrud',55000);
insert into account values(110,'Kothrud',75000);


insert into customer values('Sampada','Parijat','Pune');
insert into customer values('Mohan','Parijat','Pune');
insert into customer values('Gaurav','Sb road','Pune');
insert into customer values('Ganesh','JM road','Pune');
insert into customer values('Nikita','JM road','Pune');
insert into customer values('keshav','Fc road','Pune');


insert into depositor values('Mohan',102);
insert into depositor values('Nikita',110);
insert into depositor values('keshav',108);
insert into depositor values('Gaurav',105);
insert into depositor values('Sampada',103);


insert into loan values(1,'Shivaji nagar',300000);
insert into loan values(1,'Shivaji Nagar',300000);
insert into loan values(2,'Shivaji Nagar',45000);
insert into loan values(3,'Kothrud',55000);
insert into loan values(4,'Kothrud',49000);
insert into loan values(5,'Kothrud',40000);



insert into borrower values('Sampada',1);
insert into borrower values('Mohan',4);
insert into borrower values('Mahesh',5);
insert into borrower values('Gaurav',5);
insert into borrower values('keshav',3);
insert into borrower values('Nikita',2);

-- a) Find the names of all branches in loan relation.
SELECT DISTINCT branch_name FROM loan;

-- b) Find all loan numbers for loans made at 'Shivaji Nagar' Branch with loan amount > 12000.
SELECT loan_no
FROM loan
WHERE branch_name = 'Shivaji Nagar' AND amount > 12000;

-- c) Find all customers who have a loan from bank. Find their names,loan_no and loan amount.
SELECT c.cust_name, l.loan_no, l.amount
FROM customer c
JOIN borrower b ON c.cust_name = b.cust_name
JOIN loan l ON b.loan_no = l.loan_no;

-- d) List all customers in alphabetical order who have loan from Akurdi branch.
SELECT c.cust_name
FROM customer c
JOIN borrower b ON c.cust_name = b.cust_name
JOIN loan l ON b.loan_no = l.loan_no
JOIN branch br ON l.branch_name = br.branch_name
WHERE br.branch_city = 'Akurdi'
ORDER BY c.cust_name;
