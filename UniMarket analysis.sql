-- Create database
CREATE DATABASE IF NOT EXISTS UniMarketSales;

-- Use the database
USE UniMarketSales;

-- Create sales table and its column names
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(15) NOT NULL PRIMARY KEY,
    branch VARCHAR(1) NOT NULL,
    city VARCHAR(15) NOT NULL,
    customer_type VARCHAR(10) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

---------------------------------------------------------------------------------------------------
------------------------------------ Feature Engineering ------------------------------------------
-- Add the time_of_day column to the sales table
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(10);

-- Populate the time_of_day column with the appropriate values
UPDATE sales
SET time_of_day = 
    CASE
        WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;

-- Add day_name column
SELECT
	date,
	DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name= DAYNAME(date);

-- Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

---------------------------------------------------------------------------------------------------
------------------------------------ Exploratory Data Analysis ------------------------------------------
############# PRODUCT QUESTIONS  ######################################################
-- How many unique product lines does the data have, and what are they?
SELECT
	COUNT(DISTINCT product_line) AS distinct_product_line_count
FROM sales;

SELECT DISTINCT product_line
FROM sales;
-- Answer: There are data for 6 product lines at UniMarkets from the sales table, including automotive, clothing and apparel, electronics, groceries, health and wealness, and sports and outdoors.

-- What was the most common payment method used by the customers, and how many customers used that method?
SELECT payment,COUNT(payment)
FROM sales
GROUP BY payment;
-- Answer: the most common payment method is credit card, and 445 out of 995 customers used that.

-- Which product line sells the best, and how much revenue did it generate?
SELECT product_line,SUM(quantity) AS qnt,SUM(total) AS revenue
FROM sales
GROUP BY product_line
ORDER BY qnt DESC;
-- Answer: The best selling product line is Sports and Outdoors, and it generated a revenue of $60,590.

-- What is the average rating of each product line, and which product line has the worst average rating?
SELECT product_line, AVG (rating) AS average_rating
FROM sales
GROUP BY product_line
ORDER BY average_rating ASC;
-- Answer: The average rating of each product line is shown below. The Electronics product line has the worst average rating.
-- Electronics	        6.83750
-- Automotive	        6.85951
-- Sports and Outdoors	6.90651
-- Health and Wellness	6.98344
-- Clothing and Apparel	7.02921
-- Groceries        	7.11322

############# SALES QUESTIONS  ######################################################
-- At what time of the day were most quantity of sales made, and how many?
SELECT time_of_day, COUNT(quantity) AS sales_quantity
FROM sales
GROUP BY time_of_day
ORDER BY sales_quantity DESC;
-- Answer: Most sales were made in the evening, and 249 out of 815 items were sold in the evening.

-- Which day of the week had the most sales for each branch?
SELECT day_name, COUNT(day_name) AS count_of_day
FROM sales
WHERE branch ="West"
GROUP BY day_name
ORDER BY count_of_day DESC;

SELECT day_name, COUNT(day_name) AS count_of_day
FROM sales
WHERE branch ="East"
GROUP BY day_name
ORDER BY count_of_day DESC;

SELECT day_name, COUNT(day_name) AS count_of_day
FROM sales
WHERE branch ="South"
GROUP BY day_name
ORDER BY count_of_day DESC;
-- Answer: Friday was the busiest for the West branch, Thursday was the busiest for the East branch, and Sunday & Thursday was the busiest for the South branch.

-- At which month was the most profit generated?
SELECT month_name, SUM(gross_income) AS total_profit
FROM sales
GROUP BY month_name
ORDER BY total_profit DESC;
-- Answer: Most profit was generated in December, with a total profit of $9646.33.

-- Which product line has the highest cost of goods sold, and what is the gross income associated with that?
SELECT product_line, SUM(cogs) AS total_cost, SUM(gross_income) AS grossIncome
FROM sales
GROUP BY product_line
ORDER BY total_cost DESC;
-- Answer: Electronics product line has the highest cost of goods sold, and its gross income is $4658.50.

############# CUSTOMER QUESTIONS  ######################################################
-- What kind of customer bought the most?
SELECT
	customer_type,
    COUNT(*)
FROM sales
GROUP BY customer_type;
-- Answer: Customers with memberships at UniMarket bought slightly more often than those who're non-members. 

-- At what time of a day did customers give the most ratings per branch?
SELECT time_of_day, COUNT(rating) AS rating_count
FROM sales
GROUP BY time_of_day
ORDER BY rating_count DESC;
-- Answer: Customers gave the most ratings at evening.

-- Which day of the week has the best average ratings?
SELECT day_name, AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC;
-- Answer: Wendesdays, Saturdays, and Sundays were the days that had the best average ratings.