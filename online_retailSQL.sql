SELECT Country,
       SUM(Quantity) AS TotalQuantity,
       COUNT(DISTINCT InvoiceNo) AS NumInvoices,
       MAX(DISTINCT CustomerID) AS Unique_CustomerID
FROM online_retail.retail_data
GROUP BY Country;


SELECT StockCode, Quantity UnitPrice, Country, Description
FROM online_retail.retail_data

-- Top selling products
SELECT 
    StockCode, 
    TRIM(LOWER(Description)) AS normalized_description,
    SUM(Quantity) AS total_quantity_sold
FROM 
    online_retail.retail_data
GROUP BY 
    StockCode, TRIM(LOWER(Description))
ORDER BY 
    total_quantity_sold DESC
LIMIT 10;