
---

ADBMS LAB - LAB CYCLE 1

---

EXPERIMENT NO: 1

Familiarization of DDL Commands

Aim: To study and implement Data Definition Language (DDL) commands including CREATE, ALTER, DROP, RENAME, and TRUNCATE.

---

PART A: College Database

---

1. Create a database

Explanation: The CREATE DATABASE statement is used to create a new database in SQL. This establishes a container for all related tables and objects.

```sql
CREATE DATABASE CollegeDB;
```

Output:

```
Query OK, 1 row affected
```

---

2. Select the current database

Explanation: The USE statement selects the specified database as the active database for subsequent operations.

```sql
USE CollegeDB;
```

Output:

```
Database changed
```

---

3. Create the following tables:

a) Create Student table

Explanation: The CREATE TABLE statement defines a new table with specified columns and data types. roll_no is integer, name is variable character, dob stores date values, address uses text for longer strings, phone_no and blood_grp are variable characters.

```sql
CREATE TABLE Student (
    roll_no INTEGER,
    name VARCHAR(50),
    dob DATE,
    address TEXT,
    phone_no VARCHAR(15),
    blood_grp VARCHAR(5)
);
```

Output:

```
Query OK, 0 rows affected
```

b) Create Course table

Explanation: This creates the Course table with Course_id as integer, Course_name as variable character, and course_duration as integer representing duration in months or years.

```sql
CREATE TABLE Course (
    Course_id INTEGER,
    Course_name VARCHAR(50),
    course_duration INTEGER
);
```

Output:

```
Query OK, 0 rows affected
```

---

4. List all tables in the current database

Explanation: The SHOW TABLES command displays all tables present in the currently selected database.

```sql
SHOW TABLES;
```

Output:

```
+---------------------+
| Tables_in_CollegeDB |
+---------------------+
| Course              |
| Student             |
+---------------------+
2 rows in set
```

---

5. Display the structure of the Student table

Explanation: The DESCRIBE or DESC command shows the column names, data types, nullability, keys, defaults, and extra information for the specified table.

```sql
DESCRIBE Student;
-- OR
DESC Student;
```

Output:

```
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| roll_no   | int         | YES  |     | NULL    |       |
| name      | varchar(50) | YES  |     | NULL    |       |
| dob       | date        | YES  |     | NULL    |       |
| address   | text        | YES  |     | NULL    |       |
| phone_no  | varchar(15) | YES  |     | NULL    |       |
| blood_grp | varchar(5)  | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set
```

---

6. Drop the column blood_grp from Student table

Explanation: The ALTER TABLE with DROP COLUMN removes the specified column from the table structure permanently.

```sql
ALTER TABLE Student DROP COLUMN blood_grp;
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

7. Add a new column Adar_no with domain number to the table Student

Explanation: The ALTER TABLE with ADD COLUMN inserts a new column into the existing table. NUMBER can be implemented as INTEGER or BIGINT depending on the SQL dialect.

```sql
ALTER TABLE Student ADD COLUMN Adar_no INTEGER;
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

8. Change the datatype of phone_no from varchar to int

Explanation: The ALTER TABLE with MODIFY COLUMN changes the data type of an existing column. Note that existing data must be convertible to the new type.

```sql
ALTER TABLE Student MODIFY COLUMN phone_no INTEGER;
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

9. Drop the tables

Explanation: The DROP TABLE statement permanently removes the table and all its data from the database.

```sql
DROP TABLE Student;
DROP TABLE Course;
```

Output:

```
Query OK, 0 rows affected

