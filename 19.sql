-- MapReduce
-- Create a customer collection consisting of fields like name, email ID, profession, gender, bill amount
-- 1. Write a MapReduce query for finding the count of male and female customers in the collection
-- 2. Write a MapReduce query for finding the count of each profession in the collection
-- 3. Display list of all customers with bill amounts greater than 5000/-
-- 4. Update the bill amount of any one customer
-- 5. Display all customers with name starting with 'B'
-- 6. Display list of all customers with profession = “Business”
-- 7. Display all customers in Descending order of Bill amount
-- 8. Create an index on name field of customer collection. Also use the explain() function


-- 1. Write a MapReduce query for finding the count of male and female customers in the collection
var map = function() {
    emit(this.gender, 1);
};

var reduce = function(key, values) {
    return Array.sum(values);
};

db.customer.mapReduce(map, reduce, {
    out: "gender_count"
});

// You can query the result:
db.gender_count.find();

-- 2. Write a MapReduce query for finding the count of each profession in the collection
var map = function() {
    emit(this.profession, 1);
};

var reduce = function(key, values) {
    return Array.sum(values);
};

db.customer.mapReduce(map, reduce, {
    out: "profession_count"
});

// You can query the result:
db.profession_count.find();

-- 3. Display list of all customers with bill amounts greater than 5000/-
db.customer.find({ "bill amount": { $gt: 5000 } });

-- 4. Update the bill amount of any one customer
db.customer.update(
    { name: "CustomerName" }, 
    { $set: { "bill amount": 6000 } }
);

-- 5. Display all customers with name starting with 'B'
db.customer.find({ name: /^B/ });

-- 6. Display list of all customers with profession = “Business”
db.customer.find({ profession: "Business" });

-- 7. Display all customers in Descending order of Bill amount
db.customer.find().sort({ "bill amount": -1 });

-- 8. Create an index on name field of customer collection. Also use the explain() function
db.customer.createIndex({ name: 1 });
db.customer.find({ name: "CustomerName" }).explain("executionStats");
