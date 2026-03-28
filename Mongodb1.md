
---

CYCLE 5: MongoDB Commands - Complete Lab Record

---

Exercise 1: Basic MongoDB Operations with CollegeDB

---

1. Create Database CollegeDB

To create and switch to a new database named "CollegeDB", use the `use` command. MongoDB creates the database implicitly when you first store data in it.

```javascript
use CollegeDB
```

Output:

```
switched to db CollegeDB
```

---

2. Create Collection named "students"

To create a new collection within the current database, use `db.createCollection()`. Collections in MongoDB are analogous to tables in relational databases but are schema-less.

```javascript
db.createCollection("students")
```

Output:

```
{ "ok" : 1 }
```

---

3. Insert 10 Records

To insert multiple documents at once, use `insertMany()`. Each document represents a student with name, age, and course fields. This operation is atomic and returns acknowledged status with inserted IDs.

```javascript
db.students.insertMany([
  {name:"Arun", age:22, course:"MCA"},
  {name:"Meena", age:23, course:"MSc"},
  {name:"Rahul", age:24, course:"MCA"},
  {name:"Sneha", age:22, course:"MBA"},
  {name:"Vijay", age:23, course:"MCA"},
  {name:"Anu", age:21, course:"MSc"},
  {name:"Riya", age:22, course:"MBA"},
  {name:"Kiran", age:24, course:"MCA"},
  {name:"Deepa", age:23, course:"MSc"},
  {name:"Manu", age:22, course:"MBA"}
])
```

Output:

```
{
  "acknowledged" : true,
  "insertedIds" : [
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("..."),
    ObjectId("...")
  ]
}
```

---

4. Display First 5 Records

To limit the number of documents returned, use the `limit()` method. This is useful for pagination and reducing network overhead when only a subset of data is needed.

```javascript
db.students.find().limit(5)
```

Output:

```
{ "_id" : ObjectId("..."), "name" : "Arun", "age" : 22, "course" : "MCA" }
{ "_id" : ObjectId("..."), "name" : "Meena", "age" : 23, "course" : "MSc" }
{ "_id" : ObjectId("..."), "name" : "Rahul", "age" : 24, "course" : "MCA" }
{ "_id" : ObjectId("..."), "name" : "Sneha", "age" : 22, "course" : "MBA" }
{ "_id" : ObjectId("..."), "name" : "Vijay", "age" : 23, "course" : "MCA" }
```

---

5. Skip First 3 Records

To skip a specified number of documents from the beginning of the result set, use `skip()`. When combined with `limit()`, it enables pagination functionality.

```javascript
db.students.find().skip(3)
```

Output:

```
{ "_id" : ObjectId("..."), "name" : "Sneha", "age" : 22, "course" : "MBA" }
{ "_id" : ObjectId("..."), "name" : "Vijay", "age" : 23, "course" : "MCA" }
{ "_id" : ObjectId("..."), "name" : "Anu", "age" : 21, "course" : "MSc" }
{ "_id" : ObjectId("..."), "name" : "Riya", "age" : 22, "course" : "MBA" }
{ "_id" : ObjectId("..."), "name" : "Kiran", "age" : 24, "course" : "MCA" }
{ "_id" : ObjectId("..."), "name" : "Deepa", "age" : 23, "course" : "MSc" }
{ "_id" : ObjectId("..."), "name" : "Manu", "age" : 22, "course" : "MBA" }
```

---

6. Sort by Age (Ascending)

To sort documents by a specific field, use `sort()` with `1` for ascending order and `-1` for descending order. This performs an in-memory sort and can use indexes for optimization.

```javascript
db.students.find().sort({age:1})
```

Output:

```
{ "_id" : ObjectId("..."), "name" : "Anu", "age" : 21, "course" : "MSc" }
{ "_id" : ObjectId("..."), "name" : "Arun", "age" : 22, "course" : "MCA" }
{ "_id" : ObjectId("..."), "name" : "Sneha", "age" : 22, "course" : "MBA" }
{ "_id" : ObjectId("..."), "name" : "Riya", "age" : 22, "course" : "MBA" }
{ "_id" : ObjectId("..."), "name" : "Manu", "age" : 22, "course" : "MBA" }
{ "_id" : ObjectId("..."), "name" : "Meena", "age" : 23, "course" : "MSc" }
{ "_id" : ObjectId("..."), "name" : "Vijay", "age" : 23, "course" : "MCA" }
{ "_id" : ObjectId("..."), "name" : "Deepa", "age" : 23, "course" : "MSc" }
{ "_id" : ObjectId("..."), "name" : "Rahul", "age" : 24, "course" : "MCA" }
{ "_id" : ObjectId("..."), "name" : "Kiran", "age" : 24, "course" : "MCA" }
```

