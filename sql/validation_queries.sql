-- Online Retail Dataset - SQL Validation Queries
-- Author: Parmeshwar
-- Purpose: Practice SQL data validation checks

-- create table and database
create database datavalidation
use datavalidation
CREATE TABLE onlineretail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(50)
    TotalPrice Decimal(10,2)
);


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

--4. Duplicates and Aggregates
SELECT InvoiceNo, StockCode, COUNT(*) AS line_count          -- Check for duplicates
FROM onlineretail_aggregated
GROUP BY InvoiceNo, StockCode
HAVING COUNT(*) > 1;

CREATE VIEW onlineretail_aggregated AS      -- Aggregated view for avoiding duplicates
SELECT 
    InvoiceNo,
    StockCode,
    SUM(Quantity) AS total_quantity,
    MIN(UnitPrice) AS unit_price,   -- or AVG(UnitPrice) if you prefer
    SUM(Quantity * UnitPrice) AS line_total
FROM onlineretail
GROUP BY InvoiceNo, StockCode;

-- Ensure TotalPrice column is consistent
SELECT InvoiceNo, StockCode, Quantity, UnitPrice, TotalPrice,
       (Quantity * UnitPrice) AS calculated_total
FROM onlineretail
WHERE TotalPrice <> (Quantity * UnitPrice);

-- Check invoice date range
SELECT MIN(InvoiceDate) AS start_date, MAX(InvoiceDate) AS end_date
FROM onlineretail;

-- Customers with unusually high spend
SELECT CustomerID, SUM(TotalPrice) AS total_spent
FROM onlineretail
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;



