I'll format this SQL lab exercise with proper Question → Answer format, including brief explanations for each step.

---

Lab Cycle 4 — Experiment No. 6

Familiarisation of TCL Commands

---

Q1. Create Table `Order_Details` and insert given data.

Answer:

```sql
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
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	
4	Mobile	3432	2020-02-22	
5	Anti-Virus	5648	2020-03-10	

Explanation: Creates the table with 4 columns and inserts 5 rows of sample data.

---

Q2a. Start a new transaction and insert 2 rows into `Order_Details`.

Answer:

```sql
START TRANSACTION;

INSERT INTO Order_Details
(Order_ID, Product_Name, Order_Num, Order_Date)
VALUES
(6, 'FireWall', 1006, '2023-07-22'),
(7, 'Keyboard', 1007, '2023-07-22');
```

Explanation: `START TRANSACTION` begins a new transaction. The two new rows are added but not yet permanently saved until committed.

---

Q2b. Display the details of `Order_Details`.

Answer:

```sql
SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	
4	Mobile	3432	2020-02-22	
5	Anti-Virus	5648	2020-03-10	
6	FireWall	1006	2023-07-22	
7	Keyboard	1007	2023-07-22	

Explanation: The 2 newly inserted rows (6 and 7) are visible within the current transaction.

---

Q2c. Rollback the current transaction and check the contents.

Answer:

```sql
ROLLBACK;

SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	
4	Mobile	3432	2020-02-22	
5	Anti-Virus	5648	2020-03-10	

Explanation: `ROLLBACK` undoes all changes made since `START TRANSACTION`. Rows 6 and 7 are removed — the table reverts to its original state.

---

Q2d. Start a new transaction and delete 2 rows from `Order_Details`.

Answer:

```sql
START TRANSACTION;

DELETE FROM Order_Details WHERE Order_ID IN (4,5);
```

Explanation: Begins a new transaction and deletes rows with `Order_ID` 4 (Mobile) and 5 (Anti-Virus). These deletions are temporary until committed.

---

Q2e. Display the details of `Order_Details`.

Answer:

```sql
SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	

Explanation: Rows 4 and 5 are temporarily deleted — visible only within this transaction.

---

Q2f. Commit the current transaction and check the details.

Answer:

```sql
COMMIT;

SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	

Explanation: `COMMIT` permanently saves the deletions. Rows 4 and 5 are now permanently removed from the database.

---

Q2g. Disable autocommit and create a savepoint named `Check_Updates`.

Answer:

```sql
SET autocommit = 0;

SAVEPOINT Check_Updates;
```

Explanation: `SET autocommit = 0` turns off automatic commit — every change now requires manual `COMMIT`. `SAVEPOINT Check_Updates` marks a restore point in the transaction.

---

Q2h. Update details of the order with `Order_Num` 5544.

Answer:

```sql
UPDATE Order_Details
SET Product_Name='ASUS-Laptop'
WHERE Order_Num=5544;
```

Explanation: Changes the product name from 'Laptop' to 'ASUS-Laptop' for `Order_Num` 5544. This change is pending (not yet committed).

---

Q2i. Insert 2 more rows into the table.

Answer:

```sql
INSERT INTO Order_Details
(Order_ID, Product_Name, Order_Num, Order_Date)
VALUES
(6, 'FireWall', 1006, '2023-07-22'),
(7, 'Laptop', 1007, '2023-07-22');
```

Explanation: Adds two new rows. Note that row 7 has `Product_Name='Laptop'`.

---

Q2j. Create a savepoint named `Check_delete`.

Answer:

```sql
SAVEPOINT Check_delete;
```

Explanation: Creates a second savepoint after the UPDATE and INSERT operations. We can roll back to this point later if needed.

---

Q2k. Delete order details of a product named 'Laptop'.

Answer:

```sql
DELETE FROM Order_Details
WHERE Product_Name='Laptop';
```

Explanation: Deletes all rows where `Product_Name = 'Laptop'`. This affects:
- Row 1 (Order_ID=1, ASUS-Laptop — updated from Laptop)
- Row 7 (Order_ID=7, Laptop — newly inserted)

---

Q2l. Display the current details of the table.

Answer:

```sql
SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	
6	FireWall	1006	2023-07-22	

Explanation: Both 'Laptop' rows (original updated one and newly inserted one) are deleted. Only Mouse, Desktop, and FireWall remain.

---

Q2m. Rollback to savepoint `Check_delete` and check the details.

Answer:

```sql
ROLLBACK TO SAVEPOINT Check_delete;

SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	ASUS-Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	
6	FireWall	1006	2023-07-22	
7	Laptop	1007	2023-07-22	

Explanation: Rolling back to `Check_delete` undoes the DELETE operation but keeps the UPDATE and INSERT operations that happened before this savepoint. Both Laptop rows are restored.

---

Q2n. Rollback to savepoint `Check_Updates` and check the details.

Answer:

```sql
ROLLBACK TO SAVEPOINT Check_Updates;

SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	

Explanation: Rolling back to `Check_Updates` undoes everything after that savepoint — the UPDATE (ASUS-Laptop → back to Laptop), both INSERTs (rows 6 and 7 removed). Table returns to state after the committed DELETE (rows 4,5 removed) but before any uncommitted changes.

---

Q2o. Commit the changes and enable autocommit.

Answer:

```sql
COMMIT;

SET autocommit=1;

SELECT * FROM Order_Details;
```

Output:

Order_ID	Product_Name	Order_Num	Order_Date	
1	Laptop	5544	2020-02-01	
2	Mouse	3322	2020-02-11	
3	Desktop	2135	2020-01-05	

Explanation: `COMMIT` permanently saves the current state. `SET autocommit=1` re-enables automatic commit mode. The final table has only 3 rows (original rows 1,2,3), as rows 4,5 were committed as deleted earlier, and all later changes were rolled back.

---

Result:

> All queries have been executed successfully and output verified.

---

Summary of TCL Commands:

Command	Purpose	
`START TRANSACTION`	Begins a new transaction	
`COMMIT`	Permanently saves all changes in the transaction	
`ROLLBACK`	Undoes all changes in the current transaction	
`SAVEPOINT name`	Creates a named restore point within a transaction	
`ROLLBACK TO SAVEPOINT name`	Undoes changes made after the specified savepoint	
`SET autocommit = 0/1`	Disables/enables automatic commit after each statement
