# E-commerce Sales & Customer Analytics | SQL + Power BI

## 📌 Project Overview

This project focuses on analyzing e-commerce sales, customer behavior, product performance, and operational metrics using **MySQL and Microsoft Power BI** to generate meaningful business insights and support data-driven decision-making.

The project follows an end-to-end analytics workflow, covering relational database design, data preparation, data quality validation, SQL-based business analysis, advanced SQL queries, reusable analytical views, query execution plan analysis, and Power BI dashboard development.

The **SQL analysis phase is complete**, including the creation of reusable SQL views, investigation of indexing strategies, execution plan analysis, and validation of business KPI results.

I am currently transitioning to the Power BI phase, where I am developing the data model and preparing to build an interactive business intelligence dashboard.

**Project Status:** SQL Analysis Completed | Power BI Development In Progress 🚧

**Tools & Technologies:** MySQL, SQL, Microsoft Power BI, DAX, Power Query, Git, GitHub

---

## 🎯 Business Objectives

The primary objectives of this project are to:

- Analyze overall sales performance and key business KPIs.
- Track monthly revenue trends and growth.
- Identify top-performing products and categories.
- Understand customer purchasing behavior and repeat purchases.
- Segment customers based on purchasing activity and value.
- Analyze order cancellations, returns, and delivery performance.
- Evaluate product-level revenue, gross profit, and gross profit margin.
- Investigate SQL query execution plans and indexing strategies.
- Develop an interactive Power BI dashboard for business reporting.
- Validate dashboard metrics against SQL calculations.

---

## 🔄 Project Workflow

### 1. Database Design and Data Preparation

- Designed a relational database for e-commerce analytics.
- Created database tables with appropriate data types.
- Defined primary keys and foreign-key relationships.
- Loaded synthetic datasets into MySQL.
- Performed data quality and relational consistency checks.

### 2. SQL Business Analysis

Performed SQL-based analysis to investigate business performance and customer behavior.

Key areas included:

- Overall sales and revenue analysis.
- Business KPI calculations.
- Customer purchasing activity.
- Product and category performance.
- Customer segmentation.
- Order operations and payment analysis.
- Returns and profitability analysis.

### 3. Advanced SQL Analysis

Applied SQL techniques to solve analytical and business-related problems.

Concepts explored include:

- Common Table Expressions (CTEs).
- Subqueries and correlated subqueries.
- Window functions.
- `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()`.
- `LEAD()` and `LAG()`.
- Month-over-month revenue analysis.
- Running totals and moving averages.
- Customer segmentation.
- Cohort retention analysis.
- Pareto analysis.

### 4. SQL Views, Indexing and Query Optimization

Completed the final stage of the SQL analysis workflow by creating reusable views, investigating query execution plans, exploring indexing strategies, and validating analytical results.

Key activities:

- Created reusable SQL views for business KPIs.
- Developed customer segmentation and product performance views.
- Analyzed product-level profitability.
- Inspected indexes using `SHOW INDEX`.
- Examined query execution plans using `EXPLAIN`.
- Explored `EXPLAIN ANALYZE` for query execution analysis.
- Investigated indexing opportunities on relevant columns.
- Compared analytical view results against independent SQL calculations.

### 5. Power BI Data Modeling and Dashboard Development

The project is now transitioning to Power BI.

Planned activities include:

- Connecting Power BI to the MySQL database.
- Organizing tables and establishing relationships.
- Creating a dedicated date table.
- Developing DAX measures for business KPIs.
- Using Power Query for data preparation where required.
- Designing interactive dashboards and report filters.
- Validating Power BI results against SQL calculations.
- Documenting business insights through visualizations.

---

## 🗄️ Database Schema

The project uses ten related tables to represent the main components of an e-commerce business.

| Table | Description |
|---|---|
| `customers` | Customer information and registration details |
| `categories` | Product category information |
| `suppliers` | Supplier information |
| `products` | Product details, pricing, costs, and stock information |
| `orders` | Order dates, statuses, and order-related information |
| `order_items` | Products, quantities, selling prices, and discounts |
| `payments` | Payment methods, amounts, and payment statuses |
| `shipments` | Shipment and delivery information |
| `returns` | Returned items, reasons, quantities, and refunds |
| `reviews` | Product ratings and review text |

The relational structure supports analysis across customers, orders, products, payments, shipments, returns, and reviews.

---

## 📊 Key Business Metrics

The project focuses on calculating and analyzing the following metrics.

| Metric | Purpose |
|---|---|
| Total Revenue | Measures sales generated |
| Total Orders | Measures order volume |
| Ordering Customers | Counts customers who placed orders |
| Total Units Sold | Measures product sales volume |
| Average Order Value (AOV) | Measures average value per order |
| Month-over-Month Revenue Growth | Evaluates changes in revenue over time |
| Repeat Customer Rate | Measures repeat purchasing behavior |
| Product Revenue Contribution | Identifies products contributing to revenue |
| Category Revenue Contribution | Evaluates category-level sales performance |
| Gross Profit | Measures revenue less the applicable product costs |
| Gross Profit Margin | Measures gross profit as a percentage of revenue |
| Return Rate | Evaluates the proportion of orders or items returned |
| Delivery Performance | Helps assess shipment and delivery operations |

Metric definitions and calculation rules will account for relevant order statuses, discounts, returns, refunds, and cost assumptions to maintain consistency between SQL and Power BI.

---

## 🧩 SQL Views and Query Optimization

As part of the final SQL analysis stage, I created reusable analytical views and investigated query execution behavior.

### 1. Business KPI View

**View:** `vw_business_kpis`

