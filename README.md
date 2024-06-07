
**Work in Progress**

This projects seeks to discover trends and patterns in the data to improve sales, investigate customer behavior, and customer demographics.


1.) Data was in a CSV format. Transformed the data from a CSV to SQL using the CSV Lint plugin in notepad++. The converted file was then ran to create the tables and insert the data.

Dataset source: https://archive.ics.uci.edu/dataset/352/online+retail

# Data Dictionary
| Variable Name | Role | Type | Description | Units | Missing Values |
| --- | --- | --- | --- | --- | --- |
| InvoiceNo | ID | Categorical | a 6-digit integral number uniquely assigned to each transaction | - | no |
| StockCode | ID | Categorical | a 5-digit integral number uniquely assigned to each distinct product | - | no |
| Description | Feature | Categorical | product name | - | no |
| Quantity | Feature | Integer | the quantities of each product (item) per transaction | - | no |
| InvoiceDate | Feature | Date | the day and time when each transaction was generated | - | no |
| UnitPrice | Feature | Continuous | product price per unit | sterling | no |
| CustomerID | Feature | Categorical | a 5-digit integral number uniquely assigned to each customer | - | no |
| Country | Feature | Categorical | the name of the country where each customer resides | - | no |
