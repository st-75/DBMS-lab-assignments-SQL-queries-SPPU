-- Trigger
-- Consider CUSTOMER (ID, Name, Age, Address, Salary) create a row level trigger for the CUSTOMERS
-- table that would fire for INSERT or UPDATE or DELETE operations performed on the CUSTOMERS
-- table. This trigger will display the salary difference between the old values and new values.
;


create table Customer12(ID NUMBER PRIMARY KEY,Name varchar(10),Age NUMBER,Address varchar(10),Salary NUMBER);
insert into customer12 values(12,'saurabh',20,'pune',123000);
insert into customer12 values(10,'saurabh2',20,'pune',123000);

create or replace trigger custTrigger
before insert or update or delete for each ROW
DECLARE 
VDIFF NUMBER
BEGIN
IF INSERTING THEN
VDIFF:= :NEW.SALARY-0;
DBMS_OUTPUT.PUT_LINE('SALARY DIFFERENCE IS:',VDIFF);
ELSIF UPDATING THEN
VDIFF:= :NEW.SALARY-:OLD.SALARY;
DBMS_OUTPUT.PUT_LINE('SALARY DIFFERENCE IS:',VDIFF);
ELSE
VDIF:=0-:OLD.SALARY;
DBMS_OUTPUT.PUT_LINE('SALARY DIFFERENCE IS:',VDIFF);
END IF;
END;
/


