# Exploratory Analysis for UniMarket Sales Data

## Overview
This project focuses on analyzing UniMarket sales data to identify top-performing branches and products, as well as understanding sales trends and customer behavior. The goal is to uncover insights that can help optimize sales strategies. The sales dataset was obtained from the [Kaggle Walmart Sales Forecasting Competition](https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting) but then modified for me to practice SQL. The modified dataset consisted of sales transactions from six product lines in three UniMarket branches. All sales transactions occurred in October, November, and December 2023.

### Columns

| Column                   | Description                                     | Data Type        |
|--------------------------|-------------------------------------------------|------------------|
| `invoice_id`              | Invoice ID for the sales made                   | `VARCHAR(15)`    |
| `branch`                  | Branch where the sales occurred                 | `VARCHAR(5)`     |
| `city`                    | Location of the branch                          | `VARCHAR(15)`    |
| `customer_type`           | Type of customer                                | `VARCHAR(10)`    |
| `gender`                  | Gender of the purchasing customer               | `VARCHAR(10)`    |
| `product_line`            | Product line of the purchased item              | `VARCHAR(50)`   |
| `unit_price`              | Price per product                               | `DECIMAL(10, 2)` |
| `quantity`                | Quantity of product sold                        | `INT`            |
| `tax_pct`                 | Tax on the purchase                             | `FLOAT(6, 4)`    |
| `total`                   | Total cost of the purchase                      | `DECIMAL(12, 4)` |
| `date`                    | Date of the purchase                            | `DATE`           |
| `time`                    | Time of the purchase                            | `TIMESTAMP`      |
| `payment`                 | Method of payment                               | `VARCHAR(15)`    |
| `cogs`                    | Cost of Goods Sold                              | `DECIMAL(10, 2)` |
| `gross_margin_pct`        | Percentage of gross margin                      | `FLOAT(11, 9)`   |
| `gross_income`            | Gross income generated                          | `DECIMAL(12, 4)` |
| `rating`                  | Customer rating                                 | `FLOAT(2, 1)`    |

## Methods

### 1. Data Wrangling
> Perform an initial inspection of the data to detect missing or NULL values.
> Replace or remove NULL values during database creation by enforcing `NOT NULL` constraints.

### 2. Feature Engineering
> **`time_of_day`**: Categorize sales into Morning, Afternoon, and Evening to identify peak sales periods.
> **`day_name`**: Extract the day of the week (Mon, Tue, Wed, etc.) to determine when each branch is busiest.
> **`month_name`**: Extract the month (Jan, Feb, Mar, etc.) to analyze which months have the highest sales and profits.

### 3. Exploratory Data Analysis (EDA)
> Exploratory data analysis is conducted to answer key questions and meet the objectives of the project, providing deeper insights into sales performance and trends.

## Insights
### 1. Product Analysis
#### The Electronics & Clothing and Apparel are  the top-performing product lines. 
> Electronics generated the highest total sales at $62,889.78 with a gross income of $4,658.50 and an average customer rating of 7.11. It also ranks highest in quantity sold (952 units).
> Clothing and Apparel ranked second in generating the highest total sales of $60,728.29 and a gross income of $4,498.39. It also maintains a strong customer rating of 7.03.
#### The Health and Wellness product line needs improvement.
> While it generated a total sales of $54,807.82, there are rooms for major improvement in gross income and total sales. 

### 2. Sales Analysis
#### Peak Sales Time
> Most sales occured in the evening. This suggests that evening hours serve as a critical sales window, and sales strategies could be optimized around this peak period, such as increasing marketing efforts or staffing during these hours.
#### Busy Days by Branch
> I found different trends across different branches on weekdays:
> - West Branch: The busiest day of the week is Friday.
> - East Branch: Thursday marks the busiest sales day.
> - South Branch: Both Sunday and Thursday are noted as peak sales days.
These insights indicate that targeted promotions, inventory consideration, or special events could be more effectively aligned with these specific days to capitalize on peak sales periods.
#### Peak Profit Month
> The month of December generated the most profit across all three branches. This peak profit is highly likely a result of the holiday season to celebrate Christmas and new year. The UniMarket may benefit from maintaining robust marketing campaigns and stock levels during this month.

### 3. Customer Analysis
#### Customer Type
> ​Customers with memberships at UniMarket tend to buy slightly more often than their non-member counterparts.​ This trend suggests that membership programs may enhance customer loyalty and encourage higher purchasing frequency, making membership a potentially profitable avenue to explore further.

#### Peak Rating Time
> Examination of rating data reveals that the most ratings are provided by customers during the evening hours. This pattern implies that engagement, possibly due to more available time after work, allows customers to provide feedback on their shopping experiences. Businesses could leverage this insight by timing review requests to coincide with this peak period, thereby increasing the likelihood of receiving responses.

#### Best Days for Ratings
> On analyzing average ratings by day of the week, Wednesdays, Saturdays, and Sundays emerged as the days with the best average ratings. This indicates customer satisfaction may peak during mid-week and the weekend, possibly due to promotional activities, special events, or an overall more relaxed shopping environment on these days. UniMarket should consider running promotions or marketing campaigns strategically on these days to maximize customer interaction and satisfaction.

