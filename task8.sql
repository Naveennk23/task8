mysql> use ecommerce_db;
Database changed
mysql> select * from customers;
+-------------+--------------+--------------------+--------------+
| customer_id | name         | email              | amount_spent |
+-------------+--------------+--------------------+--------------+
|           1 | Naveen Kumar | naveen@example.com |         1500 |
|           2 | Asha Rao     | asha@example.com   |         2000 |
|           3 | madhu        | madhu89@gmail.com  |         1500 |
|           4 | Kutty        | kutty90@gmail      |         1000 |
|           5 | keerthi      | keerthi12@gmail    |         2000 |
+-------------+--------------+--------------------+--------------+
5 rows in set (0.01 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE get_high_spenders(IN min_amount INT)
    -> BEGIN
    ->     SELECT * FROM customers
    ->     WHERE amount_spent > min_amount;
    -> END //
Query OK, 0 rows affected (0.13 sec)


mysql> DELIMITER ;
mysql> CALL get_high_spenders(1500);
+-------------+----------+------------------+--------------+
| customer_id | name     | email            | amount_spent |
+-------------+----------+------------------+--------------+
|           2 | Asha Rao | asha@example.com |         2000 |
|           5 | keerthi  | keerthi12@gmail  |         2000 |
+-------------+----------+------------------+--------------+
2 rows in set (0.06 sec)

Query OK, 0 rows affected (0.08 sec)

mysql> DELIMITER //

mysql> CREATE FUNCTION get_email_by_id(cust_id INT)
    -> RETURNS VARCHAR(100)
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE cust_email VARCHAR(100);
    ->     SELECT email INTO cust_email FROM customers WHERE customer_id = cust_id;
    ->     RETURN cust_email;
    -> END //
Query OK, 0 rows affected (0.05 sec)


mysql> DELIMITER ;
mysql> SELECT get_email_by_id(1);
+--------------------+
| get_email_by_id(1) |
+--------------------+
| naveen@example.com |
+--------------------+
1 row in set (0.03 sec)
