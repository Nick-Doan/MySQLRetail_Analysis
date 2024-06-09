
-- Country total quantity
SELECT 
	Country,
       SUM(Quantity) AS TotalQuantity,
       COUNT(DISTINCT InvoiceNo) AS NumInvoices,
       MAX(DISTINCT CustomerID) AS Unique_CustomerID
FROM 
	online_retail.retail_data
GROUP BY 
	Country;

-- exploratory
SELECT 
	StockCode,
	Quantity,
    UnitPrice,
	Country,
    Description
FROM 
	online_retail.retail_data

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

-- customer purchasing top 10
SELECT
	CustomerID,
    COUNT(DISTINCT StockCode) AS distinct_products,
    SUM(Quantity) AS total_quantity_purchased,
    SUM(Quantity * UnitPrice) AS total_spent
FROM 
	online_retail.retail_data
GROUP BY 
	CustomerID
ORDER BY
	total_spent DESC
LIMIT 10;

-- customer finder
SELECT
	CustomerID,
    StockCode, 
    Description, Quantity
FROM 
	online_retail.retail_data
WHERE
	CustomerID = 12346;


-- Stockcode 

SELECT
	StockCode, 
    Description
FROM 
	online_retail.retail_data
WHERE
	StockCode = '71053';

-- Stockcode with highest quantity of sales
SELECT 
	StockCode,
    SUM(Quantity * UnitPrice) as total_spent,
    Description
FROM
	online_retail.retail_data
GROUP BY
	StockCode, Description
ORDER BY
	total_spent DESC