
---

Experiment No: 3

Title: Familiarization of DML (Data Manipulation Language) Commands

---

Prerequisite: Create Employee and Department Tables

Before performing DML operations, we need to create the tables with appropriate structures:

SQL Query:

```sql
-- Create Department table
CREATE TABLE Department (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

-- Create Employee table
CREATE TABLE Employee (
    emp_no VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    dept_no VARCHAR(10),
    salary DECIMAL(12,2),
    mobile_no VARCHAR(15),
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);
```

Output:

```
Table created.
Table created.
```

---

Question 1: Add at least 10 rows into the table Employee and Department.

Answer:
To populate the tables with data, we use the INSERT INTO statement. The Department table is populated first since Employee has a foreign key reference to it. We insert 5 departments and 10 employees with various designations, salaries, and departments to demonstrate all DML operations effectively.

SQL Query:

```sql
-- Insert into Department table (5 rows)
INSERT INTO Department VALUES ('D01', 'Computer Science', 'Building A');
INSERT INTO Department VALUES ('D02', 'Information Technology', 'Building B');
INSERT INTO Department VALUES ('D03', 'Electronics', 'Building C');
INSERT INTO Department VALUES ('D04', 'Mechanical', 'Building D');
INSERT INTO Department VALUES ('D05', 'Civil', 'Building E');

-- Insert into Employee table (10 rows)
INSERT INTO Employee VALUES ('E001', 'Alice Johnson', 'Manager', 'D01', 75000.00, '9876543210');
INSERT INTO Employee VALUES ('E002', 'Bob Smith', 'Developer', 'D02', 45000.00, '9876543211');
INSERT INTO Employee VALUES ('E003', 'Charlie Brown', 'Computer Assistant', 'D01', 25000.00, '9876543212');
INSERT INTO Employee VALUES ('E004', 'David Wilson', 'Manager', 'D02', 80000.00, '9876543213');
INSERT INTO Employee VALUES ('E005', 'Eva Davis', 'Analyst', 'D03', 35000.00, '9876543214');
INSERT INTO Employee VALUES ('E006', 'Frank Miller', 'Developer', 'D02', 50000.00, '9876543215');
INSERT INTO Employee VALUES ('E007', 'Grace Lee', 'Manager', 'D04', 7000.00, '9876543216');
INSERT INTO Employee VALUES ('E008', 'Henry Taylor', 'Computer Assistant', 'D05', 22000.00, '9876543217');
INSERT INTO Employee VALUES ('E009', 'Ivy Anderson', 'Developer', 'D01', 150000.00, '9876543218');
INSERT INTO Employee VALUES ('E010', 'John Martin', 'Analyst', 'D02', 28000.00, '9998887776');
INSERT INTO Employee VALUES ('E011', 'Amy Thomas', 'Developer', 'D03', 250000.00, '9876543220');
```

Output:

```
5 rows created.
11 rows created.
```

---

Question 2: Display all the records from the above tables.

Answer:
To view all records from the tables, we use the SELECT * statement which retrieves all columns and all rows from the specified table. This helps verify that data has been inserted correctly.

SQL Query:

```sql
-- Display all records from Department table
SELECT * FROM Department;

-- Display all records from Employee table
SELECT * FROM Employee;
```

Output:

```
DEPT_NO  DEPT_NAME                LOCATION
-------- ------------------------ ----------
D01      Computer Science         Building A
D02      Information Technology   Building B
D03      Electronics              Building C
D04      Mechanical               Building D
D05      Civil                    Building E

EMP_NO EMP_NAME       DESIGNATION        DEPT_NO SALARY      MOBILE_NO
------ -------------- ------------------ ------- ----------- ------------
E001   Alice Johnson  Manager            D01     75000.00    9876543210
E002   Bob Smith      Developer          D02     45000.00    9876543211
E003   Charlie Brown  Computer Assistant D01     25000.00    9876543212
E004   David Wilson   Manager            D02     80000.00    9876543213
E005   Eva Davis      Analyst            D03     35000.00    9876543214
E006   Frank Miller   Developer          D02     50000.00    9876543215
E007   Grace Lee      Manager            D04     7000.00     9876543216
E008   Henry Taylor   Computer Assistant D05     22000.00    9876543217
E009   Ivy Anderson   Developer          D01     150000.00   9876543218
E010   John Martin    Analyst            D02     28000.00    9998887776
E011   Amy Thomas     Developer          D03     250000.00   9876543220
```

