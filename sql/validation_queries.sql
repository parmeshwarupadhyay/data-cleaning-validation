-- Online Retail Dataset - SQL Validation Queries
-- Author: Parmeshwar
-- Purpose: Practice SQL data validation checks

-- 1. Basic Integrity
SELECT COUNT(*) AS total_rows FROM onlineretail;  -- Total row count
SELECT COUNT(DISTINCT CustomerID) AS unique_customers FROM onlineretail;  -- Distinct customers
SELECT COUNT(DISTINCT InvoiceNo) AS unique_invoices FROM onlineretail;  -- Distinct invoices
