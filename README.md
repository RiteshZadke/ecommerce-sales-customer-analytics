# E-commerce Sales & Customer Analytics | SQL + Power BI

## Project Overview

This project focuses on analyzing e-commerce sales and customer data using **MySQL and Microsoft Power BI** to generate business insights and support data-driven decision-making.

The project follows an end-to-end analytics workflow, starting with database design and data validation, followed by SQL-based business analysis and interactive Power BI dashboard development.

**Project Status:** In Progress 🚧

**Tools:** MySQL, SQL, Microsoft Power BI, DAX, Power Query, Git, GitHub

## Business Objectives

- Analyze overall sales performance and key business KPIs.
- Track monthly revenue trends and growth.
- Identify top-performing products and categories.
- Understand customer purchasing behavior and repeat purchases.
- Segment customers based on purchasing activity and value.
- Analyze order cancellations, returns, and delivery performance.
- Evaluate product-level gross profit and gross profit margin.
- Build an interactive Power BI dashboard for business reporting.

## Project Workflow

### 1. Database Design and Data Preparation

- Create a relational database and define table structures.
- Establish primary keys, foreign keys, and appropriate data types.
- Load the datasets into MySQL.
- Validate data quality and relational consistency.

### 2. SQL Business Analysis

- Calculate executive business KPIs.
- Analyze sales and revenue trends.
- Evaluate customer and product performance.
- Investigate order operations, returns, and profitability.

### 3. Advanced SQL Analysis

- Common Table Expressions (CTEs)
- Window functions and ranking
- Month-over-month growth
- Running totals and moving averages
- Customer RFM segmentation
- Cohort retention analysis
- Pareto analysis

### 4. SQL Views and Optimization

- Create reusable analytical views.
- Investigate indexes and query execution plans.
- Evaluate query performance and optimization opportunities.

### 5. Power BI Dashboard

- Connect Power BI to the MySQL database.
- Build a data model and define table relationships.
- Create DAX measures and business KPIs.
- Develop interactive dashboards and report filters.
- Validate dashboard results against SQL calculations.

## Database Schema

The project uses ten related tables:

| Table       | Description                                         |
| ----------- | --------------------------------------------------- |
| customers   | Customer information and registration details       |
| categories  | Product categories                                  |
| suppliers   | Supplier information                                |
| products    | Product details, pricing, costs, and stock          |
| orders      | Order dates, statuses, and shipping details         |
| order_items | Products, quantities, selling prices, and discounts |
| payments    | Payment methods, amounts, and statuses              |
| shipments   | Shipment and delivery information                   |
| returns     | Returned items, reasons, quantities, and refunds    |
| reviews     | Product ratings and review text                     |

## Key Business Metrics

- Total Revenue
- Total Orders
- Total Active Customers
- Total Units Sold
- Average Order Value (AOV)
- Month-over-Month Revenue Growth
- Repeat Customer Rate
- Product and Category Revenue Contribution
- Gross Profit and Gross Profit Margin
- Return Rate and Delivery Performance

Metric definitions, discount treatment, order statuses, returns, and refunds will be documented to ensure consistent interpretation.

## Repository Structure

```text
ecommerce-sales-customer-analytics/
│
├── README.md
├── 01_database_setup/
├── 02_data/
├── 03_data_validation/
├── 04_business_analysis/
├── 05_advanced_sql/
├── 06_views_optimization/
├── 07_power_bi/
└── docs/
```

## Dataset

The project uses synthetic e-commerce data generated for analytics practice. The records do not represent actual customers, companies, or transactions.

The datasets are organized into separate CSV files corresponding to the ten database tables. Foreign-key relationships are designed to support relational SQL analysis.

## Current Progress

- [x] Database and table creation
- [x] Dataset loading
- [x] Data quality validation
- [ ] Business KPI analysis
- [ ] Sales and customer analytics
- [ ] Product and profitability analysis
- [ ] Advanced SQL analysis
- [ ] SQL views and query optimization
- [ ] Power BI data modeling and DAX
- [ ] Interactive dashboard development
- [ ] Final documentation and business insights

## Business Insights

Verified business findings, SQL query outputs, and Power BI dashboard screenshots will be added as the project progresses.

## Project Goal

The goal is to demonstrate practical SQL and Power BI skills by transforming structured e-commerce data into meaningful business metrics, actionable insights, and an interactive reporting solution.
