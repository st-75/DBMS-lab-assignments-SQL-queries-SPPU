-- 14 Procedure
-- Write a Stored Procedure namely Proc_Grade for the categorization of student. If marks scored by
-- students in examination is <=1500 and marks>=990 then student will be placed in distinction category if
-- marks scored are between 989 and 900 category is first class, if marks 899 and 825 category is Higher
-- Second Class.
-- Write a PL/SQL block for using procedure created with above requirement.
-- Stud_Marks(Roll, Name, Total_marks)
-- Result(Roll, Name, Class)
;

CREATE TABLE STUD_MARKS(ROLL NUMBER(5),NAME VARCHAR(15),TOTAL_MARKS NUMBER(4));
INSERT INTO Stud_Marks VALUES(1, 'John', 1000);
INSERT INTO Stud_Marks VALUES(2, 'Mary', 1100);
INSERT INTO Stud_Marks VALUES(3, 'David', 950);


CREATE TABLE RESULT(ROLL NUMBER(5),NAME VARCHAR(15),CLASS VARCHAR2(15));



CREATE OR REPLACE PROCEDURE PROC_GRADE(ROLL IN NUMBER,NAME IN VARCHAR,TOTAL_MARKS IN NUMBER,CLASS OUT VARCHAR2)
AS 
BEGIN
IF TOTAL_MARKS>=990 AND TOTAL_MARKS<=1500 THEN
CLASS:='DISTINCTION';
ELSIF TOTAL_MARKS>=900 AND TOTAL_MARKS<=989 THEN
CLASS:='FIRST CLASS';
ELSIF TOTAL_MARKS>=825 AND TOTAL_MARKS<=899 THEN
CLASS:='HIGHER';
ELSE
CLASS:='NO CLASS';
END IF;
END;


DECLARE
VROLL NUMBER;
VNAME VARCHAR(15);
VTOTAL NUMBER;
VCLASS VARCHAR2(15);
BEGIN
FOR REC IN(SELECT ROLL,NAME,TOTAL_MARKS FROM STUD_MARKS)LOOP
VROLL:=REC.ROLL;
VNAME:=REC.NAME;
VTOTAL:=REC.TOTAL_MARKS;

PROC_GRADE(VROLL,VNAME,VTOTAL,VCLASS);

INSERT INTO RESULT VALUES(VROLL,VNAME,VCLASS);
END LOOP;
COMMIT;
END;
/