Query OK, 0 rows affected
```

---

10. Delete the database

Explanation: The DROP DATABASE statement permanently removes the entire database including all tables, views, and other objects.

```sql
DROP DATABASE CollegeDB;
```

Output:

```
Query OK, 0 rows affected
```

---

PART B: Organization Database

---

1. Create a database

Explanation: Creates a new database named OrganizationDB to store employee and department information.

```sql
CREATE DATABASE OrganizationDB;
```

Output:

```
Query OK, 1 row affected
```

---

2. Select the current database

Explanation: Sets OrganizationDB as the active database for subsequent SQL operations.

```sql
USE OrganizationDB;
```

Output:

```
Database changed
```

---

3. Create the following tables:

a) Create Employee table

Explanation: Creates Employee table with employee number, name, date of birth, address, mobile number, department number, and salary fields.

```sql
CREATE TABLE Employee (
    emp_no VARCHAR(10),
    emp_name VARCHAR(50),
    dob DATE,
    address TEXT,
    mobile_no INTEGER,
    dept_no VARCHAR(10),
    salary INTEGER
);
```

Output:

```
Query OK, 0 rows affected
```

b) Create Department table

Explanation: Creates Department table with department number, department name, and location fields.

```sql
CREATE TABLE Department (
    dept_no VARCHAR(10),
    dept_name VARCHAR(50),
    location VARCHAR(50)
);
```

Output:

```
Query OK, 0 rows affected
```

---

4. List all tables in the current database

Explanation: Displays all tables present in OrganizationDB.

```sql
SHOW TABLES;
```

Output:

```
+------------------------+
| Tables_in_OrganizationDB|
+------------------------+
| Department             |
| Employee               |
+------------------------+
2 rows in set
```

---

5. Display the structure of the Employee table and Department table

Explanation: Shows the detailed structure of both tables including column names, data types, and constraints.

```sql
DESCRIBE Employee;
```

Output:

```
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| emp_no    | varchar(10) | YES  |     | NULL    |       |
| emp_name  | varchar(50) | YES  |     | NULL    |       |
| dob       | date        | YES  |     | NULL    |       |
| address   | text        | YES  |     | NULL    |       |
| mobile_no | int         | YES  |     | NULL    |       |
| dept_no   | varchar(10) | YES  |     | NULL    |       |
| salary    | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
7 rows in set
```

```sql
DESCRIBE Department;
```

Output:

```
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_no   | varchar(10) | YES  |     | NULL    |       |
| dept_name | varchar(50) | YES  |     | NULL    |       |
| location  | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set
```

---

6. Add a new column 'Designation' to the table Employee

Explanation: Adds a new column named Designation to store employee job titles or positions.

```sql
ALTER TABLE Employee ADD COLUMN Designation VARCHAR(30);
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

7. Drop the column 'location' from Department table

Explanation: Removes the location column from the Department table permanently.

```sql
ALTER TABLE Department DROP COLUMN location;
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

EXPERIMENT NO: 2

DDL and DML Operations

Aim: To implement Data Definition Language and Data Manipulation Language commands for creating tables, inserting data, and performing various operations.

---

1. Create table student consisting of attributes student_id, name, mark, city, hod

Explanation: Creates a student table with student identification, name, marks, city, and head of department fields.

```sql
CREATE TABLE student (
    student_id INTEGER,
    name VARCHAR(50),
    mark INTEGER,
    city VARCHAR(30),
    hod VARCHAR(50)
);
```

Output:

```
Query OK, 0 rows affected
```

---

2. Insert values of student table (Minimum 5 entries)

Explanation: The INSERT INTO statement adds records to the table. Five sample student records are inserted with various details.

```sql
INSERT INTO student VALUES (1, 'Rahul Kumar', 45, 'Delhi', 'Dr. Sharma');
INSERT INTO student VALUES (2, 'Priya Singh', 28, 'Mumbai', 'Dr. Verma');
INSERT INTO student VALUES (3, 'Amit Patel', 55, 'Ahmedabad', 'Dr. Sharma');
INSERT INTO student VALUES (4, 'Sneha Gupta', 35, 'Delhi', 'Dr. Reddy');
INSERT INTO student VALUES (5, 'Vikram Rao', 22, 'Bangalore', 'Dr. Verma');
```

Output:

```
Query OK, 1 row affected
Query OK, 1 row affected
Query OK, 1 row affected
Query OK, 1 row affected
Query OK, 1 row affected
```

---

3. Create table department with attributes dep_id, dname, hod and staff_no

Explanation: Creates a department table with department ID, department name, head of department, and staff number fields.

```sql
CREATE TABLE department (
    dep_id INTEGER,
    dname VARCHAR(50),
    hod VARCHAR(50),
    staff_no INTEGER
);
```

Output:

```
Query OK, 0 rows affected
```

---

4. Insert values into department table

Explanation: Inserts sample department records showing different departments with their HODs and staff counts.

```sql
INSERT INTO department VALUES (101, 'Computer Science', 'Dr. Sharma', 15);
INSERT INTO department VALUES (102, 'Mechanical', 'Dr. Verma', 12);
INSERT INTO department VALUES (103, 'Electronics', 'Dr. Reddy', 10);
INSERT INTO department VALUES (104, 'Civil', 'Dr. Kumar', 8);
```

Output:

```
Query OK, 1 row affected
Query OK, 1 row affected
Query OK, 1 row affected
Query OK, 1 row affected
```

---

5. Set student_id of student table as primary key

Explanation: Adds a primary key constraint to student_id, ensuring unique identification and preventing duplicate values.

```sql
ALTER TABLE student ADD PRIMARY KEY (student_id);
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

