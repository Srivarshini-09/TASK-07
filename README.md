# 🧾 Task 7 - SQL Developer Internship: Creating and Using Views

## 📌 Objective
The goal of this task is to:
- Learn how to **create and use SQL views** for abstraction and reporting.
- Use views to **restrict access** and **enforce rules** using `WITH CHECK OPTION`.
- Build reusable, secure logic on top of an existing relational schema.

---

## 🛠️ Database Used
We are using the `ECommerceDB` database from the previous task, which includes the following tables:
- `Category`
- `Product`
- `Customer`
- `Orders`
- `OrderItem`
- `Payment`

---

## 🔍 Sample code

Shows all products with stock less than 10. Useful for warehouse or inventory management teams.

CREATE VIEW LowStockProducts AS
SELECT
    ProductID,
    Name,
    Price,
    Stock
FROM
    Product
WHERE
    Stock < 10;
