-- MongoDB CRUD operations,
-- Create collection Employee (Emp_id, Emp_Name, Emp_salary, Emp_Dept.)
-- Insert 10 Documents in the collection.
-- Find the employees whose salary is greater than 50000 Rs.
-- Increase the salary of Smith by 5000 Rs
-- Display the information of employees working in Marketing department.with less than 45000 salary .
-- Display first five highest paid employees
-- Delete Employee with Id ‘E1007’
-- Create an Index on Emp_Id field , compare the time require to search Emp_id ‘E10008’ before and after
-- creating an index. (Hint Add at least 10000 Documents)
;


db.createCollection("Employee");



db.Employee.insert({Emp_id:'E1001',Emp_Name:'John',Emp_salary:60000,Emp_Dept:'HR'})
db.Employee.insert({Emp_id:'E1002',Emp_Name:'Alice',Emp_salary:55000,Emp_Dept:'Marketing'})
db.Employee.insert({Emp_id:'E1003',Emp_Name:'Smith',Emp_salary:52000,Emp_Dept:'Sales'})
db.Employee.insert({Emp_id:'E1004',Emp_Name:'Emily',Emp_salary:48000,Emp_Dept:'Marketing'})
db.Employee.insert({Emp_id:'E1005',Emp_Name:'Mike',Emp_salary:60000,Emp_Dept:'IT'})
db.Employee.insert({Emp_id:'E1006',Emp_Name:'Linda',Emp_salary:49000,Emp_Dept:'HR'})
db.Employee.insert({Emp_id:'E1007',Emp_Name:'David',Emp_salary:45000,Emp_Dept:'Finance'})
db.Employee.insert({Emp_id:'E1008',Emp_Name:'Sarah',Emp_salary:70000,Emp_Dept:'Marketing'})
db.Employee.insert({Emp_id:'E1009',Emp_Name:'Chris',Emp_salary:51000,Emp_Dept:'Sales'})
db.Employee.insert({Emp_id:'E1010',Emp_Name:'Lisa',Emp_salary:53000,Emp_Dept:'HR'})

db.Employee.find({Emp_salary:{$gt:50000}})


-- Increase the salary of Smith by 5,000 Rs:
db.Employee.updateOne({Emp_id:'E1003'},{$inc:{Emp_salary:5000}})



db.Employee.find({Emp_Dept : "Marketing",Emp_salary : {$lt :45000}});



db.Employee.find({Emp_salary:{$lt:50000}})


db.Employee.find().sort({Emp_salary:-1}).limit(5)

db.Employee.deleteOne({Emp_id:'E1007'})

db.Employee.createIndex({Emp_id:1})