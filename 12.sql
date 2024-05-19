
-- PL/SQL procedure
-- 1. Borrower(Roll_no, Name, DateofIssue, NameofBook, Status)
-- 2. Fine(Roll_no,Date,Amt)
-- Accept Roll_no and NameofBook from user.
--  Write a PL/SQL procedure. The procedure calculates the fine and performs the book returning
-- operation
-- Assume suitable conditions for calculating fine.
-- ● Check the number of days (from date of issue).
-- ● If days are between 15 to 30 then fine amount will be Rs 5per day.
-- ● If no. of days>30, per day fine will be Rs 50 per day and for days less than 30, Rs. 5 per day.
-- ● If condition of fine is true, then details will be stored into fine table.
-- ● Also handles the exception by named exception handler or user define exception handler.
;

DECLARE
    vRollNo NUMBER;
    vBookName varchar(10);
    vDOI Date;
    vDays NUMBER;
    vFineAmount NUMBER;
BEGIN
   	vRollNo := &rollno;
    vBookName := '&bookname';
    SELECT IssueDate INTO vDOI FROM Borrower where RollNo=vRollNo;
    vDays := TRUNC(SYSDATE - vDOI);
    IF vDays BETWEEN 15 AND 30 THEN
    	vFineAmount := vDays * 5;
    ELSIF vDays > 30 THEN
    	vFineAmount := (vDays - 30) * 50 + 150;
    ELSE
    	vFineAmount := 0;
    END IF;
    insert into Fine values (vRollNo,SYSDATE,vFineAmount);
    delete from Borrower where RollNo=vRollNo;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('Data Not Found');
	WHEN OTHERS THEN
		dbms_output.put_line('SQL Internal Error');
END;
/