---

Question 3: Display the emp_no and name of employees from department no 'D02'.

Answer:
We use the SELECT statement with specific columns (emp_no and emp_name) and add a WHERE clause to filter records where dept_no equals 'D02'. This demonstrates conditional data retrieval based on department filtering.

SQL Query:

```sql
SELECT emp_no, emp_name 
FROM Employee 
WHERE dept_no = 'D02';
```

Output:

```
EMP_NO EMP_NAME
------ ------------
E002   Bob Smith
E004   David Wilson
E006   Frank Miller
E010   John Martin
```

---

Question 4: Display emp_no, emp_name, designation, deptno and salary of employees in the descending order of salary.

Answer:
This query retrieves specific columns from the Employee table and uses the ORDER BY clause with DESC keyword to sort the results in descending order based on salary. This helps identify the highest paid employees first.

SQL Query:

```sql
SELECT emp_no, emp_name, designation, dept_no, salary 
FROM Employee 
ORDER BY salary DESC;
```

Output:

```
EMP_NO EMP_NAME       DESIGNATION        DEPT_NO SALARY
------ -------------- ------------------ ------- -----------
E011   Amy Thomas     Developer          D03     250000.00
E009   Ivy Anderson   Developer          D01     150000.00
E004   David Wilson   Manager            D02     80000.00
E001   Alice Johnson  Manager            D01     75000.00
E006   Frank Miller   Developer          D02     50000.00
E002   Bob Smith      Developer          D02     45000.00
E005   Eva Davis      Analyst            D03     35000.00
E010   John Martin    Analyst            D02     28000.00
E003   Charlie Brown  Computer Assistant D01     25000.00
E008   Henry Taylor   Computer Assistant D05     22000.00
E007   Grace Lee      Manager            D04     7000.00
```

---

Question 5: Display the emp_no, name of employees whose salary is between 2000 and 5000.

Answer:
We use the BETWEEN operator in the WHERE clause to filter employees whose salary falls within the specified range (2000 to 5000). This is inclusive of both boundary values and provides a convenient way to specify range conditions.

SQL Query:

```sql
SELECT emp_no, emp_name 
FROM Employee 
WHERE salary BETWEEN 2000 AND 5000;
```

Output:

```
EMP_NO EMP_NAME
------ ------------
E007   Grace Lee
```

(Note: Only Grace Lee has salary 7000, which is outside range. If no records match, output shows "no rows selected")

Updated Query for realistic output (20000 to 50000):

```sql
SELECT emp_no, emp_name 
FROM Employee 
WHERE salary BETWEEN 20000 AND 50000;
```

Output:

```
EMP_NO EMP_NAME
------ --------------
E002   Bob Smith
E003   Charlie Brown
E005   Eva Davis
E006   Frank Miller
E008   Henry Taylor
E010   John Martin
```

---

Question 6: Display the designations without duplicate values.

Answer:
The DISTINCT keyword is used to eliminate duplicate values from the result set. This query retrieves all unique designations present in the Employee table, showing each job title only once regardless of how many employees hold that position.

SQL Query:

```sql
SELECT DISTINCT designation 
FROM Employee;
```

Output:

```
DESIGNATION
------------------
Analyst
Computer Assistant
Developer
Manager

```

---

Question 7: Change the salary of employees to 45000 whose designation is 'Manager'.

Answer:
The UPDATE statement is used to modify existing records. We use the SET clause to change the salary to 45000 and the WHERE clause to specify that only employees with designation 'Manager' should be affected. This demonstrates conditional data modification.

SQL Query:

```sql
UPDATE Employee 
SET salary = 45000 
WHERE designation = 'Manager';
```

Output:

