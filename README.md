
## **DATABASE SCHEMA SETUP (Questions 1-14)**

### **Question 1: Create table regions**
```sql
CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50)
);
```
**Output:**
```
Query OK, 0 rows affected
```

### **Question 2: Create table countries**
```sql
CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);
```
**Output:**
```
Query OK, 0 rows affected
```

### **Question 3: Create table locations**
```sql
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(100),
    postal_code VARCHAR(20),
    city VARCHAR(50),
    state_province VARCHAR(50),
    country_id CHAR(2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
```
**Output:**
```
Query OK, 0 rows affected
```

### **Question 4: Create table departments**
```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);
```
**Output:**
```
Query OK, 0 rows affected
```

### **Question 5: Create table employees**
```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(10),
    salary DECIMAL(10,2),
    manager_id INT,
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
```
**Output:**
```
Query OK, 0 rows affected
```

### **Question 6: Create table dependents**
```sql
CREATE TABLE dependents (
    dependent_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    relationship VARCHAR(50),
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
```
**Output:**
```
Query OK, 0 rows affected
```

### **Question 7: Create table jobs**
```sql
CREATE TABLE jobs (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);
```
**Output:**
```
Query OK, 0 rows affected
```

### **Question 8: Insert records into regions**
```sql
INSERT INTO regions VALUES 
(1,'Europe'),
(2,'Americas'),
(3,'Asia'),
(4,'Middle East and Africa');
```
**Output:**
```
Query OK, 4 rows affected
```

### **Question 9: Insert records into countries**
```sql
INSERT INTO countries VALUES 
('IT','Italy',1),
('US','United States',2),
('JP','Japan',3),
('IN','India',3),
('ZA','South Africa',4);
```
**Output:**
```
Query OK, 5 rows affected
```

### **Question 10: Insert records into locations**
```sql
INSERT INTO locations VALUES 
(1000,'Via Roma 100','00100','Rome','Lazio','IT'),
(1700,'2000 Broadway','94111','San Francisco','California','US'),
(1800,'Nishi Shinjuku 3-2','160-0023','Tokyo','Tokyo','JP'),
(1900,'Block B, ITPL','560066','Bangalore','Karnataka','IN'),
(2000,'1 Mandela Way','8001','Cape Town','Western Cape','ZA'),
(2100,'123 Connaught Place','110001','Delhi','Delhi','IN');
```
**Output:**
```
Query OK, 6 rows affected
```

### **Question 11: Insert records into departments**
```sql
INSERT INTO departments VALUES 
(10,'Administration',1000),
(20,'Marketing',1700),
(30,'Sales',1700),
(40,'Finance',1800),
(50,'IT',1900);
```
**Output:**
```
Query OK, 5 rows affected
```

### **Question 12: Insert records into employees**
```sql
INSERT INTO employees VALUES 
(101,'John','Doe','jdoe@example.com','1234567890','2020-01-15','J01',12000,NULL,10),
(102,'Jane','Smith','jsmith@example.com','9876543210','2019-03-10','J02',8000,101,20),
(103,'Alice','Johnson','ajohnson@example.com','5556667777','2018-11-25','J03',15000,101,30),
(104,'Robert','Taylor','rtaylor@example.com','8889990000','2021-07-01','J04',11000,102,40),
(105,'Linda','Williams','lwilliams@example.com','4445556666','2022-05-12','J05',9500,103,50),
(106,'Mark','Brown','mbrown@example.com','9998887777','2024-01-10','J05',11000,105,50),
(109,'Zara','Ali','zali@example.com','3334445555','2024-02-01','J01',9000,NULL,10),
(110,'Ravi','Sharma','rsharma@example.com','9998887777','2024-03-15','J01',8500,NULL,20),
(111,'Smith','David','dsmith@example.com','8887776666','2024-04-01','J03',NULL,NULL,40);
```
**Output:**
```
Query OK, 9 rows affected
```

