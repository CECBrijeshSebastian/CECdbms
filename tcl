mysql> create database tclex;
Query OK, 1 row affected (0.00 sec)

mysql> use tclex;
Database changed
mysql> CREATE TABLE Order_Details
    -> (Order_ID INT,
    -> Product_Name VARCHAR(100),
    -> Order_Num INT,
    -> Order_Date DATE);
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> INSERT INTO Order_Details
    -> (Order_ID, Product_Name, Order_Num, Order_Date)
    -> VALUES
    -> (1, 'Laptop', 5544, '2020-02-01'),
    -> (2, 'Mouse', 3322, '2020-02-11'),
    -> (3, 'Desktop', 2135, '2020-01-05'),
    -> (4, 'Mobile', 3432, '2020-02-22'),
    -> (5, 'Anti-Virus', 5648, '2020-03-10');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
|        4 | Mobile       |      3432 | 2020-02-22 |
|        5 | Anti-Virus   |      5648 | 2020-03-10 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> INSERT INTO Order_Details
    -> (Order_ID, Product_Name, Order_Num, Order_Date)
    -> VALUES
    -> (6, 'FireWall', 1006, '2023-07-22'),
    -> (7, 'Keyboard', 1007, '2023-07-22');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Order_Details;                                                                                                                                     +----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
|        4 | Mobile       |      3432 | 2020-02-22 |
|        5 | Anti-Virus   |      5648 | 2020-03-10 |
|        6 | FireWall     |      1006 | 2023-07-22 |
|        7 | Keyboard     |      1007 | 2023-07-22 |
+----------+--------------+-----------+------------+
7 rows in set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
|        4 | Mobile       |      3432 | 2020-02-22 |
|        5 | Anti-Virus   |      5648 | 2020-03-10 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> DELETE FROM Order_Details WHERE Order_ID IN (4,5);
Query OK, 2 rows affected (0.00 sec)

mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
+----------+--------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
+----------+--------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
+----------+--------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> SET autocommit = 0;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SAVEPOINT Check_Updates;
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE Order_Details
    -> SET Product_Name='ASUS-Laptop'
    -> WHERE Order_Num=5544;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | ASUS-Laptop  |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
+----------+--------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Order_Details
    -> (Order_ID, Product_Name, Order_Num, Order_Date)
    -> VALUES
    -> (6, 'FireWall', 1006, '2023-07-22'),
    -> (7, 'Laptop', 1007, '2023-07-22');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | ASUS-Laptop  |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
|        6 | FireWall     |      1006 | 2023-07-22 |
|        7 | Laptop       |      1007 | 2023-07-22 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> SAVEPOINT Check_delete;
Query OK, 0 rows affected (0.00 sec)

mysql> DELETE FROM Order_Details
    -> WHERE Product_Name='Laptop';
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | ASUS-Laptop  |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
|        6 | FireWall     |      1006 | 2023-07-22 |
+----------+--------------+-----------+------------+
4 rows in set (0.01 sec)

mysql> ROLLBACK TO SAVEPOINT Check_delete;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | ASUS-Laptop  |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
|        6 | FireWall     |      1006 | 2023-07-22 |
|        7 | Laptop       |      1007 | 2023-07-22 |
+----------+--------------+-----------+------------+
5 rows in set (0.00 sec)

mysql> ROLLBACK TO SAVEPOINT Check_Updates;
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> SELECT * FROM Order_Details;
\+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
+----------+--------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> COMMIT;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SET autocommit=1;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SELECT * FROM Order_Details;
+----------+--------------+-----------+------------+
| Order_ID | Product_Name | Order_Num | Order_Date |
+----------+--------------+-----------+------------+
|        1 | Laptop       |      5544 | 2020-02-01 |
|        2 | Mouse        |      3322 | 2020-02-11 |
|        3 | Desktop      |      2135 | 2020-01-05 |
+----------+--------------+-----------+------------+
3 rows in set (0.00 sec)

mysql> 