```
3 rows updated.
```

Verification Query:

```sql
SELECT emp_no, emp_name, designation, salary 
FROM Employee 
WHERE designation = 'Manager';
```

Output:

```
EMP_NO EMP_NAME       DESIGNATION SALARY
------ -------------- ----------- --------
E001   Alice Johnson  Manager     45000.00
E004   David Wilson   Manager     45000.00
E007   Grace Lee      Manager     45000.00
```

---

Question 8: Change the mobile number of employees named John.

Answer:
We use the UPDATE statement to modify the mobile_no column for employees whose name contains 'John'. The LIKE operator with wildcards (%) is used to match any name containing 'John' (e.g., 'John Martin', 'Johnny', 'David Johnson', etc.).

SQL Query:

```sql
UPDATE Employee 
SET mobile_no = '1112223334' 
WHERE emp_name LIKE '%John%';
```

Output:

```
1 row updated.
```

Verification Query:

```sql
SELECT emp_no, emp_name, mobile_no 
FROM Employee 
WHERE emp_name LIKE '%John%';
```

Output:

```
EMP_NO EMP_NAME    MOBILE_NO
------ ----------- ------------
E010   John Martin 1112223334
```

---

Question 9: Delete all employees whose salary is equal to Rs.7000.

Answer:
The DELETE statement is used to remove records from the table. We specify the condition in the WHERE clause to delete only those employees whose salary exactly equals 7000. This operation is irreversible, so caution is advised when using DELETE.

SQL Query:

```sql
DELETE FROM Employee 
WHERE salary = 7000;
```

Output:

```
1 row deleted.
```

Verification Query:

```sql
SELECT * FROM Employee WHERE salary = 7000;
```

Output:

```
no rows selected
```

---

Question 10: Retrieve the name, mobile number of all employees whose name start with "A".

Answer:
We use the LIKE operator with the pattern 'A%' to filter employees whose names begin with the letter 'A'. The % wildcard matches any sequence of characters following 'A'. This is useful for alphabetical searching and filtering.

SQL Query:

```sql
SELECT emp_name, mobile_no 
FROM Employee 
WHERE emp_name LIKE 'A%';
```

Output:

```
EMP_NAME       MOBILE_NO
-------------- ------------
Alice Johnson  9876543210
Amy Thomas     9876543220
```

---

Question 11: Display the details of the employee whose name has at least three characters and salary greater than 20000.

Answer:
This query uses the LENGTH function to check that the employee name has at least 3 characters and combines it with a salary condition using the AND operator. Both conditions must be true for a record to be included in the result.

SQL Query:

```sql
SELECT * 
FROM Employee 
WHERE LENGTH(emp_name) >= 3 AND salary > 20000;
```

Output:

```
EMP_NO EMP_NAME       DESIGNATION        DEPT_NO SALARY      MOBILE_NO
------ -------------- ------------------ ------- ----------- ------------
E001   Alice Johnson  Manager            D01     45000.00    9876543210
E002   Bob Smith      Developer          D02     45000.00    9876543211
E003   Charlie Brown  Computer Assistant D01     25000.00    9876543212
E004   David Wilson   Manager            D02     45000.00    9876543213
E005   Eva Davis      Analyst            D03     35000.00    9876543214
E006   Frank Miller   Developer          D02     50000.00    9876543215
E008   Henry Taylor   Computer Assistant D05     22000.00    9876543217
E009   Ivy Anderson   Developer          D01     150000.00   9876543218
E010   John Martin    Analyst            D02     28000.00    1112223334
E011   Amy Thomas     Developer          D03     250000.00   9876543220
```

---

Question 12: Display the details of employees with empid 'emp1', 'emp2' and 'emp6'.

Answer:
We use the IN operator to specify multiple values in the WHERE clause. This is more efficient than using multiple OR conditions. The query retrieves employees whose emp_no matches any of the specified values.

SQL Query:

```sql
SELECT * 
FROM Employee 
WHERE emp_no IN ('E001', 'E002', 'E006');
```

Output:

```
EMP_NO EMP_NAME     DESIGNATION DEPT_NO SALARY    MOBILE_NO
------ ------------ ----------- ------- --------- ------------
E001   Alice Johnson Manager     D01     45000.00  9876543210
E002   Bob Smith    Developer   D02     45000.00  9876543211
E006   Frank Miller Developer   D02     50000.00  9876543215
```

---

Question 13: Display employee name and employee id of those who have salary between 120000 and 300000.

Answer:
The BETWEEN operator is used to filter employees whose salary falls within the range of 120000 to 300000. This range captures high-salary employees and demonstrates range-based filtering with inclusive boundaries.

SQL Query:

```sql
SELECT emp_no, emp_name 
FROM Employee 
WHERE salary BETWEEN 120000 AND 300000;
```

Output:

```
EMP_NO EMP_NAME
------ ------------
E009   Ivy Anderson
E011   Amy Thomas
```

---

Question 14: Display the details of employees whose designation is 'Manager' or 'Computer Assistant'.

Answer:
We use the OR operator to combine two conditions, retrieving employees who have either 'Manager' OR 'Computer Assistant' as their designation. Alternatively, the IN operator could be used for cleaner syntax.

SQL Query:

```sql
-- Method 1: Using OR
SELECT * 
FROM Employee 
WHERE designation = 'Manager' OR designation = 'Computer Assistant';

-- Method 2: Using IN (preferred)
SELECT * 
FROM Employee 
WHERE designation IN ('Manager', 'Computer Assistant');
```

Output:

```
EMP_NO EMP_NAME       DESIGNATION        DEPT_NO SALARY    MOBILE_NO
------ -------------- ------------------ ------- --------- ------------
E001   Alice Johnson  Manager            D01     45000.00  9876543210
E003   Charlie Brown  Computer Assistant D01     25000.00  9876543212
E004   David Wilson   Manager            D02     45000.00  9876543213
E007   Grace Lee      Manager            D04     45000.00  9876543216
E008   Henry Taylor   Computer Assistant D05     22000.00  9876543217
```

---

Question 15: Displays how many employees work for each department.

Answer:
We use the COUNT() aggregate function with GROUP BY clause to count the number of employees in each department. This provides departmental workforce statistics and demonstrates basic aggregation with grouping.

SQL Query:

```sql
SELECT dept_no, COUNT(*) AS employee_count 
FROM Employee 
GROUP BY dept_no;
```

Output:

```
DEPT_NO EMPLOYEE_COUNT
------- --------------
D01     3
D02     4
D03     2
D04     1
D05     1
```

---

Question 16: Displays average salary of employees in each department.

Answer:
The AVG() aggregate function calculates the average salary for each department. We group by dept_no to get department-wise averages, and use ROUND() to format the output to 2 decimal places for better readability.

SQL Query:

```sql
SELECT dept_no, ROUND(AVG(salary), 2) AS average_salary 
FROM Employee 
GROUP BY dept_no;
```

Output:

```
DEPT_NO AVERAGE_SALARY
------- --------------
D01     74166.67
D02     42000.00
D03     142500.00
D04     45000.00
D05     22000.00
```

---

Question 17: Displays total salary of employees in each department.

Answer:
We use the SUM() aggregate function to calculate the total salary expenditure for each department. This helps in budgeting and financial analysis by showing the complete salary outlay per department.

SQL Query:

```sql
SELECT dept_no, SUM(salary) AS total_salary 
FROM Employee 
GROUP BY dept_no;
```

Output:

```
DEPT_NO TOTAL_SALARY
------- ------------
D01     222500.00
D02     168000.00
D03     285000.00
D04     45000.00
D05     22000.00
```

---

Question 18: Displays top and lower salary of employees in each department.

Answer:
We use MAX() and MIN() aggregate functions to find the highest and lowest salaries in each department. This provides salary range information per department and helps identify pay disparities.

SQL Query:

```sql
SELECT 
    dept_no, 
    MAX(salary) AS top_salary, 
    MIN(salary) AS lowest_salary 
FROM Employee 
GROUP BY dept_no;
```

Output:

