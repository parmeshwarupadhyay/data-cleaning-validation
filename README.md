# Project Documentation
Python code is now in [cleandata.py](cleandata.py).  
SQL queries are in [sql/validation_queries.sql](sql/validation_queries.sql).


## 1. Data Cleaning (Python)
- Run `cleandata.py`
- Cleans raw Kaggle dataset:
  - Handles missing values
  - Drops duplicates
  - Removes cancellations
  - Validates ranges (Quantity, UnitPrice)
- Outputs: `data/OnlineRetail_Cleaned.csv`

## 🗄️ SQL Validation

All SQL queries are stored in [`sql/validation_queries.sql`](sql/validation_queries.sql).

 Import into MySQL
- Create database:
  ```sql
  CREATE DATABASE datavalidation;
  USE datavalidation;

Example checks include:
- Row counts & uniqueness
- Invalid values (negative quantities, zero prices, cancellations)
- Aggregated invoice totals
- Customer spend analysis
- Duplicate line items
- Outlier detection
