-- Mongo Aggregation
-- Create a student collection consisting of fields like Roll No, name, class, marks, sports etc
-- 1. Display the first 5 toppers of TE
-- 2. Display marks of topper of each division
-- 3. Display the average marks of each division
-- 4. Display the rollcall of TE Comp A
-- 5. Display list of fail students from TE Comp A
-- 6. Display Name, Class and Marks of all students
-- 7. Display list of students who play football
;

db.createCollection("student");



db.student.insert({ Roll_No: 1, name: "Alice", class: "TE Comp A", marks: 85, sports: "Football" })
db.student.insert({ Roll_No: 2, name: "Bob", class: "TE Comp A", marks: 75, sports: "Cricket" })
db.student.insert({ Roll_No: 3, name: "Charlie", class: "TE Comp B", marks: 92, sports: "Basketball" })
db.student.insert({ Roll_No: 4, name: "David", class: "TE Comp A", marks: 68, sports: "Football" })
db.student.insert({ Roll_No: 5, name: "Ella", class: "TE Comp B", marks: 88, sports: "Football" })
db.student.insert({ Roll_No: 6, name: "Frank", class: "TE Comp B", marks: 94, sports: "Cricket" })
db.student.insert({ Roll_No: 7, name: "Grace", class: "TE Comp A", marks: 90, sports: "Basketball" })
db.student.insert({ Roll_No: 8, name: "Hannah", class: "TE Comp A", marks: 55, sports: "Football" })
db.student.insert({ Roll_No: 9, name: "Ivy", class: "TE Comp B", marks: 78, sports: "Cricket" })
db.student.insert({ Roll_No: 10, name: "Jack", class: "TE Comp B", marks: 87, sports: "Football" })


-- Display the first 5 toppers of TE:
db.student.find({class:'TE Comp A'}).sort({marks:-1}).limit(5)

-- Display marks of the topper of each division:
db.student.aggregate([{$group:{_id:'$class',maxMarks:{$max:'$marks'}}}])


-- Display the average marks of each division:
db.student.aggregate([{$group:{_id:'$class',avgMarks:{$avg:'$marks'}}}])

-- Display the roll call of TE Comp A:
db.student.find({class:'TE comp A'})

-- Display a list of failed students from TE Comp A:
db.student.find({class:"TE Comp A",marks:{$lt:60}});

-- Display the Name, Class, and Marks of all students:
db.student.find({},{name:1,class:1,marks:1}).sort({class:+1})

-- Display a list of students who play football:
db.student.find({sports:"Football"}) 