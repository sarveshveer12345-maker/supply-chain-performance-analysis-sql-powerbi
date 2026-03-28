# Supply Chain Efficiency & Delivery Performance Analysis

## Project Overview

This project analyzes end-to-end supply chain operations to identify inefficiencies in inventory management, supplier performance, and logistics cost.

Using SQL for data analysis and Power BI for visualization, the project highlights key operational challenges and provides actionable insights to improve efficiency, reduce costs, and enhance overall supply chain performance.

---

## Business Context

In modern supply chain operations, businesses face challenges such as delivery delays, excess inventory, high transportation costs, and supplier inefficiencies.

Without proper analysis, these issues lead to increased operational costs, poor customer satisfaction, and lost revenue opportunities.

This project simulates a real-world business scenario where data-driven insights are used to optimize supply chain performance.

---

## Business Objectives

- Analyze overall business performance and revenue trends
- Evaluate supplier efficiency and reliability
- Identify inventory utilization and stock inefficiencies
- Assess logistics and transportation cost distribution
- Detect operational bottlenecks such as backorders
- Provide actionable recommendations to improve supply chain efficiency

---

## Dataset Preview

The dataset contains supply chain operational data including orders, inventory levels, suppliers, warehouses, and logistics costs across multiple regions and time periods.


![Dataset Preview](dataset_preview.png)



---

## Dataset Information

| Column Name           | Data Type | Description                                      | Business Relevance |
|----------------------|----------|--------------------------------------------------|--------------------|
| order_date           | Date     | Date when the order was placed                   | Used for trend analysis and time-based insights |
| region               | String   | Geographic region of the order                   | Helps identify high-performing markets |
| category             | String   | Product category                                | Used to analyze product-level performance |
| supplier             | String   | Supplier fulfilling the order                    | Evaluates supplier performance and reliability |
| warehouse            | String   | Warehouse handling the order                     | Helps assess warehouse efficiency |
| order_status         | String   | Status (Fulfilled, Pending, Canceled)            | Tracks fulfillment efficiency and operational gaps |
| units_sold           | Integer  | Number of units sold                             | Measures demand and sales volume |
| inventory_level      | Integer  | Current inventory level                          | Helps monitor stock availability |
| transportation_cost  | Decimal  | Cost incurred for logistics                      | Key metric for cost and profitability analysis |
| order_accuracy       | Boolean  | Indicates whether the order was accurate         | Measures operational accuracy and service quality |
| lead_time_days       | Integer  | Delivery lead time in days                       | Evaluates supplier and logistics efficiency |
| backorder            | Boolean  | Indicates whether the order was backordered      | Tracks supply shortages and demand mismatch |
| cogs                 | Decimal  | Cost of goods sold                              | Core metric for cost and profitability analysis |
| avg_inventory        | Decimal  | Average inventory maintained                     | Used to evaluate inventory efficiency |
| warehouse_capacity   | Integer  | Maximum storage capacity of warehouse            | Helps assess utilization and capacity planning |

---

## DAX Calculations






---

## SQL Analysis





---

## Dashboard Preview

![Business Performance Dashboard](https://raw.githubusercontent.com/sarveshveer12345-maker/supply-chain-performance-analysis-sql-powerbi/main/images/BusinessPerformancedashboard_overview.png)

---

## Tools Used

- SQL (MySQL) – Data extraction and analysis
- Power BI – Data visualization and dashboard creation
- Excel – Data cleaning and preprocessing

---

## Skills Demonstrated

- Data cleaning and preprocessing
- Data modeling and transformation
- Business problem solving
- Dashboard design and visualization
- Insight generation and storytelling

---

## SQL Skills Demonstrated
- Aggregations (SUM, AVG, COUNT)
- Grouping and filtering (GROUP BY, HAVING)
- Business-driven query design
- Performance-focused data analysis

---

## Data Workflow

1. Raw dataset collected and cleaned in Excel
2. Data imported into SQL database
3. SQL queries used to analyze business problems
4. Processed data connected to Power BI
5. Interactive dashboards created for visualization
6. Insights and recommendations derived from analysis

---

## Project Structure

supply-chain-analysis/
│
├── dataset/
│   └── supply_chain_inventory_dataset.xlsx
│
├── sql/
│   ├── schema.sql
│   └── supply_chain_analysis_queries.sql
│
├── powerbi/
│   └── supply_chain_dashboard.pbix
│
└── README.md

---

## Repository Structure

- dataset/ → Contains raw dataset used for analysis
- sql/ → SQL schema and business analysis queries
- powerbi/ → Power BI dashboard file
- README.md → Project documentation

---

## How to Use

1. Download the dataset from the /dataset folder
2. Import data into your SQL environment
3. Run queries from /sql/supply_chain_analysis_queries.sql
4. Open Power BI file to explore dashboards
5. Interact with filters to analyze different scenarios

---

## Conclusion

The analysis highlights key inefficiencies in supply chain operations, including supplier delays, underutilized warehouse capacity, and high transportation costs in certain regions.

By addressing these issues, businesses can improve operational efficiency, reduce costs, and enhance customer satisfaction.

This project demonstrates how data-driven decision-making can significantly optimize supply chain performance.

---

Author

Sarvesh Vernekar

Aspiring Data Analyst focused on transforming business data into actionable insights through analytics, visualization, and data-driven decision making.