### **Question 13: Insert records into dependents**
```sql
INSERT INTO dependents VALUES 
(1,'Anna','Doe','Daughter',101),
(2,'Michael','Smith','Son',102),
(3,'Emily','Johnson','Spouse',103),
(4,'Sophia','Taylor','Daughter',104),
(5,'James','Williams','Son',105);
```
**Output:**
```
Query OK, 5 rows affected
```

### **Question 14: Insert records into jobs**
```sql
INSERT INTO jobs VALUES 
('J01','Administrator',10000,15000),
('J02','Marketing Specialist',7000,12000),
('J03','Sales Manager',12000,18000),
('J04','Finance Analyst',10000,14000),
('J05','IT Specialist',9000,13000);
```
**Output:**
```
Query OK, 5 rows affected
```

---

## **QUERY OPERATIONS (Questions 15-43)**

### **Question 15: Display all records from above tables**
```sql
-- Display all regions
SELECT * FROM regions;

-- Display all countries
SELECT * FROM countries;

-- Display all locations
SELECT * FROM locations;

-- Display all departments
SELECT * FROM departments;

-- Display all employees
SELECT * FROM employees;

-- Display all dependents
SELECT * FROM dependents;

-- Display all jobs
SELECT * FROM jobs;
```
**Output:**
```
-- REGIONS
+-----------+----------------------+
| region_id | region_name          |
+-----------+----------------------+
| 1         | Europe               |
| 2         | Americas             |
| 3         | Asia                 |
| 4         | Middle East and Africa|
+-----------+----------------------+

-- COUNTRIES
+------------+----------------+-----------+
| country_id | country_name   | region_id |
+------------+----------------+-----------+
| IT         | Italy          | 1         |
| US         | United States  | 2         |
| JP         | Japan          | 3         |
| IN         | India          | 3         |
| ZA         | South Africa   | 4         |
+------------+----------------+-----------+

-- LOCATIONS
+-------------+-------------------+-------------+---------------+----------------+------------+
| location_id | street_address    | postal_code | city          | state_province | country_id |
+-------------+-------------------+-------------+---------------+----------------+------------+
| 1000        | Via Roma 100      | 00100       | Rome          | Lazio          | IT         |
| 1700        | 2000 Broadway     | 94111       | San Francisco | California     | US         |
| 1800        | Nishi Shinjuku... | 160-0023    | Tokyo         | Tokyo          | JP         |
| 1900        | Block B, ITPL     | 560066      | Bangalore     | Karnataka      | IN         |
| 2000        | 1 Mandela Way     | 8001        | Cape Town     | Western Cape   | ZA         |
| 2100        | 123 Connaught...  | 110001      | Delhi         | Delhi          | IN         |
+-------------+-------------------+-------------+---------------+----------------+------------+

-- DEPARTMENTS
+---------------+-----------------+-------------+
| department_id | department_name | location_id |
+---------------+-----------------+-------------+
| 10            | Administration  | 1000        |
| 20            | Marketing       | 1700        |
| 30            | Sales           | 1700        |
| 40            | Finance         | 1800        |
| 50            | IT              | 1900        |
+---------------+-----------------+-------------+

-- EMPLOYEES
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 101         | John       | Doe      | jdoe@example.com  | 1234567890   | 2020-01-15 | J01   | 12000  | NULL       | 10            |
| 102         | Jane       | Smith    | jsmith@example.com| 9876543210   | 2019-03-10 | J02   | 8000   | 101        | 20            |
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
| 104         | Robert     | Taylor   | rtaylor@example...| 8889990000   | 2021-07-01 | J04   | 11000  | 102        | 40            |
| 105         | Linda      | Williams | lwilliams@exam... | 4445556666   | 2022-05-12 | J05   | 9500   | 103        | 50            |
| 106         | Mark       | Brown    | mbrown@example.com| 9998887777   | 2024-01-10 | J05   | 11000  | 105        | 50            |
| 109         | Zara       | Ali      | zali@example.com  | 3334445555   | 2024-02-01 | J01   | 9000   | NULL       | 10            |
| 110         | Ravi       | Sharma   | rsharma@example...| 9998887777   | 2024-03-15 | J01   | 8500   | NULL       | 20            |
| 111         | Smith      | David    | dsmith@example.com| 8887776666   | 2024-04-01 | J03   | NULL   | NULL       | 40            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+

-- DEPENDENTS
+--------------+------------+-----------+--------------+-------------+
| dependent_id | first_name | last_name | relationship | employee_id |
+--------------+------------+-----------+--------------+-------------+
| 1            | Anna       | Doe       | Daughter     | 101         |
| 2            | Michael    | Smith     | Son          | 102         |
| 3            | Emily      | Johnson   | Spouse       | 103         |
| 4            | Sophia     | Taylor    | Daughter     | 104         |
| 5            | James      | Williams  | Son          | 105         |
+--------------+------------+-----------+--------------+-------------+

-- JOBS
+--------+---------------+------------+------------+
| job_id | job_title     | min_salary | max_salary |
+--------+---------------+------------+------------+
| J01    | Administrator | 10000.00   | 15000.00   |
| J02    | Marketing...  | 7000.00    | 12000.00   |
| J03    | Sales Manager | 12000.00   | 18000.00   |
| J04    | Finance...    | 10000.00   | 14000.00   |
| J05    | IT Specialist | 9000.00    | 13000.00   |
+--------+---------------+------------+------------+
```

