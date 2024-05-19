-- Consider table Student (Roll, Name, Attendance ,Status)
-- Write a PL/SQL block for following requirements and handle the exceptions. Roll no. of students will be
-- entered by the user. Attendance of roll no. entered by user will be checked in the Stud table. If attendance
-- is less than 75% then display the message “Term not granted” and set the status in stud table as
-- “Detained”. Otherwise display message “Term granted” and set the status in stud table as “Not Detained”
;

CREATE TABLE STUDENT(ROLL NUMBER(5),NAME VARCHAR(15),ATTENDANCE NUMBER(3),STATUS VARCHAR(20));

INSERT INTO STUDENT VALUES(31069,'SAURABH',100,NULL);
INSERT INTO STUDENT VALUES(31067,'SOHAM',95,NULL);
INSERT INTO STUDENT VALUES(31050,'VIVEK',70,NULL);
INSERT INTO STUDENT VALUES(31068,'AKASH',70,NULL);





DECLARE
VROLL NUMBER;
VATT NUMBER;
VSTAT VARCHAR(15);
BEGIN
VROLL:=&ROLL;

SELECT ATTENDANCE,STATUS INTO VATT,VSTAT FROM STUDENT WHERE ROLL=VROLL;

IF VATT<75 THEN
VSTAT:='DETAINED';
DBMS_OUTPUT.PUT_LINE('TERM NOT GRANTED');
ELSE
VSTAT:='NOT DETAINED';
DBMS_OUTPUT.PUT_LINE('TERM GRANTED');
END IF;
UPDATE STUDENT SET STAT=VSTAT WHERE ROLL=VROLL;
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('THE ROLL NUMBER NOT FOUND');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('AN ERROR ENCOUNTERED');
END;
/
