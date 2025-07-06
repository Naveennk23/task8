# 📘 SQL Internship – Task 8: Stored Procedure & Function

This task demonstrates how to create and use a **stored procedure** and a **user-defined function** in MySQL using the `customers` table from the `ecommerce_db` database.

---

## ✅ Task Objective

- Create a stored procedure with input parameters
- Create a user-defined function with return value
- Practice calling and testing both procedure and function

---

## 🗃️ Table Used: `customers`

| customer_id | name         | email              | amount_spent |
|-------------|--------------|--------------------|--------------|
| 1           | Naveen Kumar | naveen@example.com | 1500         |
| 2           | Asha Rao     | asha@example.com   | 2000         |
| 3           | madhu        | madhu89@gmail.com  | 1500         |
| 4           | Kutty        | kutty90@gmail      | 1000         |
| 5           | keerthi      | keerthi12@gmail    | 2000         |

---

## 🔹 1️⃣ Stored Procedure: `get_high_spenders`

**Purpose**: Return customers who spent more than the given amount.

```sql
DELIMITER //

CREATE PROCEDURE get_high_spenders(IN min_amount INT)
BEGIN
    SELECT * FROM customers
    WHERE amount_spent > min_amount;
END //

DELIMITER ;
