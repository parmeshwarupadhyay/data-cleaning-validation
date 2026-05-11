-- Online Retail Dataset - SQL Validation Queries
-- Author: Parmeshwar
-- Purpose: Practice SQL data validation checks

-- Total row count
SELECT COUNT(*) AS total_rows FROM onlineretail;

-- Distinct customers
SELECT COUNT(DISTINCT CustomerID) AS unique_customers FROM onlineretail;

-- Distinct invoices
SELECT COUNT(DISTINCT InvoiceNo) AS unique_invoices FROM onlineretail;