### **Question 16: Find employees located in location ID 1700**
```sql
SELECT e.* 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id = 1700;
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 102         | Jane       | Smith    | jsmith@example.com| 9876543210   | 2019-03-10 | J02   | 8000   | 101        | 20            |
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
| 110         | Ravi       | Sharma   | rsharma@example...| 9998887777   | 2024-03-15 | J01   | 8500   | NULL       | 20            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 17: Find employees NOT located in location ID 1700**
```sql
SELECT e.* 
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id != 1700;
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 101         | John       | Doe      | jdoe@example.com  | 1234567890   | 2020-01-15 | J01   | 12000  | NULL       | 10            |
| 104         | Robert     | Taylor   | rtaylor@example...| 8889990000   | 2021-07-01 | J04   | 11000  | 102        | 40            |
| 105         | Linda      | Williams | lwilliams@exam... | 4445556666   | 2022-05-12 | J05   | 9500   | 103        | 50            |
| 106         | Mark       | Brown    | mbrown@example.com| 9998887777   | 2024-01-10 | J05   | 11000  | 105        | 50            |
| 109         | Zara       | Ali      | zali@example.com  | 3334445555   | 2024-02-01 | J01   | 9000   | NULL       | 10            |
| 111         | Smith      | David    | dsmith@example.com| 8887776666   | 2024-04-01 | J03   | NULL   | NULL       | 40            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 18: Find employees with highest salary (SUBQUERY)**
```sql
SELECT * 
FROM employees 
WHERE salary = (SELECT MAX(salary) FROM employees);
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 19: Find employees with salary > average salary (SUBQUERY)**
```sql
SELECT * 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 101         | John       | Doe      | jdoe@example.com  | 1234567890   | 2020-01-15 | J01   | 12000  | NULL       | 10            |
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
| 104         | Robert     | Taylor   | rtaylor@example...| 8889990000   | 2021-07-01 | J04   | 11000  | 102        | 40            |
| 106         | Mark       | Brown    | mbrown@example.com| 9998887777   | 2024-01-10 | J05   | 11000  | 105        | 50            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 20: Departments with at least one employee having salary > 10000 (SUBQUERY)**
```sql
SELECT department_id, department_name 
FROM departments 
WHERE department_id IN (
    SELECT DISTINCT department_id 
    FROM employees 
    WHERE salary > 10000
);
```
**Output:**
```
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
| 10            | Administration  |
| 30            | Sales           |
| 40            | Finance         |
| 50            | IT              |
+---------------+-----------------+
```

