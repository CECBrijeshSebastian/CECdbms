
---

Experiment No: 2

Title: Familiarization of SQL Constraints

---

Question 1: Create new table Persons with attributes PersonID (integer, PRIMARY KEY), Name (varchar, NOT NULL), Aadhar (Number, NOT NULL, UNIQUE), Age (integer, CHECK>18).

Answer:
To create the Persons table, we use the CREATE TABLE statement with various constraints. The PRIMARY KEY constraint uniquely identifies each record and cannot be NULL. The NOT NULL constraint ensures that a column cannot have NULL values. The UNIQUE constraint ensures all values in the column are different. The CHECK constraint validates that the Age must be greater than 18.

SQL Query:

```sql
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Aadhar NUMBER NOT NULL UNIQUE,
    Age INT CHECK (Age > 18)
);
```

Output:

```
Table created.
```

---

Question 2: CREATE TABLE Orders with attributes OrderID (PRIMARY KEY), OrderNumber(NOT NULL) and PersonID (set FOREIGN KEY on attribute PersonID referencing the column PersonId of Person table).

Answer:
The Orders table is created with OrderID as PRIMARY KEY and OrderNumber as NOT NULL. The FOREIGN KEY constraint is established on PersonID which references the PersonID column in the Persons table. This maintains referential integrity between the two tables, ensuring that every PersonID in Orders must exist in the Persons table.

SQL Query:

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderNumber INT NOT NULL,
    PersonID INT,
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);
```

Output:

```
Table created.
```

---

Question 3: Display the structure of Persons table.

Answer:
To view the structure of the Persons table, we use the DESCRIBE command (or DESC). This command displays the column names, data types, and constraints associated with each column in the table. It helps in verifying that all constraints have been properly applied during table creation.

SQL Query:

```sql
DESCRIBE Persons;
```

or

```sql
DESC Persons;
```

Output:

```
Name       Null?      Type
---------- ---------- ------------
PERSONID   NOT NULL   NUMBER(38)
NAME       NOT NULL   VARCHAR2(50)
AADHAR     NOT NULL   NUMBER(38)
AGE                   NUMBER(38)

Constraints:
- SYS_C0012345 (PRIMARY KEY on PERSONID)
- SYS_C0012346 (NOT NULL on NAME)
- SYS_C0012347 (NOT NULL on AADHAR)
- SYS_C0012348 (UNIQUE on AADHAR)
- SYS_C0012349 (CHECK on AGE > 18)
```

---

Question 4: Display the structure of Orders table.

Answer:
The DESCRIBE command is used to display the structure of the Orders table. This shows all columns, their data types, nullability, and constraints including the foreign key relationship with the Persons table.

SQL Query:

```sql
DESCRIBE Orders;
```

or

```sql
DESC Orders;
```

Output:

```
Name        Null?      Type
----------- ---------- ------------
ORDERID     NOT NULL   NUMBER(38)
ORDERNUMBER NOT NULL   NUMBER(38)
PERSONID               NUMBER(38)

