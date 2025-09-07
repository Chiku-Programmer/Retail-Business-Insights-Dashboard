
/*SQL acts as the brain between the raw data (Excel) and the visual insights (Power BI).

Scalability: SQL handles large volumes of data better than Excel.

Data Modeling: Joins across multiple tables (e.g., Sales, Store, Product) are easier in SQL.

Advanced Filtering & KPIs: SQL lets you create calculated fields, filter by time periods, customer segments, etc.

Reusability: You can save your queries and reuse them across tools.

*/
# SQL Analysis Guide

## 1. Total Revenue and Net Revenue
SELECT 
    SUM(Revenue) AS Total_Revenue, 
    SUM(Net_Revenue) AS Total_Net_Revenue 
FROM Sales;

## 2. Revenue by Product Category
SELECT 
    p.Category, 
    SUM(s.Net_Revenue) AS Revenue 
FROM Sales s
JOIN Products p ON s.Product_ID = p.Product_ID
GROUP BY p.Category;

## 3. Top 10 Products by Revenue
SELECT 
    p.Product_Name, 
    SUM(s.Net_Revenue) AS Revenue 
FROM Sales s
JOIN Products p ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Revenue DESC
LIMIT 10;

## 4. Store Performance
SELECT 
    Store_ID, 
    Region, 
    SUM(Net_Revenue) AS Store_Revenue 
FROM Sales
GROUP BY Store_ID, Region;

## 5. Revenue by Channel and Payment Mode
SELECT Channel, Payment_Mode, SUM(Net_Revenue) AS Revenue
FROM Sales
GROUP BY Channel, Payment_Mode;

## 6. Discount Analysis
SELECT 
    Discount_Percent, 
    COUNT(*) AS Num_Orders, 
    SUM(Revenue) AS Total_Revenue, 
    SUM(Discount_Amount) AS Discount_Given, 
    SUM(Net_Revenue) AS Net_Revenue 
FROM Sales
GROUP BY Discount_Percent;

## 7. Monthly Revenue Trend
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month, 
    SUM(Net_Revenue) AS Revenue 
FROM Sales
GROUP BY Month
ORDER BY Month;

## 8. Revenue by Region
SELECT Region, SUM(Net_Revenue) AS Revenue
FROM Sales
GROUP BY Region;

## 9. Customer Lifetime Value
SELECT 
    Customer_ID, 
    SUM(Net_Revenue) AS Total_Spent 
FROM Sales
GROUP BY Customer_ID
ORDER BY Total_Spent DESC;

## 10. Repeat Purchase Rate
SELECT 
    COUNT(DISTINCT Customer_ID) AS Total_Customers, 
    COUNT(Customer_ID) AS Total_Transactions, 
    ROUND(COUNT(Customer_ID) * 1.0 / COUNT(DISTINCT Customer_ID), 2) AS Avg_Transactions_Per_Customer 
FROM Sales;
