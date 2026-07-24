# Online Retail Dataset - Data Cleaning \& Validation



# Problem Statement

Retail businesses often struggle with maintaining clean, reliable, and actionable customer transaction data. The Online Retail dataset, which contains thousands of invoices, customer IDs, product descriptions, quantities, and prices, suffers from common issues such as duplicate records, canceled orders, missing customer information, and inconsistent pricing. These anomalies reduce the accuracy of sales reporting, hinder customer behavior analysis, and limit the ability to make data‑driven decisions.



# About the Project

This project aims to design and implement a robust data cleaning and validation pipeline using Python, SQL, and Excel.

Handles 500k+ rows of data which can be used for visualization and reporting.



## Workflow

1. **Data Import \& Inspection**
* Load raw dataset into Python.
* Check for missing values, duplicates, and anomalies.

2\. **Data Cleaning (Python)**

* Handle null values in CustomerID.
* Remove duplicate rows and canceled invoices.
* Validating positive Quantity, non-zero UnitPrice.
* Check if TotalPrice is derived from Quantity and Unitprice that is TotalPrice = Quantity × UnitPrice.

3\. **Data Validation (SQL)**

* Import cleaned data into MySQL.
* Run validation queries to check:
    Duplicate invoice lines
    Negative quantities or zero prices
    Customer spend consistency
    Outlier detection



## Features

* **Anomaly Detection:** Flags duplicates, cancellations, and invalid values.
* **Deduplication:** Ensures unique invoice and customer records.
* **Validation Queries:** SQL scripts for integrity checks and spend analysis.
* **Scalable Workflow:** Python + SQL pipeline that can be reused for other datasets.
* **Business Insights:** Clean data supports accurate reporting and dashboards.



# Data Source

The Dataset was sourced from Kaggle

https://www.kaggle.com/datasets/vijayuv/onlineretail

It is a messy data which needs cleaning and validation against business logic before going for reporting.



# Tools \& Technologies Used

Programming languages: Python, SQL

Libraries: Pandas, NumPy

Database: MySQL

Tools: Excel, Git



# Implementation Details

Scripts Python/cleandata.py and SQL/validation\_queries.sql

Before running the code make sure to add the path to the dataset file in python code.

```python

df = pd.read\_csv(r"path to the raw dataset file", encoding="ISO-8859-1")
```


# Results \& Insights

Dropped 135080 missing Customer ID

Removed 14137 cancellations

Found Duplicates of Invoiceno and Stockcode which were still there upon performing GROUP BY operation with CustomerID. After analysing data it looked like legitimate multi‑line purchases by business logic this is not duplicate so stored them as an aggregated view named as onlineretail\_aggregated for further analysis.



# Challenges Faced

The raw Online Retail dataset had lot of issues like:

While cleaning dataset using Python we found 1454 rows had missing values in Description column and 135080 Customer IDs where missing.

Ingesting a dataset into MySQL database with around 400k rows after cleaning was a bottleneck

Legitimate multi‑line purchases needed to be checked if it were error(duplicates) or not.



# Future Improvements

Handling different formats like JSON, Excel, XML etc

Creating a Dashboard for reporting.