---

7. Update a Record

To modify a single document, use `updateOne()` with `$set` operator to update specific fields without replacing the entire document. This operation targets the first matching document only.

```javascript
db.students.updateOne(
  {name:"Arun"},
  {$set:{age:25}}
)
```

Output:

```
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
```

---

8. Delete a Record

To remove a single document from the collection, use `deleteOne()`. This deletes the first document that matches the specified criteria and returns the deletion count.

```javascript
db.students.deleteOne({name:"Meena"})
```

Output:

```
{ "acknowledged" : true, "deletedCount" : 1 }
```

---

9. Drop Collection

To permanently remove a collection and all its documents from the database, use `drop()`. This operation cannot be undone and frees up storage space.

```javascript
db.students.drop()
```

Output:

```
true
```

---

Exercise 2: Student Marks Management System

---

a) Create a database named "Myclass"

Switch to a new database context for the student marks management system. MongoDB lazily creates the database when data is first inserted.

```javascript
use Myclass
```

Output:

```
switched to db Myclass
```

---

b) Create a collection named "db_students" with fields: student_name, student_rollno, mark[subject, mark]

Create a collection to store student information with nested array for subject marks. The schema supports flexible document structure with embedded arrays.

```javascript
db.createCollection("db_students")
```

Output:

```
{ "ok" : 1 }
```

---

c) Insert details of 10 students in a class

Insert comprehensive student records with unique ObjectIds, names, roll numbers, and nested mark arrays containing subject-wise scores for 6 subjects.

```javascript
db.db_students.insertMany([
  {"_id":ObjectId("62552df480b49718c39a5de4"),"student_name":"adarsh","student_rollno":1,"mark":[{"dbms":70},{"mpmc":70},{"cn":70},{"ss":70},{"dm":69},{"moss":71}]},
  {"_id":ObjectId("62552df480b49718c39a5de5"),"student_name":"amal","student_rollno":11,"mark":[{"dbms":50},{"mpmc":60},{"cn":60},{"ss":100},{"dm":69},{"moss":70}]},
  {"_id":ObjectId("62552df480b49718c39a5de6"),"student_name":"joel","student_rollno":34,"mark":[{"dbms":80},{"mpmc":80},{"cn":80},{"ss":90},{"dm":69},{"moss":100}]},
  {"_id":ObjectId("62552df480b49718c39a5de7"),"student_name":"athul","student_rollno":20,"mark":[{"dbms":84},{"mpmc":50},{"cn":60},{"ss":96},{"dm":69},{"moss":65}]},
  {"_id":ObjectId("62552df480b49718c39a5de8"),"student_name":"dude","student_rollno":7,"mark":[{"dbms":74},{"mpmc":60},{"cn":70},{"ss":86},{"dm":69},{"moss":55}]},
  {"_id":ObjectId("62552df480b49718c39a5de9"),"student_name":"pranav","student_rollno":60,"mark":[{"dbms":78},{"mpmc":67},{"cn":50},{"ss":76},{"dm":69},{"moss":67}]},
  {"_id":ObjectId("62552df480b49718c39a5dea"),"student_name":"noel","student_rollno":15,"mark":[{"dbms":88},{"mpmc":87},{"cn":80},{"ss":86},{"dm":69},{"moss":87}]},
  {"_id":ObjectId("62552df480b49718c39a5deb"),"student_name":"nivin","student_rollno":40,"mark":[{"dbms":58},{"mpmc":57},{"cn":55},{"ss":56},{"dm":69},{"moss":57}]},
  {"_id":ObjectId("62552df480b49718c39a5dec"),"student_name":"thomas","student_rollno":23,"mark":[{"dbms":98},{"mpmc":97},{"cn":95},{"ss":96},{"dm":69},{"moss":97}]},
  {"_id":ObjectId("62552df480b49718c39a5ded"),"student_name":"athulp","student_rollno":21,"mark":[{"dbms":88},{"mpmc":87},{"cn":85},{"ss":86},{"dm":69},{"moss":87}]}
])
```

Output:

```
{
  "acknowledged" : true,
  "insertedIds" : [
    ObjectId("62552df480b49718c39a5de4"),
    ObjectId("62552df480b49718c39a5de5"),
    ObjectId("62552df480b49718c39a5de6"),
    ObjectId("62552df480b49718c39a5de7"),
    ObjectId("62552df480b49718c39a5de8"),
    ObjectId("62552df480b49718c39a5de9"),
    ObjectId("62552df480b49718c39a5dea"),
    ObjectId("62552df480b49718c39a5deb"),
    ObjectId("62552df480b49718c39a5dec"),
    ObjectId("62552df480b49718c39a5ded")
  ]
}
```

