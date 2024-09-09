# Exploratory Analysis for Meijer Sales Data

## Overview
This project focuses on analyzing Meijer sales data to identify top-performing branches and products, as well as understanding sales trends and customer behavior. The goal is to uncover insights that can help optimize sales strategies. The sales dataset originated from Kaggle.com but then modified for me to practice SQL. The modified dataset consisted of sales transactions from six product lines in three Meijer branches. All sales transactions occurred in October, November, and December 2023.

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
