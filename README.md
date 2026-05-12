# Project Documentation
Python code is now in [cleandata.py](cleandata.py).  
SQL queries are in [sql/validation_queries.sql](sql/validation_queries.sql).

## 🗄️ SQL Validation

All SQL queries are stored in [`sql/validation_queries.sql`](sql/validation_queries.sql).

Example checks include:
- Row counts & uniqueness
- Invalid values (negative quantities, zero prices, cancellations)
- Aggregated invoice totals
- Customer spend analysis
- Duplicate line items
- Outlier detection