---

d) List the entire students in the class

Retrieve all documents from the collection using `find()` without parameters. This returns a cursor that can be iterated to display all student records.

```javascript
db.db_students.find()
```

Output:

```
{ "_id" : ObjectId("62552df480b49718c39a5de4"), "student_name" : "adarsh", "student_rollno" : 1, "mark" : [ {"dbms" : 70}, {"mpmc" : 70}, {"cn" : 70}, {"ss" : 70}, {"dm" : 69}, {"moss" : 71} ] }
{ "_id" : ObjectId("62552df480b49718c39a5de5"), "student_name" : "amal", "student_rollno" : 11, "mark" : [ {"dbms" : 50}, {"mpmc" : 60}, {"cn" : 60}, {"ss" : 100}, {"dm" : 69}, {"moss" : 70} ] }
{ "_id" : ObjectId("62552df480b49718c39a5de6"), "student_name" : "joel", "student_rollno" : 34, "mark" : [ {"dbms" : 80}, {"mpmc" : 80}, {"cn" : 80}, {"ss" : 90}, {"dm" : 69}, {"moss" : 100} ] }
{ "_id" : ObjectId("62552df480b49718c39a5de7"), "student_name" : "athul", "student_rollno" : 20, "mark" : [ {"dbms" : 84}, {"mpmc" : 50}, {"cn" : 60}, {"ss" : 96}, {"dm" : 69}, {"moss" : 65} ] }
{ "_id" : ObjectId("62552df480b49718c39a5de8"), "student_name" : "dude", "student_rollno" : 7, "mark" : [ {"dbms" : 74}, {"mpmc" : 60}, {"cn" : 70}, {"ss" : 86}, {"dm" : 69}, {"moss" : 55} ] }
{ "_id" : ObjectId("62552df480b49718c39a5de9"), "student_name" : "pranav", "student_rollno" : 60, "mark" : [ {"dbms" : 78}, {"mpmc" : 67}, {"cn" : 50}, {"ss" : 76}, {"dm" : 69}, {"moss" : 67} ] }
{ "_id" : ObjectId("62552df480b49718c39a5dea"), "student_name" : "noel", "student_rollno" : 15, "mark" : [ {"dbms" : 88}, {"mpmc" : 87}, {"cn" : 80}, {"ss" : 86}, {"dm" : 69}, {"moss" : 87} ] }
{ "_id" : ObjectId("62552df480b49718c39a5deb"), "student_name" : "nivin", "student_rollno" : 40, "mark" : [ {"dbms" : 58}, {"mpmc" : 57}, {"cn" : 55}, {"ss" : 56}, {"dm" : 69}, {"moss" : 57} ] }
{ "_id" : ObjectId("62552df480b49718c39a5dec"), "student_name" : "thomas", "student_rollno" : 23, "mark" : [ {"dbms" : 98}, {"mpmc" : 97}, {"cn" : 95}, {"ss" : 96}, {"dm" : 69}, {"moss" : 97} ] }
{ "_id" : ObjectId("62552df480b49718c39a5ded"), "student_name" : "athulp", "student_rollno" : 21, "mark" : [ {"dbms" : 88}, {"mpmc" : 87}, {"cn" : 85}, {"ss" : 86}, {"dm" : 69}, {"moss" : 87} ] }
```

---

e) Update mark of any one student in the collection "db_students"

Modify the marks array for a specific student using `$set` operator. This replaces the entire mark array with a new value for student "amal".

```javascript
db.db_students.updateOne(
  {student_name:"amal"},
  {$set:{mark:[{"en":50}]}}
)
```

Output:

```
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
```

---

f) Delete the data of first student in the collection

Remove the first document matching the criteria using `deleteOne()`. This operation targets the student named "amal" and permanently deletes the record.

```javascript
db.db_students.deleteOne({student_name:"amal"})
```

Output:

```
{ "acknowledged" : true, "deletedCount" : 1 }
```

---

Exercise 3: Inventory Management System (Products Collection)

---

1. Create a MongoDB Database named "Inventory"

Switch to the Inventory database context for managing product information. The database will be created when the first collection is added.

```javascript
use Inventory
```

Output:

```
switched to db Inventory
```

---

2. Create a collection named 'Products' and Insert the following documents

Create a Products collection with 5 electronic device documents containing nested specifications, arrays for colors and storage options, and various data types including ISODate.

