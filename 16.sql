-- Trigger
-- Write a after trigger for Insert, update and delete event considering following requirement:
-- Emp(Emp_no, Emp_name, Emp_salary)
-- a) Trigger should be initiated when salary tried to be inserted is less than Rs.50,000/-
-- b) Trigger should be initiated when salary tried to be updated for value less than Rs. 50,000/-
-- c) Also the new values expected to be inserted will be stored in new table
-- Tracking(Emp_no,Emp_salary).
;

create table Emp(EmpNo NUMBER PRIMARY KEY,EmpName varchar(10),EmpSalary NUMBER);

create table Tracking(EmpNo NUMBER,EmpSalary NUMBER,Action varchar(10));

CREATE OR REPLACE TRIGGER EmpTrigger
BEFORE INSERT OR UPDATE OR DELETE ON Emp
FOR EACH ROW
BEGIN
	IF INSERTING THEN
		IF :NEW.EmpSalary < 50000 THEN
			INSERT INTO Tracking (EmpNo, EmpSalary, Action) values (:NEW.EmpNo,:NEW.EmpSalary,'Insert');
		END IF;
	ELSIF UPDATING THEN
		IF :NEW.EmpSalary < 50000 THEN
			INSERT INTO Tracking (EmpNo, EmpSalary, Action) values (:NEW.EmpNo,:NEW.EmpSalary,'Update');
		END IF;
	ELSE
		INSERT INTO Tracking (EmpNo, EmpSalary, Action) values (:OLD.EmpNo,:OLD.EmpSalary,'Delete');
	END IF;
END;
/

insert into Emp values (1,'Pruthvi',60000);
insert into Emp values (2,'uthvi',6000);
--update
--delete
