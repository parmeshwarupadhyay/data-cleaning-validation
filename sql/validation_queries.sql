-- Online Retail Dataset - SQL Validation Queries
-- Author: Parmeshwar
-- Purpose: Practice SQL data validation checks

-- 1. Basic Integrity
SELECT COUNT(*) AS total_rows FROM onlineretail;                                -- Total row count
SELECT COUNT(DISTINCT CustomerID) AS unique_customers FROM onlineretail;        -- Distinct customers
SELECT COUNT(DISTINCT InvoiceNo) AS unique_invoices FROM onlineretail;          -- Distinct invoices

-- 2. Invalid data checks
SELECT * FROM onlineretail WHERE Quantity <= 0;                    -- Negative or zero quantities
SELECT * FROM onlineretail WHERE UnitPrice <= 0;                   -- Zero or negative unit prices
SELECT * FROM onlineretail WHERE Description IS NULL OR Description = 'Unknown'; -- Missing descriptions
SELECT * FROM onlineretail WHERE InvoiceNo LIKE 'C%'; -- Cancelled invoices (should start with 'C')

--3. Range checks
SELECT MAX(UnitPrice) AS max_unit_price FROM onlineretail; -- Highest unit price
SELECT * FROM onlineretail WHERE Quantity > 1000;          -- Quantity outliers (e.g., > 1000 units in one invoice line)
SELECT Description, UnitPrice                              -- Top 10 most expensive items
FROM onlineretail
ORDER BY UnitPrice DESC
LIMIT 10;