```javascript
db.products.insertMany([
  {"_id":1,"name":"xPhone","price":799,"releaseDate":ISODate("2011-05-14"),"spec":{"ram":4,"screen":6.5,"cpu":2.66},"color":["white","black"],"storage":[64,128,256]},
  {"_id":2,"name":"xTablet","price":899,"releaseDate":ISODate("2011-09-01"),"spec":{"ram":16,"screen":9.5,"cpu":3.66},"color":["white","black","purple"],"storage":[128,256,512]},
  {"_id":3,"name":"SmartTablet","price":899,"releaseDate":ISODate("2015-01-14"),"spec":{"ram":12,"screen":9.7,"cpu":3.66},"color":["blue"],"storage":[16,64,128]},
  {"_id":4,"name":"SmartPad","price":699,"releaseDate":ISODate("2020-05-14"),"spec":{"ram":8,"screen":9.7,"cpu":1.66},"color":["white","orange","gold","gray"],"storage":[128,256,1024]},
  {"_id":5,"name":"SmartPhone","price":599,"releaseDate":ISODate("2022-09-14"),"spec":{"ram":4,"screen":9.7,"cpu":1.66},"color":["white","orange","gold","gray"],"storage":[128,256]}
])
```

Output:

```
{
  "acknowledged" : true,
  "insertedIds" : [ 1, 2, 3, 4, 5 ]
}
```

---

3. Display all documents in the collection

Retrieve all product documents to verify successful insertion. The output displays complete document structure with all nested fields and arrays.

```javascript
db.products.find()
```

Output:

```
{ "_id" : 1, "name" : "xPhone", "price" : 799, "releaseDate" : ISODate("2011-05-14T00:00:00Z"), "spec" : { "ram" : 4, "screen" : 6.5, "cpu" : 2.66 }, "color" : [ "white", "black" ], "storage" : [ 64, 128, 256 ] }
{ "_id" : 2, "name" : "xTablet", "price" : 899, "releaseDate" : ISODate("2011-09-01T00:00:00Z"), "spec" : { "ram" : 16, "screen" : 9.5, "cpu" : 3.66 }, "color" : [ "white", "black", "purple" ], "storage" : [ 128, 256, 512 ] }
{ "_id" : 3, "name" : "SmartTablet", "price" : 899, "releaseDate" : ISODate("2015-01-14T00:00:00Z"), "spec" : { "ram" : 12, "screen" : 9.7, "cpu" : 3.66 }, "color" : [ "blue" ], "storage" : [ 16, 64, 128 ] }
{ "_id" : 4, "name" : "SmartPad", "price" : 699, "releaseDate" : ISODate("2020-05-14T00:00:00Z"), "spec" : { "ram" : 8, "screen" : 9.7, "cpu" : 1.66 }, "color" : [ "white", "orange", "gold", "gray" ], "storage" : [ 128, 256, 1024 ] }
{ "_id" : 5, "name" : "SmartPhone", "price" : 599, "releaseDate" : ISODate("2022-09-14T00:00:00Z"), "spec" : { "ram" : 4, "screen" : 9.7, "cpu" : 1.66 }, "color" : [ "white", "orange", "gold", "gray" ], "storage" : [ 128, 256 ] }
```

---

4. Display all the details of product with id is 2

Query for a specific document by its `_id` field. This uses equality matching on the primary key equivalent in MongoDB.

```javascript
db.products.find({_id:2})
```

Output:

```
{ "_id" : 2, "name" : "xTablet", "price" : 899, "releaseDate" : ISODate("2011-09-01T00:00:00Z"), "spec" : { "ram" : 16, "screen" : 9.5, "cpu" : 3.66 }, "color" : [ "white", "black", "purple" ], "storage" : [ 128, 256, 512 ] }
```

---

5. Display the first document in the collection

Use `findOne()` to retrieve only the first document from the collection. This is more efficient than `find().limit(1)` when only one document is needed.

```javascript
db.products.findOne()
```

Output:

```
{
  "_id" : 1,
  "name" : "xPhone",
  "price" : 799,
  "releaseDate" : ISODate("2011-05-14T00:00:00Z"),
  "spec" : {
    "ram" : 4,
    "screen" : 6.5,
    "cpu" : 2.66
  },
  "color" : [
    "white",
    "black"
  ],
  "storage" : [
    64,
    128,
    256
  ]
}
```

---

6. Display name and price of product with id is 5

Use projection to return only specific fields. The second parameter specifies inclusion (1) or exclusion (0) of fields. `_id` is included by default unless explicitly excluded.

```javascript
db.products.find({_id:5},{name:1,price:1})
```