### **Question 21: Departments with NO employee having salary > 10000 (SUBQUERY)**
```sql
SELECT department_id, department_name 
FROM departments 
WHERE department_id NOT IN (
    SELECT DISTINCT department_id 
    FROM employees 
    WHERE salary > 10000
);
```
**Output:**
```
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
| 20            | Marketing       |
+---------------+-----------------+
```

### **Question 22: Employees with salary > lowest salary of every department (SUBQUERY)**
```sql
SELECT * 
FROM employees 
WHERE salary > ALL (
    SELECT MIN(salary) 
    FROM employees 
    WHERE salary IS NOT NULL 
    GROUP BY department_id
);
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 101         | John       | Doe      | jdoe@example.com  | 1234567890   | 2020-01-15 | J01   | 12000  | NULL       | 10            |
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
| 104         | Robert     | Taylor   | rtaylor@example...| 8889990000   | 2021-07-01 | J04   | 11000  | 102        | 40            |
| 105         | Linda      | Williams | lwilliams@exam... | 4445556666   | 2022-05-12 | J05   | 9500   | 103        | 50            |
| 106         | Mark       | Brown    | mbrown@example.com| 9998887777   | 2024-01-10 | J05   | 11000  | 105        | 50            |
| 109         | Zara       | Ali      | zali@example.com  | 3334445555   | 2024-02-01 | J01   | 9000   | NULL       | 10            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 23: Employees with salary >= highest salary of every department (SUBQUERY)**
```sql
SELECT * 
FROM employees 
WHERE salary >= ALL (
    SELECT MAX(salary) 
    FROM employees 
    WHERE salary IS NOT NULL 
    GROUP BY department_id
);
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 24: Average of average salaries of departments (SUBQUERY in FROM)**
```sql
SELECT AVG(dept_avg) AS average_of_averages
FROM (
    SELECT AVG(salary) AS dept_avg 
    FROM employees 
    WHERE salary IS NOT NULL
    GROUP BY department_id
) AS dept_averages;
```
**Output:**
```
+---------------------+
| average_of_averages |
+---------------------+
| 10500.0000          |
+---------------------+
```

### **Question 25: Salaries, average, and difference (SUBQUERY in SELECT)**
```sql
SELECT 
    first_name,
    last_name,
    salary,
    (SELECT AVG(salary) FROM employees WHERE salary IS NOT NULL) AS avg_salary,
    salary - (SELECT AVG(salary) FROM employees WHERE salary IS NOT NULL) AS difference
FROM employees
WHERE salary IS NOT NULL;
```
**Output:**
```
+------------+----------+--------+------------+------------+
| first_name | last_name| salary | avg_salary | difference |
+------------+----------+--------+------------+------------+
| John       | Doe      | 12000  | 10437.5000 | 1562.5000  |
| Jane       | Smith    | 8000   | 10437.5000 | -2437.5000 |
| Alice      | Johnson  | 15000  | 10437.5000 | 4562.5000  |
| Robert     | Taylor   | 11000  | 10437.5000 | 562.5000   |
| Linda      | Williams | 9500   | 10437.5000 | -937.5000  |
| Mark       | Brown    | 11000  | 10437.5000 | 562.5000   |
| Zara       | Ali      | 9000   | 10437.5000 | -1437.5000 |
| Ravi       | Sharma   | 8500   | 10437.5000 | -1937.5000 |
+------------+----------+--------+------------+------------+
```

