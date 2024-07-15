
-- Country total quantity
SELECT 
	Country,
       SUM(Quantity) AS TotalQuantity,
       AVG(Quantity) AS AVGQuantity,
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
    Description,
    
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
    
-- Monthy Sales

SELECT
	Date_Format(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'), '%Y-%m-01') AS Month,
	SUM(Quantity * UnitPrice) AS Monthly_Sales
FROM
	online_retail.retail_data
GROUP BY
	Date_Format(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'), '%Y-%m-01')
ORDER BY
	Month;

-- Quantity and Product

SELECT
	Description, COUNT(Description) as Quantity_Count
FROM
	online_retail.retail_data
GROUP BY
	Description
ORDER BY
	COUNT(Description) DESC;

-- Best Sales days

SELECT 
    EXTRACT(MONTH FROM STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS InvoiceMonth,
    EXTRACT(DAY FROM STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS InvoiceDay,
    EXTRACT(HOUR FROM STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS InvoiceHour,
    Description,
    COUNT(*) AS Quantity_Count
FROM 
    online_retail.retail_data
GROUP BY 
    InvoiceMonth, InvoiceDay, InvoiceHour, Description
ORDER BY 
    Quantity_Count DESC
LIMIT 10;