Organizes key business metrics into a reusable SQL view.

Metrics include:

- Total Revenue
- Total Orders
- Ordering Customers
- Total Quantity Sold
- Average Order Value (AOV)

### 2. Customer Segmentation View

**View:** `vw_customers_segments`

Summarizes customer purchasing activity, including revenue and order counts, and categorizes customers according to their order activity.

### 3. Product Performance View

**View:** `product_performance`

Analyzes product performance using:

- Product revenue.
- Units sold.
- Product rankings within categories.

### 4. Product Profitability View

**View:** `profitability_view`

Evaluates product-level financial performance using revenue, profit, and profit margin calculations.

### 5. Indexing and Execution Plan Analysis

Investigated how MySQL executes analytical queries involving filters and table joins.

SQL techniques used include:

- `SHOW INDEX`
- `CREATE INDEX`
- `EXPLAIN`
- `EXPLAIN ANALYZE`

Areas investigated:

- Index availability and selection.
- Query access types.
- Join execution plans.
- Estimated rows examined.
- Potential indexing opportunities.

### 6. SQL View Validation

Compared values returned by `vw_business_kpis` with independently calculated KPI results.

The displayed validation results matched across all five metrics, with a difference of `0.00` for each metric.

This step helped verify the consistency of the KPI calculations and reinforced the importance of validating analytical results.

**Note:** Indexing and query optimization were investigated as part of the project. Specific performance improvements will be documented only when supported by measured before-and-after execution results.

---

## 📈 Power BI Development

The Power BI phase focuses on transforming the analyzed data into an interactive reporting solution.

### Current Progress

- Connected Power BI to MySQL.
- Imported the required database tables and analytical views.
- Started working on the data model and table relationships.

### Next Steps

- Complete and validate table relationships.
- Create a dedicated date table for time-based analysis.
- Develop DAX measures for revenue, orders, customers, and profitability.
- Design interactive dashboard pages.
- Add slicers and filters for business analysis.
- Validate Power BI metrics against SQL results.
- Document insights using dashboard screenshots and explanations.

**Dashboard Status:** In Development 🚧

Dashboard screenshots and verified business findings will be added as development progresses.

---

## 📁 Repository Structure

The repository is organized to separate database setup, datasets, SQL analysis, optimization, and Power BI development.

```text
ecommerce-sales-customer-analytics/
│
├── README.md
│
├── 01_database_setup/
│
├── 02_data/
│
├── 03_data_validation/
│
├── 04_business_analysis/
│
├── 05_advanced_sql/
│
├── 06_views_optimization/
│   ├── 01_business_kpi_views.sql
│   ├── 02_customer_segmentation_view.sql
│   ├── 03_product_performance_view.sql
│   ├── 04_product_profitability_view.sql
│   ├── 05_index_check.sql
│   ├── 06_execution_plan_analysis.sql
│   ├── 07_query_optimization.sql
│   └── 08_validate_all_views.sql
│
├── 07_power_bi/
│   ├── README.md
│   └── screenshots/
│
└── docs/
```

*Note: This is the intended organizational structure. Directory names and example filenames should be adjusted to match the actual repository.*

---

## 📂 Dataset

This project uses **synthetic e-commerce data** generated for educational and analytical practice.

The datasets are organized into CSV files corresponding to the ten database tables.

The data is designed to support relational analysis using primary keys, foreign keys, and joins.

The records do not represent actual customers, companies, or transactions.

---

## ✅ Current Project Progress

### Database and Data Preparation

- [x] Database and table creation
- [x] Synthetic dataset loading
- [x] Data quality validation
- [x] Relational consistency checks

### SQL Analysis

- [x] Business KPI calculations
- [x] Sales and revenue analysis
- [x] Customer and product analysis
- [x] Advanced analytical SQL practice
- [x] Reusable SQL views
- [x] Index investigation
- [x] Query execution plan analysis
- [x] SQL view and KPI validation

### Power BI Development

- [x] Connect Power BI to MySQL
- [ ] Complete data model and table relationships
- [ ] Create a dedicated date table
- [ ] Develop DAX measures
- [ ] Build interactive dashboards
- [ ] Validate dashboard metrics against SQL calculations

### Project Finalization

- [ ] Document verified business insights
- [ ] Add Power BI dashboard screenshots
- [ ] Finalize project documentation
- [ ] Publish the completed project

*The checklist reflects the current project stage; advanced SQL topics should be marked complete only where the corresponding work has been implemented and verified.*

---

## 💡 Business Insights

The project aims to identify actionable insights related to sales performance, customer behavior, product contribution, profitability, and order operations.

Verified business findings will be documented here as the SQL results are translated into Power BI visualizations.

Potential areas of investigation include:

- Revenue trends and changes over time.
- Products and categories contributing the most revenue.
- Customer purchasing frequency and repeat behavior.
- Product profitability and margin differences.
- Return patterns and delivery performance.

Specific findings will be added after reviewing and validating the actual analytical results.

---

## 🎯 Project Goal

The goal of this project is to demonstrate practical SQL and Power BI skills through an end-to-end analytics workflow.

By combining relational database design, SQL business analysis, analytical views, query execution plan investigation, data validation, and interactive Power BI reporting, the project demonstrates how structured data can be transformed into meaningful business metrics and actionable insights.

The final objective is to build a reliable, interactive reporting solution that helps stakeholders understand business performance and make data-informed decisions.

---

## 👨‍💻 Author

**Ritesh Zadke**

Aspiring Data Analyst focused on SQL, MySQL, Power BI, business analytics, and data-driven decision-making.