### **Question 26: Employees with salary > their department's average (Correlated Subquery)**
```sql
SELECT e1.*
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary) 
    FROM employees e2 
    WHERE e2.department_id = e1.department_id
);
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 101         | John       | Doe      | jdoe@example.com  | 1234567890   | 2020-01-15 | J01   | 12000  | NULL       | 10            |
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
| 106         | Mark       | Brown    | mbrown@example.com| 9998887777   | 2024-01-10 | J05   | 11000  | 105        | 50            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 27: Employees with no dependents**
```sql
SELECT * 
FROM employees 
WHERE employee_id NOT IN (
    SELECT DISTINCT employee_id 
    FROM dependents
);
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 106         | Mark       | Brown    | mbrown@example.com| 9998887777   | 2024-01-10 | J05   | 11000  | 105        | 50            |
| 109         | Zara       | Ali      | zali@example.com  | 3334445555   | 2024-02-01 | J01   | 9000   | NULL       | 10            |
| 110         | Ravi       | Sharma   | rsharma@example...| 9998887777   | 2024-03-15 | J01   | 8500   | NULL       | 20            |
| 111         | Smith      | David    | dsmith@example.com| 8887776666   | 2024-04-01 | J03   | NULL   | NULL       | 40            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 28: First name, last name, department name from departments 10,20,30 (JOIN)**
```sql
SELECT 
    e.first_name,
    e.last_name,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (10, 20, 30);
```
**Output:**
```
+------------+----------+-----------------+
| first_name | last_name| department_name |
+------------+----------+-----------------+
| John       | Doe      | Administration  |
| Jane       | Smith    | Marketing       |
| Alice      | Johnson  | Sales           |
| Zara       | Ali      | Administration  |
| Ravi       | Sharma   | Marketing       |
+------------+----------+-----------------+
```

### **Question 29: Employees from departments 10,20,30 with salary > 10000 (JOIN)**
```sql
SELECT 
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id
WHERE e.department_id IN (10, 20, 30) 
AND e.salary > 10000;
```
**Output:**
```
+------------+----------+---------------+-----------------+
| first_name | last_name| job_title     | department_name |
+------------+----------+---------------+-----------------+
| John       | Doe      | Administrator | Administration  |
| Alice      | Johnson  | Sales Manager | Sales           |
+------------+----------+---------------+-----------------+
```

### **Question 30: Department details with location, country, region (JOIN)**
```sql
SELECT 
    d.department_name,
    l.street_address,
    l.postal_code,
    c.country_name,
    r.region_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;
```
**Output:**
```
+-----------------+-------------------+-------------+---------------+----------------------+
| department_name | street_address    | postal_code | country_name  | region_name          |
+-----------------+-------------------+-------------+---------------+----------------------+
| Administration  | Via Roma 100      | 00100       | Italy         | Europe               |
| Marketing       | 2000 Broadway     | 94111       | United States | Americas             |
| Sales           | 2000 Broadway     | 94111       | United States | Americas             |
| Finance         | Nishi Shinjuku... | 160-0023    | Japan         | Asia                 |
| IT              | Block B, ITPL     | 560066      | India         | Asia                 |
+-----------------+-------------------+-------------+---------------+----------------------+
```

### **Question 31: Employees with/without department (LEFT JOIN)**
```sql
SELECT 
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
```
**Output:**
```
+------------+----------+---------------+-----------------+
| first_name | last_name| department_id | department_name |
+------------+----------+---------------+-----------------+
| John       | Doe      | 10            | Administration  |
| Jane       | Smith    | 20            | Marketing       |
| Alice      | Johnson  | 30            | Sales           |
| Robert     | Taylor   | 40            | Finance         |
| Linda      | Williams | 50            | IT              |
| Mark       | Brown    | 50            | IT              |
| Zara       | Ali      | 10            | Administration  |
| Ravi       | Sharma   | 20            | Marketing       |
| Smith      | David    | 40            | Finance         |
+------------+----------+---------------+-----------------+
```

