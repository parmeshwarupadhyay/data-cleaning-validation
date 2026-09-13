-- Breaking onlineretail into fact and dimension table for storage optimization
-- creating product dimension table
CREATE TABLE dim_product AS
SELECT DISTINCT 
    StockCode,
    Description
FROM onlineretail;

-- creating customer dimension table
CREATE TABLE dim_customer AS
SELECT DISTINCT 
    CustomerID,
    Country
FROM onlineretail
WHERE CustomerID IS NOT NULL;

-- creating sales fact table
CREATE TABLE fact_sales AS
SELECT 
    InvoiceNo,
    StockCode,     -- FK to dim_product
    CustomerID,    -- FK to dim_customer
    Quantity,
    InvoiceDate,
    UnitPrice,
    (Quantity * UnitPrice) AS LineTotal
FROM onlineretail;


-- totals rows count for each dimension table
SELECT COUNT(*) AS total_products 
FROM dim_product;                             -- total_products = 3665
SELECT COUNT(*) AS total_customers
FROM dim_customer;                            -- total_customers = 4346


--primary keys on these tables so duplicates can’t be inserted in the future
ALTER TABLE dim_product ADD PRIMARY KEY (StockCode);
ALTER TABLE dim_customer ADD PRIMARY KEY (CustomerID);