Output:

```
{ "_id" : 5, "name" : "SmartPhone", "price" : 599 }
```

---

7. Query the products collection to select all documents where the value of the price field equals 899

Use the `$eq` operator for equality comparison. This finds all products priced at exactly 899, returning only name and price fields.

```javascript
db.products.find({price:{$eq:899}},{name:1,price:1})
```

Output:

```
{ "_id" : 2, "name" : "xTablet", "price" : 899 }
{ "_id" : 3, "name" : "SmartTablet", "price" : 899 }
```

---

8. Search for documents where the value of the ram field in the spec document equals 4

Query nested documents using dot notation (`spec.ram`). The `$eq` operator matches documents where the embedded ram field equals 4.

```javascript
db.products.find({"spec.ram":{$eq:4}},{name:1,"spec.ram":1})
```

Output:

```
{ "_id" : 1, "name" : "xPhone", "spec" : { "ram" : 4 } }
{ "_id" : 5, "name" : "SmartPhone", "spec" : { "ram" : 4 } }
```

---

9. Query the products collection to find all documents where the array color contains an element with the value "black"

Query arrays using `$eq` to match documents where the color array contains "black". MongoDB automatically searches through array elements.

```javascript
db.products.find({color:{$eq:"black"}},{name:1,color:1})
```

Output:

```
{ "_id" : 1, "name" : "xPhone", "color" : [ "white", "black" ] }
{ "_id" : 2, "name" : "xTablet", "color" : [ "white", "black", "purple" ] }
```

---

10. Select documents in the products collection with the published date is 2020-05-14

Query ISODate fields using `$eq` with `new ISODate()` constructor. This matches exact date values in the releaseDate field.

```javascript
db.products.find({releaseDate:{$eq:new ISODate("2020-05-14")}},{name:1,releaseDate:1})
```

Output:

```
{ "_id" : 4, "name" : "SmartPad", "releaseDate" : ISODate("2020-05-14T00:00:00Z") }
```

---

11. Select documents from the products collection where price is less than 799

Use the `$lt` (less than) comparison operator to find products priced below 799. This enables range-based queries on numeric fields.

```javascript
db.products.find({price:{$lt:799}},{name:1,price:1})
```

Output:

```
{ "_id" : 4, "name" : "SmartPad", "price" : 699 }
{ "_id" : 5, "name" : "SmartPhone", "price" : 599 }
```

---

12. Select documents where the value of the screen field in the spec document is less than 7

Apply comparison operators to nested fields using dot notation. This finds products with screen size smaller than 7 inches.

```javascript
db.products.find({"spec.screen":{$lt:7}},{name:1,"spec.screen":1})
```

Output:

```
{ "_id" : 1, "name" : "xPhone", "spec" : { "screen" : 6.5 } }
```

---

13. Query the products collection to find all documents where the array storage has at least one element less than 128

Use `$lt` operator on arrays to match documents where at least one array element satisfies the condition. This queries for products with any storage option below 128GB.

```javascript
db.products.find({storage:{$lt:128}},{name:1,storage:1})
```

Output:

```
{ "_id" : 1, "name" : "xPhone", "storage" : [ 64, 128, 256 ] }
{ "_id" : 3, "name" : "SmartTablet", "storage" : [ 16, 64, 128 ] }
```

---

14. Display documents from the products collection whose the price is either 599 or 699

Use the `$in` operator to match field values against an array of possible values. This is equivalent to multiple `$eq` conditions combined with `$or`.

```javascript
db.products.find({price:{$in:[699,799]}},{name:1,price:1})
```

Output:

```
{ "_id" : 1, "name" : "xPhone", "price" : 799 }
{ "_id" : 4, "name" : "SmartPad", "price" : 699 }
```

---

15. Display documents where the color array has at least one element either "black" or "white"

Apply `$in` operator to array fields to find documents where any array element matches values in the specified array.

```javascript
db.products.find({color:{$in:["black","white"]}},{name:1,color:1})
```

Output:

```
{ "_id" : 1, "name" : "xPhone", "color" : [ "white", "black" ] }
{ "_id" : 2, "name" : "xTablet", "color" : [ "white", "black", "purple" ] }
{ "_id" : 4, "name" : "SmartPad", "color" : [ "white", "orange", "gold", "gray" ] }
{ "_id" : 5, "name" : "SmartPhone", "color" : [ "white", "orange", "gold", "gray" ] }
```

---

16. Display documents from the products collection whose price is neither 599 or 699

Use `$nin` (not in) operator to exclude documents with specific field values. This returns products priced outside the specifie