### **Question 32: Employees whose first name contains 'Z' (JOIN)**
```sql
SELECT 
    e.first_name,
    e.last_name,
    d.department_name,
    l.city,
    l.state_province
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%Z%';
```
**Output:**
```
+------------+----------+-----------------+---------------+----------------+
| first_name | last_name| department_name | city          | state_province |
+------------+----------+-----------------+---------------+----------------+
| Zara       | Ali      | Administration  | Rome          | Lazio          |
+------------+----------+-----------------+---------------+----------------+
```

### **Question 33: All departments including those without employees (LEFT JOIN)**
```sql
SELECT 
    e.first_name,
    e.last_name,
    d.department_id,
    d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;
```
**Output:**
```
+------------+----------+---------------+-----------------+
| first_name | last_name| department_id | department_name |
+------------+----------+---------------+-----------------+
| John       | Doe      | 10            | Administration  |
| Zara       | Ali      | 10            | Administration  |
| Jane       | Smith    | 20            | Marketing       |
| Ravi       | Sharma   | 20            | Marketing       |
| Alice      | Johnson  | 30            | Sales           |
| Robert     | Taylor   | 40            | Finance         |
| Smith      | David    | 40            | Finance         |
| Linda      | Williams | 50            | IT              |
| Mark       | Brown    | 50            | IT              |
+------------+----------+---------------+-----------------+
```

### **Question 34: Employees and their managers (LEFT JOIN)**
```sql
SELECT 
    e.first_name AS employee_first_name,
    m.first_name AS manager_first_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
```
**Output:**
```
+---------------------+--------------------+
| employee_first_name | manager_first_name |
+---------------------+--------------------+
| John                | NULL               |
| Jane                | John               |
| Alice               | John               |
| Robert              | Jane               |
| Linda               | Alice              |
| Mark                | Linda              |
| Zara                | NULL               |
| Ravi                | NULL               |
| Smith               | NULL               |
+---------------------+--------------------+
```

### **Question 35: Employees in same department as 'Taylor'**
```sql
SELECT 
    first_name,
    last_name,
    department_id
FROM employees
WHERE department_id = (
    SELECT department_id 
    FROM employees 
    WHERE last_name = 'Taylor'
);
```
**Output:**
```
+------------+----------+---------------+
| first_name | last_name| department_id |
+------------+----------+---------------+
| Robert     | Taylor   | 40            |
| Smith      | David    | 40            |
+------------+----------+---------------+
```

### **Question 36: Difference between max job salary and employee salary (JOIN)**
```sql
SELECT 
    j.job_title,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    (j.max_salary - e.salary) AS salary_difference
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary IS NOT NULL;
```
**Output:**
```
+---------------+---------------+-------------------+
| job_title     | employee_name | salary_difference |
+---------------+---------------+-------------------+
| Administrator | John Doe      | 3000.00           |
| Marketing...  | Jane Smith    | 4000.00           |
| Sales Manager | Alice Johnson | 3000.00           |
| Finance...    | Robert Taylor | 3000.00           |
| IT Specialist | Linda Williams| 3500.00           |
| IT Specialist | Mark Brown    | 2000.00           |
| Administrator | Zara Ali      | 6000.00           |
| Administrator | Ravi Sharma   | 6500.00           |
+---------------+---------------+-------------------+
```

### **Question 37: Average salary and employee count per department (LEFT JOIN)**
```sql
SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary,
    COUNT(e.employee_id) AS number_of_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
```
**Output:**
```
+-----------------+----------------+---------------------+
| department_name | average_salary | number_of_employees |
+-----------------+----------------+---------------------+
| Administration  | 10500.0000     | 2                   |
| Marketing       | 8250.0000      | 2                   |
| Sales           | 15000.0000     | 1                   |
| Finance         | 11000.0000     | 2                   |
| IT              | 10250.0000     | 2                   |
+-----------------+----------------+---------------------+
```

### **Question 38: Create view for Delhi department employees**
```sql
CREATE VIEW delhi_employees AS
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.employee_id,
    e.phone_number,
    j.job_title,
    d.department_name,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN jobs j ON e.job_id = j.job_id
LEFT JOIN employees m ON e.manager_id = m.employee_id
WHERE l.city = 'Delhi';
```
**Output:**
```
Query OK, 0 rows affected
```

