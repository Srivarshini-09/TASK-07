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

CREATE VIEW CustomerOrderSummary AS
SELECT
    o.OrderID,
    c.Name AS CustomerName,
    c.Email,
    o.OrderDate,
    o.TotalAmount
FROM
    Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID;

CREATE VIEW HighValueOrders AS
SELECT *
FROM Orders
WHERE TotalAmount > 1000
WITH CHECK OPTION;