6. List all attributes and values of student

Explanation: The SELECT * statement retrieves all columns and all rows from the student table.

```sql
SELECT * FROM student;
```

Output:

```
+------------+--------------+------+-----------+------------+
| student_id | name         | mark | city      | hod        |
+------------+--------------+------+-----------+------------+
|          1 | Rahul Kumar  |   45 | Delhi     | Dr. Sharma |
|          2 | Priya Singh  |   28 | Mumbai    | Dr. Verma  |
|          3 | Amit Patel   |   55 | Ahmedabad | Dr. Sharma |
|          4 | Sneha Gupta  |   35 | Delhi     | Dr. Reddy  |
|          5 | Vikram Rao   |   22 | Bangalore | Dr. Verma  |
+------------+--------------+------+-----------+------------+
5 rows in set
```

---

7. List attributes student_id and name of student

Explanation: Retrieves only the specified columns (student_id and name) for all students.

```sql
SELECT student_id, name FROM student;
```

Output:

```
+------------+--------------+
| student_id | name         |
+------------+--------------+
|          1 | Rahul Kumar  |
|          2 | Priya Singh  |
|          3 | Amit Patel   |
|          4 | Sneha Gupta  |
|          5 | Vikram Rao   |
+------------+--------------+
5 rows in set
```

---

8. List name of student who have secured more than 30 mark

Explanation: Uses WHERE clause with condition mark > 30 to filter students who scored above 30.

```sql
SELECT name FROM student WHERE mark > 30;
```

Output:

```
+-------------+
| name        |
+-------------+
| Rahul Kumar |
| Amit Patel  |
| Sneha Gupta |
+-------------+
3 rows in set
```

---

9. Add new attribute block_no to department table

Explanation: Adds a new column block_no to store the block number where each department is located.

```sql
ALTER TABLE department ADD COLUMN block_no INTEGER;
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

10. Delete an attribute mark from students table

Explanation: Removes the mark column from the student table using ALTER TABLE DROP COLUMN.

```sql
ALTER TABLE student DROP COLUMN mark;
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

11. Change datatype of block number to varchar

Explanation: Modifies the data type of block_no from INTEGER to VARCHAR to allow alphanumeric block identifiers.

```sql
ALTER TABLE department MODIFY COLUMN block_no VARCHAR(10);
```

Output:

```
Query OK, 0 rows affected
Records: 0  Duplicates: 0  Warnings: 0
```

---

12. Update value block_no of department table

Explanation: The UPDATE statement modifies existing records. Sets block numbers for all departments.

```sql
UPDATE department SET block_no = 'A' WHERE dep_id = 101;
UPDATE department SET block_no = 'B' WHERE dep_id = 102;
UPDATE department SET block_no = 'C' WHERE dep_id = 103;
UPDATE department SET block_no = 'D' WHERE dep_id = 104;
```

Output:

```
Query OK, 1 row affected
Rows matched: 1  Changed: 1  Warnings: 0

Query OK, 1 row affected
Rows matched: 1  Changed: 1  Warnings: 0

Query OK, 1 row affected
Rows matched: 1  Changed: 1  Warnings: 0

Query OK, 1 row affected
Rows matched: 1  Changed: 1  Warnings: 0
```

Verification:

```sql
SELECT * FROM department;
```

Output:

```
+--------+------------------+------------+----------+----------+
| dep_id | dname            | hod        | staff_no | block_no |
+--------+------------------+------------+----------+----------+
|    101 | Computer Science | Dr. Sharma |       15 | A        |
|    102 | Mechanical       | Dr. Verma  |       12 | B        |
|    103 | Electronics      | Dr. Reddy  |       10 | C        |
|    104 | Civil            | Dr. Kumar  |        8 | D        |
+--------+------------------+------------+----------+----------+
4 rows in set
```

---

13. Delete 'mech' department from department table

Explanation: The DELETE statement removes records from the table. Deletes the Mechanical department (assuming 'mech' refers to Mechanical).

```sql
DELETE FROM department WHERE dname = 'Mechanical';
```

Output:

```
Query OK, 1 row affected
```

Verification:

```sql
SELECT * FROM department;
```

Output:

```
+--------+------------------+------------+----------+----------+
| dep_id | dname            | hod        | staff_no | block_no |
+--------+------------------+------------+----------+----------+
|    101 | Computer Science | Dr. Sharma |       15 | A        |
|    103 | Electronics      | Dr. Reddy  |       10 | C        |
|    104 | Civil            | Dr. Kumar  |        8 | D        |
+--------+------------------+------------+----------+----------+
3 rows in set
```

---

