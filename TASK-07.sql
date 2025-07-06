-- 👨‍💻 TASK 7: Creating and Using Views in Your eCommerceDB Schema
-- **************************************************************

-- Use the existing database
USE ECommerceDB;

-- View for products that are running low in stock (e.g., Stock < 10) view is a virtual table doesnt stores but displays data
CREATE VIEW LowStockProducts AS
SELECT
    ProductID,
    Name,
    Price,
    Stock
FROM
    Product
WHERE
    Stock < 50;

-- Query the low stock products
SELECT * FROM LowStockProducts;


-- View for customer order summaries
-- Includes customer name, email, order ID, date, and total
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

-- Query the customer order summary view
SELECT * FROM CustomerOrderSummary;


-- Create a secured view to show only orders above a threshold (e.g., TotalAmount > 1000)
-- Use WITH CHECK OPTION to restrict updates/inserts to valid rows in future
CREATE VIEW HighValueOrders AS
SELECT *
FROM Orders
WHERE TotalAmount > 1000
WITH CHECK OPTION;

SELECT * FROM HighValueOrders;

-- Insert into HighValueOrders (✅ valid insert)
INSERT INTO HighValueOrders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (999, 1, NOW(), 1500.00);