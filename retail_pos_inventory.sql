select * from retail_pos_inventory_loss_dataset;

##Overall Profitability Analysis##
SELECT 
    SUM(Revenue) AS total_revenue,
    SUM(COGS) AS total_cogs,
    SUM(Return_Loss) AS total_return_loss,
    SUM(Shrinkage_Loss) AS total_shrinkage_loss,
    SUM(Profit) AS total_profit
FROM retail_pos_inventory_loss_dataset;

##Profit Trend Over Time##
SELECT 
    DATE_FORMAT(Date, '%Y-%m-01') AS month, 
    SUM(Revenue) AS total_revenue, 
    SUM(COGS) AS total_cogs, 
    SUM(Profit) AS total_profit 
FROM retail_pos_inventory_loss_dataset 
GROUP BY month 
ORDER BY month 
LIMIT 1000;

##Inventory Purchases vs Sales##
SELECT
    Product_Category,
    SUM(Inventory_Purchased_Units) AS total_inventory_purchased,
    SUM(Units_Sold) AS total_units_sold
FROM retail_pos_inventory_loss_dataset
GROUP BY Product_Category
ORDER BY total_inventory_purchased DESC;

##Category Profitability##
SELECT 
    Product_Category,
    SUM(Revenue) AS revenue,
    SUM(COGS) AS cogs,
    SUM(Profit) AS total_profit
FROM retail_pos_inventory_loss_dataset
GROUP BY Product_Category
ORDER BY total_profit ASC;

##Supplier Cost Impact##
SELECT
    Supplier,
    AVG(Unit_Cost) AS avg_unit_cost,
    SUM(Profit) AS total_profit
FROM retail_pos_inventory_loss_dataset
GROUP BY Supplier
ORDER BY avg_unit_cost DESC;

##Discount Impact on Profit##
SELECT
    Discount_Applied,
    SUM(Revenue) AS total_revenue,
    SUM(Profit) AS total_profit
FROM retail_pos_inventory_loss_dataset
GROUP BY Discount_Applied
ORDER BY Discount_Applied DESC;

##Return Rate Analysis##
SELECT
    Product_Category,
    SUM(Returned_Units) AS total_returns,
    SUM(Units_Sold) AS total_sales,
    (SUM(Returned_Units)*100.0 / SUM(Units_Sold)) AS return_rate
FROM retail_pos_inventory_loss_dataset
GROUP BY Product_Category
ORDER BY return_rate DESC;

##Shrinkage (Theft/Damage) Analysis##
SELECT
    Store_ID,
    SUM(Shrinkage_Units) AS total_shrinkage_units,
    SUM(Shrinkage_Loss) AS shrinkage_loss
FROM retail_pos_inventory_loss_dataset
GROUP BY Store_ID
ORDER BY shrinkage_loss DESC;

##Inventory Purchase Cost Impact##
SELECT 
    DATE_FORMAT(Date, '%Y-%m-01') AS month, 
    SUM(Revenue) AS total_revenue, 
    SUM(COGS) AS total_cogs, 
    SUM(Profit) AS total_profit 
FROM retail_pos_inventory_loss_dataset 
GROUP BY month 
ORDER BY month 
LIMIT 1000;

##Profit Margin Calculation##
SELECT
    Product_Category,
    SUM(Revenue) AS revenue,
    SUM(Profit) AS profit,
    (SUM(Profit) / SUM(Revenue)) * 100 AS profit_margin
FROM retail_pos_inventory_loss_dataset
GROUP BY Product_Category
ORDER BY profit_margin ASC;

##Top Loss-Making Transactions##
SELECT
    Transaction_ID,
    Store_ID,
    Product_Category,
    Revenue,
    COGS,
    Profit
FROM retail_pos_inventory_loss_dataset
ORDER BY Profit ASC
LIMIT 10;

##Inventory Turnover Indicator##
SELECT
    Product_Category,
    SUM(Units_Sold) AS total_sales,
    SUM(Inventory_Purchased_Units) AS total_inventory
FROM retail_pos_inventory_loss_dataset
GROUP BY Product_Category
ORDER BY total_inventory DESC;

