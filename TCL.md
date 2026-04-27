
Lab Cycle 4

Date: 08/04/2025
Experiment No: 6

Aim:

Familiarisation of TCL Commands.

TCL:

TCL Commands are used to manage transactions in a database. They are used to control the changes made by the DML commands. The most common TCL commands are COMMIT, ROLLBACK, SAVEPOINT.

COMMIT : Used to permanently save the changes made during a transaction to the database.

ROLLBACK : Used to undo the changes made during a transaction.

SAVEPOINT : Used to create a savepoint within a transaction. This can be used to roll back to a specific point in the transaction if necessary.



---

1. Create a Table ‘Order_Details’ with the given data and perform the following operations.

CREATE TABLE Order_Details
(Order_ID INT,
Product_Name VARCHAR(100),
Order_Num INT,
Order_Date DATE);

INSERT INTO Order_Details
(Order_ID, Product_Name, Order_Num, Order_Date)
VALUES
(1, 'Laptop', 5544, '2020-02-01'),
(2, 'Mouse', 3322, '2020-02-11'),
(3, 'Desktop', 2135, '2020-01-05'),
(4, 'Mobile', 3432, '2020-02-22'),
(5, 'Anti-Virus', 5648, '2020-03-10');

SELECT * FROM Order_Details;


---

a) Start a new transaction and insert 2 rows into the table Order_Details.

START TRANSACTION;

INSERT INTO Order_Details
(Order_ID, Product_Name, Order_Num, Order_Date)
VALUES
(6, 'FireWall', 1006, '2023-07-22'),
(7, 'Keyboard', 1007, '2023-07-22');


---

b) Display the details of Order_Details.

SELECT * FROM Order_Details;


---

c) Rollback the current transaction and check the contents of the table Order_Details.

ROLLBACK;

SELECT * FROM Order_Details;


---

d) Start a new transaction and delete 2 rows from the table Order_Details.

START TRANSACTION;

DELETE FROM Order_Details WHERE Order_ID IN (4,5);


---

e) Display the details of Order_Details.

SELECT * FROM Order_Details;


---

f) Commit the current transaction and check the details of the table Order_Details.

COMMIT;

SELECT * FROM Order_Details;


---

g) Disable autocommit and create a savepoint named ‘Check_Updates’.

SET autocommit = 0;

SAVEPOINT Check_Updates;


---

h) Update details of the order with Order_Num 5544.

UPDATE Order_Details
SET Product_Name='ASUS-Laptop'
WHERE Order_Num=5544;


---

i) Insert 2 more rows into the table.

INSERT INTO Order_Details
(Order_ID, Product_Name, Order_Num, Order_Date)
VALUES
(6, 'FireWall', 1006, '2023-07-22'),
(7, 'Laptop', 1007, '2023-07-22');


---

j) Create a savepoint named ‘Check_delete’.

SAVEPOINT Check_delete;


---

k) Delete order details of a product named ‘Laptop’.

DELETE FROM Order_Details
WHERE Product_Name='Laptop';


---

l) Display the current details of the table Order_Details.

SELECT * FROM Order_Details;


---

m) Rollback to savepoint ‘Check_delete’ and check the details of the table Order_Details.

ROLLBACK TO SAVEPOINT Check_delete;

SELECT * FROM Order_Details;


---

n) Rollback to savepoint ‘Check_Updates’ and check the details of the table Order_Details.

ROLLBACK TO SAVEPOINT Check_Updates;

SELECT * FROM Order_Details;


---

o) Commit the changes and enable autocommit.

COMMIT;

SET autocommit=1;

SELECT * FROM Order_Details;


---

Result:

All queries have been executed successfully and output verified.