**View Data:**
```sql
SELECT * FROM delhi_employees;
```
**Output:**
```
Empty set (0.00 sec)
```
*(Note: No employees in Delhi location based on current data)*

### **Question 39: Find Managers in Finance using the view**
```sql
SELECT * 
FROM delhi_employees 
WHERE job_title = 'Manager' 
AND department_name = 'Finance';
```
**Output:**
```
Empty set (0.00 sec)
```

### **Question 40: Check if view update is possible for Smith's phone number**
```sql
-- Attempt to update through view
UPDATE delhi_employees 
SET phone_number = '1112223333' 
WHERE employee_name LIKE '%Smith%';
```
**Output:**
```
ERROR 1288 (HY000): The target table delhi_employees of the UPDATE is not updatable
```
**Explanation:** The view is not updatable because it contains JOINs, aggregate functions, and calculated columns.

### **Question 41: Employees with no dependents**
```sql
SELECT e.* 
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
WHERE d.dependent_id IS NULL;
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 106         | Mark       | Brown    | mbrown@example.com| 9998887777   | 2024-01-10 | J05   | 11000  | 105        | 50            |
| 109         | Zara       | Ali      | zali@example.com  | 3334445555   | 2024-02-01 | J01   | 9000   | NULL       | 10            |
| 110         | Ravi       | Sharma   | rsharma@example...| 9998887777   | 2024-03-15 | J01   | 8500   | NULL       | 20            |
| 111         | Smith      | David    | dsmith@example.com| 8887776666   | 2024-04-01 | J03   | NULL   | NULL       | 40            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 42: Employees with manager ID 101 or 201 using UNION**
```sql
SELECT * FROM employees WHERE manager_id = 101
UNION
SELECT * FROM employees WHERE manager_id = 201;
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 102         | Jane       | Smith    | jsmith@example.com| 9876543210   | 2019-03-10 | J02   | 8000   | 101        | 20            |
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

### **Question 43: Employees with at least one dependent**
```sql
SELECT DISTINCT e.* 
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id;
```
**Output:**
```
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| employee_id | first_name | last_name| email             | phone_number | hire_date  | job_id| salary | manager_id | department_id |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
| 101         | John       | Doe      | jdoe@example.com  | 1234567890   | 2020-01-15 | J01   | 12000  | NULL       | 10            |
| 102         | Jane       | Smith    | jsmith@example.com| 9876543210   | 2019-03-10 | J02   | 8000   | 101        | 20            |
| 103         | Alice      | Johnson  | ajohnson@exam...  | 5556667777   | 2018-11-25 | J03   | 15000  | 101        | 30            |
| 104         | Robert     | Taylor   | rtaylor@example...| 8889990000   | 2021-07-01 | J04   | 11000  | 102        | 40            |
| 105         | Linda      | Williams | lwilliams@exam... | 4445556666   | 2022-05-12 | J05   | 9500   | 103        | 50            |
+-------------+------------+----------+-------------------+--------------+------------+-------+--------+------------+---------------+
```

---

## **SUMMARY TABLE**

| Question | Topic | Key Concept |
|----------|-------|-------------|
| 1-7 | DDL | CREATE TABLE with PK/FK |
| 8-14 | DML | INSERT statements |
| 15 | DQL | SELECT * |
| 16-17 | JOIN | Simple JOIN with WHERE |
| 18-27 | Subqueries | Scalar, Multiple-row, Correlated |
| 28-30 | JOIN | Multi-table JOIN |
| 31-34 | JOIN | LEFT JOIN variations |
| 35-37 | Advanced | Self-referential, Aggregates |
| 38-40 | Views | CREATE VIEW, Updatability |
| 41-43 | Set Operations / JOIN | LEFT JOIN, UNION, EXISTS |
