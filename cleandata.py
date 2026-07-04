# Data Cleaning & Validation – Online Retail Dataset

In this project I used a dataset from Kaggle for data cleaning with Python and data validation with SQL queries.

Author: Parmeshwar Upadhyay

---

## 📌 Purpose
Practice data cleaning, formatting, and validation using Python (pandas) and SQL (MySQL).

---

## 🐍 Python Workflow

### Step 1: Import Libraries
import pandas as pd
import numpy as np

# Step 2: Load Dataset
# Adjust path if needed
df = pd.read_csv(r"C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\OnlineRetail.csv", encoding="ISO-8859-1")

# Inspect dataset
print("Shape:", df.shape)
print(df.info())
df.head()

# Step 3: Handle Missing Values
print("Missing values per column:\n", df.isnull().sum())

# Drop rows with missing CustomerID (exists in this dataset)
df = df.dropna(subset=["CustomerID"])
df['CustomerID'] = df['CustomerID'].astype(int)
print(f'After dropping missing CustomerID: {len(df):,}')

# Fill missing descriptions with placeholder
df["Description"] = df["Description"].fillna("Unknown")

# Step 4: Remove Duplicates
df = df.drop_duplicates()

# Step 5: Validate Data Ranges
## Quantity and UnitPrice must be positive
df = df[(df["Quantity"] > 0) & (df["UnitPrice"] > 0)]

# Step 6: Format Date
df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"], errors="coerce", dayfirst=False)
df = df[~df['InvoiceNo'].astype(str).str.startswith('C')]
print(f'After removing cancellations: {len(df):,}')

#  Remove rows with zero or negative unit prices (free items / errors)
df = df[df['UnitPrice'] > 0]
print(f'After removing bad unit prices: {len(df):,}')

# Step 7: Derived Columns
df["TotalPrice"] = df["Quantity"] * df["UnitPrice"]

# Step 8: Validation Checks
## InvoiceNo should be string, cancellations start with 'C'
invalid_invoices = df[~df["InvoiceNo"].astype(str).str.isnumeric()]
print("Sample cancelled invoices:\n", invalid_invoices.head())

# Check for extreme outliers in UnitPrice
print("Max UnitPrice:", df["UnitPrice"].max())
print(f'\nFinal shape: {df.shape}')
print(f'Date range: {df["InvoiceDate"].min().date()} → {df["InvoiceDate"].max().date()}')
print(f'Unique customers: {df["CustomerID"].nunique():,}')
print(f'Unique invoices:  {df["InvoiceNo"].nunique():,}')

# Step 9: Save Cleaned Data
df.to_csv("OnlineRetail_Cleaned.csv", index=False)
print("Cleaned dataset saved as OnlineRetail_Cleaned.csv")

# Extra Practice Ideas:
# - Run SQL queries on cleaned dataset
