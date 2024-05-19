-- Cursor
-- Write a PL/SQL block of code using Cursor that will merge the data available in the newly created table
-- N_RollCall with the data available in the table O_RollCall. If the data in the first table already exist in the
-- second table then that data should be skipped.
;




-- Create the O_RollCall table
create table o_rollcall(roll number(10) primary key,name varchar(20),age number(20));


insert into o_rollcall values(101,'harsh',20);
insert into o_rollcall values(102,'pradnya',20);
insert into o_rollcall values(103,'anuj',20);
insert into o_rollcall values(104,'soham',20);
insert into o_rollcall values(105,'ajinkya',20);
insert into o_rollcall values(106,'yamete',20);

-- Create the N_RollCall table
create table n_rollcall(roll number(10) primary key,name varchar(20),age number(20));


insert into n_rollcall values(101,'harsh',20);
insert into n_rollcall values(107,'harsh2',20);
insert into n_rollcall values(104,'soham',20);
insert into n_rollcall values(108,'pradnya2',20);
insert into n_rollcall values(109,'anu',20);







declare
cursor n_cursor is
select * from n_rollcall;
n_row n_rollcall%rowtype;
v_check_exist boolean;
begin
for n_row in n_cursor loop
v_check_exist := false;
for o_row in(select * from o_rollcall where roll = n_row.roll) loop
v_check_exist := true;
end loop;
if not v_check_exist then
insert into o_rollcall values n_row;
end if;
end loop;
commit;
end;
/

;

DECLARE 
CURSOR N_CURSOR IS
SELECT * FROM N_ROLLCALL;
N_ROW N_ROLLCALL%ROWTYPE;
V_CHECK_EXIST BOOLEAN;
BEGIN
FOR N_ROW IN N_CURSOR LOOP
V_CHECK_EXIST:=FALSE;
FOR O_ROW IN(SELECT * FROM O_ROLLCALL WHERE ROLL=N_ROW.ROLL)LOOP
V_CHECK_EXIST:=TRUE;
END LOOP;
IF NOT V_CHECK_EXIST THEN
INSERT INTO O_ROLLCALL VALUES N_ROW;
END IF;
END LOOP;
COMMIT;
END;
/