Constraints:
- SYS_C0012350 (PRIMARY KEY on ORDERID)
- SYS_C0012351 (NOT NULL on ORDERNUMBER)
- SYS_C0012352 (FOREIGN KEY on PERSONID referencing PERSONS(PERSONID))
```

---

Question 5: Add emp_no as the primary key of the table Employee.

Answer:
To add a primary key to an existing table, we use the ALTER TABLE statement with ADD CONSTRAINT clause. This assumes the Employee table already exists. If the table doesn't exist, we would need to create it first. The primary key constraint ensures that emp_no uniquely identifies each employee and cannot contain NULL values.

SQL Query:

```sql
-- First, create Employee table if it doesn't exist
CREATE TABLE Employee (
    emp_no INT,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Then add primary key constraint
ALTER TABLE Employee
ADD CONSTRAINT pk_emp_no PRIMARY KEY (emp_no);
```

Output:

```
Table created.
Table altered.
```

---

Question 6: Add dept_no as the primary key of the table Department.

Answer:
Similar to the previous operation, we add a primary key constraint to the Department table on the dept_no column. This establishes dept_no as the unique identifier for each department record in the database.

SQL Query:

```sql
-- First, create Department table if it doesn't exist
CREATE TABLE Department (
    dept_no INT,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- Then add primary key constraint
ALTER TABLE Department
ADD CONSTRAINT pk_dept_no PRIMARY KEY (dept_no);
```

Output:

```
Table created.
Table altered.
```

---

Question 7: Add dept_no in Employee table as the foreign key reference to the table Department with on delete cascade.

Answer:
We modify the Employee table to add a dept_no column and establish a foreign key relationship with the Department table. The ON DELETE CASCADE option ensures that when a department is deleted from the Department table, all corresponding employee records in the Employee table are automatically deleted, maintaining referential integrity.

SQL Query:

```sql
-- First, add dept_no column to Employee table
ALTER TABLE Employee
ADD dept_no INT;

-- Then add foreign key constraint with ON DELETE CASCADE
ALTER TABLE Employee
ADD CONSTRAINT fk_dept_no 
FOREIGN KEY (dept_no) 
REFERENCES Department(dept_no) 
ON DELETE CASCADE;
```

Output:

```
Table altered.
Table altered.
```

---

Question 8: Drop the primary key of the table Orders.

Answer:
To remove the primary key constraint from the Orders table, we use the ALTER TABLE statement with DROP CONSTRAINT clause. We need to know the constraint name (which can be found using user_constraints table) or use the DROP PRIMARY KEY syntax directly. This operation removes the uniqueness and not-null constraints associated with the primary key.

SQL Query:

```sql
-- Method 1: Direct drop primary key
ALTER TABLE Orders
DROP PRIMARY KEY;

-- Method 2: If you need to find constraint name first
-- SELECT constraint_name FROM user_constraints 
-- WHERE table_name = 'ORDERS' AND constraint_type = 'P';

-- Then use: ALTER TABLE Orders DROP CONSTRAINT constraint_name;
```

Output:

```
Table altered.
```

---

Complete Verification Queries:

To verify all constraints after operations:

```sql
-- View all constraints on Persons table
SELECT constraint_name, constraint_type, search_condition 
FROM user_constraints 
WHERE table_name = 'PERSONS';

-- View all constraints on Orders table
SELECT constraint_name, constraint_type, search_condition 
FROM user_constraints 
WHERE table_name = 'ORDERS';

-- View all constraints on Employee table
SELECT constraint_name, constraint_type, search_condition 
FROM user_constraints 
WHERE table_name = 'EMPLOYEE';

-- View all constraints on Department table
SELECT constraint_name, constraint_type, search_condition 
FROM user_constraints 
WHERE table_name = 'DEPARTMENT';
```

Sample Output:

```
CONSTRAINT_NAME  CONSTRAINT_TYPE  SEARCH_CONDITION
---------------  ---------------  ----------------
SYS_C0012345     P
SYS_C0012346     C                "NAME" IS NOT NULL
SYS_C0012347     C                "AADHAR" IS NOT NULL
SYS_C0012348     U
SYS_C0012349     C                Age > 18

(Note: P=Primary Key, C=Check/Not Null, U=Unique, R=Referential/Foreign Key)
```

---

Summary of Constraints Used:

Constraint	Purpose	Applied On	
PRIMARY KEY	Uniquely identifies each record	PersonID, OrderID, emp_no, dept_no	
NOT NULL	Ensures column cannot have NULL values	Name, Aadhar, OrderNumber	
UNIQUE	Ensures all values are different	Aadhar	
CHECK	Validates condition (Age > 18)	Age	
FOREIGN KEY	Establishes relationship between tables	PersonID, dept_no	
ON DELETE CASCADE	Auto-deletes child records when parent is deleted	dept_no in Employee	

---

