SELECT Country,
       SUM(Quantity) AS TotalQuantity,
       COUNT(DISTINCT InvoiceNo) AS NumInvoices,
       MAX(DISTINCT CustomerID) AS Unique_CustomerID
FROM online_retail.retail_data
GROUP BY Country;


SELECT StockCode, Description, Quantity, UnitPrice, Country
FROM online_retail.retail_data