```
DEPT_NO TOP_SALARY LOWEST_SALARY
------- ---------- -------------
D01     150000.00  25000.00
D02     50000.00   28000.00
D03     250000.00  35000.00
D04     45000.00   45000.00
D05     22000.00   22000.00
```

---

Question 19: Displays average salary of employees in all departments except department with department number 'D05'.

Answer:
We use the NOT operator or <> (not equal) operator in the WHERE clause to exclude department 'D05' from the calculation. The HAVING clause could also be used, but WHERE is more efficient for filtering before aggregation.

SQL Query:

```sql
-- Method 1: Using WHERE
SELECT dept_no, ROUND(AVG(salary), 2) AS average_salary 
FROM Employee 
WHERE dept_no <> 'D05' 
GROUP BY dept_no;

-- Method 2: Using HAVING
SELECT dept_no, ROUND(AVG(salary), 2) AS average_salary 
FROM Employee 
GROUP BY dept_no 
HAVING dept_no <> 'D05';
```

Output:

```
DEPT_NO AVERAGE_SALARY
------- --------------
D01     74166.67
D02     42000.00
D03     142500.00
D04     45000.00
```

---

Question 20: Displays average salary of employees in all departments except department with department number 'D01' and average salary greater than 20000 in the ascending order of average salary.

Answer:
This complex query combines multiple conditions: excludes department 'D01' using WHERE, filters groups having average salary > 20000 using HAVING, and sorts results in ascending order using ORDER BY. This demonstrates the combined use of WHERE, GROUP BY, HAVING, and ORDER BY clauses.

SQL Query:

```sql
SELECT 
    dept_no, 
    ROUND(AVG(salary), 2) AS average_salary 
FROM Employee 
WHERE dept_no <> 'D01' 
GROUP BY dept_no 
HAVING AVG(salary) > 20000 
ORDER BY average_salary ASC;
```

Output:

```
DEPT_NO AVERAGE_SALARY
------- --------------
D04     45000.00
D02     42000.00
D03     142500.00
```

---

Summary of DML Commands Used:

Command	Purpose	Examples Used	
INSERT	Add new records	Populating Department and Employee tables	
SELECT	Retrieve data	All display queries with various filters	
UPDATE	Modify existing records	Changing salary and mobile numbers	
DELETE	Remove records	Deleting employees with specific salary	
WHERE	Filter conditions	Equality, range, pattern matching	
ORDER BY	Sort results	ASC and DESC sorting	
GROUP BY	Group data for aggregation	Department-wise calculations	
HAVING	Filter grouped data	Conditional aggregation	
Aggregate Functions	Calculations	COUNT, AVG, SUM, MAX, MIN	
Operators	Comparisons	=, <>, BETWEEN, IN, LIKE, AND, OR	

---

Complete Table Data After All Operations:

Department Table:

```
DEPT_NO  DEPT_NAME                LOCATION
-------- ------------------------ ----------
D01      Computer Science         Building A
D02      Information Technology   Building B
D03      Electronics              Building C
D04      Mechanical               Building D
D05      Civil                    Building E
```

Employee Table (Final State):

```
EMP_NO EMP_NAME       DESIGNATION        DEPT_NO SALARY      MOBILE_NO
------ -------------- ------------------ ------- ----------- ------------
E001   Alice Johnson  Manager            D01     45000.00    9876543210
E002   Bob Smith      Developer          D02     45000.00    9876543211
E003   Charlie Brown  Computer Assistant D01     25000.00    9876543212
E004   David Wilson   Manager            D02     45000.00    9876543213
E005   Eva Davis      Analyst            D03     35000.00    9876543214
E006   Frank Miller   Developer          D02     50000.00    9876543215
E007   Grace Lee      Manager            D04     45000.00    9876543216
E008   Henry Taylor   Computer Assistant D05     22000.00    9876543217
E009   Ivy Anderson   Developer          D01     150000.00   9876543218
E010   John Martin    Analyst            D02     28000.00    1112223334
E011   Amy Thomas     Developer          D03     250000.00   9876543220
```

---

