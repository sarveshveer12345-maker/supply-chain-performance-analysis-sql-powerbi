# Supply Chain Efficiency & Delivery Performance Analysis


## Project Overview

This project analyzes end-to-end supply chain operations to identify inefficiencies in inventory management, supplier performance, and logistics cost.

Using SQL for data analysis and Power BI for visualization, the project highlights key operational challenges and provides actionable insights to improve efficiency, reduce costs, and enhance overall supply chain performance.


---

## Executive Summary

This project analyzes supply chain operations with total revenue of $71.24M and 641K units sold to identify inefficiencies across suppliers, inventory, and logistics.

Key findings show:

- 30% of orders are not fulfilled (pending + canceled), indicating operational gaps
- Inventory utilization is only 34%, showing significant underutilization of warehouse capacity
- Transportation cost of $9.27M is concentrated in key regions, impacting profitability

These insights provide a clear direction to improve fulfillment efficiency, optimize inventory utilization, and reduce logistics costs, ultimately enhancing overall supply chain performance and profitability.

---

## Business Context

In modern supply chain operations, businesses face challenges such as delivery delays, excess inventory, high transportation costs, and supplier inefficiencies.

Without proper analysis, these issues lead to increased operational costs, poor customer satisfaction, and lost revenue opportunities.

This project analyzes supply chain operations to identify inefficiencies in inventory, supplier performance, and logistics cost.


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


## Dataset Information

| Column Name           | Data Type | Description                                      | Business Relevance |
|----------------------|----------|--------------------------------------------------|--------------------|
| order_date           | Date     | Date when the order was placed                   | Trend analysis and time-based insights |
| region               | String   | Geographic region of the order                   | Identifies high-performing markets |
| category             | String   | Product category                                 | Analyzes product-level performance |
| supplier             | String   | Supplier fulfilling the order                    | Evaluates supplier performance and reliability |
| warehouse            | String   | Warehouse handling the order                     | Assesses warehouse efficiency |
| order_status         | String   | Status (Fulfilled, Pending, Canceled)            | Tracks fulfillment efficiency and operational gaps |
| units_sold           | Integer  | Number of units sold                             | Measures demand and sales volume |
| inventory_level      | Integer  | Current inventory level                          | Monitors stock availability |
| transportation_cost  | Decimal  | Cost incurred for logistics                      | Key metric for cost and profitability analysis |
| order_accuracy       | Boolean  | Indicates whether the order was accurate         | Measures operational accuracy and service quality |
| lead_time_days       | Integer  | Delivery lead time in days                       | Evaluates supplier and logistics efficiency |
| backorder            | Boolean  | Indicates whether the order was backordered      | Tracks supply shortages and demand mismatch |
| cogs                 | Decimal  | Cost of goods sold                               | Core metric for cost and profitability analysis |
| avg_inventory        | Decimal  | Average inventory maintained                     | Evaluates inventory efficiency |
| warehouse_capacity   | Integer  | Maximum storage capacity of warehouse            | Assesses utilization and capacity planning |

---


## DAX Calculations

- Total Revenue = SUM(inventory_operations[Cost of Goods Sold (COGS)])

- Total Units Sold = SUM(inventory_operations[units_sold])

- Orders Fufilled = 
CALCULATE(
    COUNTROWS(inventory_operations),
    inventory_operations[order_status] = "Fulfilled"
)

- Orders Canceled = 
CALCULATE(
    COUNTROWS(inventory_operations),
    inventory_operations[order_status] = "canceled"
)

- Orders Pending = 
CALCULATE(
    COUNTROWS(inventory_operations),
    inventory_operations[order_status] = "pending"
)

- Avg Order Accuracy % = 
AVERAGEX(
    inventory_operations,
    IF(inventory_operations[order_accuracy] = TRUE(), 1, 0)
)

- Avg Lead Time = AVERAGE(inventory_operations[lead_time (days)])

- Accurate Orders = 
CALCULATE(
    COUNTROWS(inventory_operations),
    inventory_operations[order_accuracy] = TRUE()
)

- Backorders = 
CALCULATE(
    COUNTROWS(inventory_operations),
    inventory_operations[backorder] = TRUE()
)

- Inventory Utilization % = 
DIVIDE(
    AVERAGE(inventory_operations[inventory_level]),
    AVERAGE(inventory_operations[warehouse_capacity])
) * 100



---



# SQL Analysis



**1. Overall Sales Performance**

Business Question: What is the overall sales performance in terms of revenue and units sold?

- **Total units sold: 640671**

- **Total revenue generated: 71244576.02092892**

Key Insight: Total revenue reached **$71.24M** with **641K** units sold, indicating strong demand across the supply chain, but with underlying operational inefficiencies affecting fulfillment and cost control.

Business Recommendation: Scale high-performing segments by increasing inventory allocation and aligning supply with demand patterns in top-performing categories and regions.

---

**2. Region-wise Performance**

Business Question: Which regions contribute the most to overall revenue?

- **Region : North**

- **Total units : 170175**

- **Revenue : 20347653.809619017**

Key Insight: **North** region generated $20.34M in revenue, indicating strong regional demand concentration and potential dependency on specific markets.

Business Recommendation: Strengthen operations in high-performing regions while improving strategies in low-performing areas.

---

**3. Category-wise Sales**

Business Question: Which product categories drive most sales?

- **Category : Electronics**

- **Units Sold : 168532**

- **Revenue : 19207238.505421996**

Key Insight: Electronics generated $19.2M in revenue, making it the leading category and a key driver of overall business performance.

Business Recommendation: Promote high-performing categories and optimize inventory for low-performing ones.

---

**4. Supplier Performance (Sales Contribution)**

Business Question: Which suppliers contribute the most to total sales?

- **Supplier : Supplier B**

- **Total units : 163023**

- **Revenue: 18637446.131990995**

Key Insight: Supplier contribution is balanced, reducing dependency risk on a single supplier. Supplier B contributes the most to total sales.

Business Recommendation: Maintain strong relationships with top-performing suppliers while evaluating underperformers.

---

**5. Order Status Distribution**

Business Question: What is the distribution of orders status?

- **Fulfilled : 838**

- **Canceled : 114**

- **Pending : 248**

Key Insight: While most orders are **fulfilled**, Out of total orders, 30% (pending + canceled) remain unfulfilled, indicating significant inefficiencies in order processing and fulfillment operations.

Business Recommendation: Improve order processing and fulfillment systems to reduce pending and canceled orders.

---

**6. Average Lead Time by Supplier**

Business Question: Which suppliers have the highest delivery lead time?

- **Supplier : Supplier B**

- **Avg Lead Time : 16.1710**

Key Insight: Supplier B has longer lead times, impacting overall delivery efficiency.

Business Recommendation: Prioritize faster suppliers and work with slow suppliers to improve delivery timelines.

---

**7. Inventory Utilization**

Business Question: How efficiently are warehouses utilizing their capacity?

 **Warehouse 1**	

- **Avg Inventory level : 2498.7221**	

- **Capacity : 7403.5931**	

- **Utilization % : 33.75012736**



 **Warehouse 2**	

- **Avg Inventory level : 2614.6142**	

- **Capacity : 7447.2310**

- **Utilization % : 35.10854203**



 **Warehouse 3**	

- **Avg Inventory level : 2479.9628**	

- **Capacity : 7427.1489**	

- **Utilization % : 33.39050850**

Key Insight: Warehouse capacity is underutilized, indicating inefficient inventory distribution.

Business Recommendation: Optimize inventory allocation to improve utilization and reduce storage costs.


---

**8. Transportation Cost Analysis**

Business Question: Which regions incur the highest transportation costs?

- **North : 2498742.9209636007**

Key Insight: **North** region incurred $2.49M in transportation costs, indicating high logistics dependency and increased operational expenses in key demand regions.

Business Recommendation: Optimize logistics routes and distribution strategies to reduce transportation costs.


**SQL Analysis Note**

Additional SQL queries for warehouse performance, cost efficiency, and inventory trends are available in the /sql folder.

---

## Business Performance Overview


![Business Performance Dashboard Overview](business_performance_dashboard_overview.png)



## Key Performance Indicators

- Total revenue - 71.24M
- Total units sold - 641K
- Orders fulfilled - 838
- Orders cancelled - 114
- Orders pending - 248



## Dashboard Features

- High-level KPI summary (Revenue, Units Sold, Orders) 
- Revenue trend analysis 
- Regional performance comparison 
- Category-wise revenue contribution
- Revenue Contribution by warehouse
- Interactive date filter



## Business Questions

- What is the overall business performance? 
- How has revenue changed over time? 
- Which regions contribute the most to revenue? 
- Which product categories drive the most revenue?
- Which warehouse contribute the most to revenue?



## Key Insights 

- 70% of orders are fulfilled, but 30% of orders (pending + canceled) indicate significant inefficiencies in order fulfillment and operational processes.
- Revenue peaked during 2022–2023, indicating strong demand growth, followed by fluctuations that suggest potential instability in demand or operational   execution.
- North ($20.3M) and West ($19.1M) regions dominate revenue, indicating heavy geographic concentration and potential dependency risk.  
- Electronics contributes the highest revenue ($19.2M), establishing it as a primary revenue driver within the product portfolio .
- Warehouse 1 generates $25.1M (35.5%) of total revenue, indicating uneven distribution of operational load across warehouses.



## Business Recommendations

- Improve order fulfillment by reducing pending and canceled orders through better inventory planning and faster processing workflows.
- Analyze the factors behind the post-2023 fluctuation and implement demand forecasting and seasonal planning to stabilize revenue growth.
- Reduce geographic dependency by scaling underperforming regions while maintaining strong performance in North and West.
- Prioritize high-performing categories like Electronics through targeted inventory allocation and demand-based planning.
- Rebalance warehouse operations by optimizing inventory distribution and reducing over-reliance on Warehouse 1.



---


## Supplier Performance



![Supplier Analysis](supplier_analysis.png)



## Key Performance Indicators

- Avg order accuracy% - 91.33%
- Avg lead time - 15.74 days
- Accurate orders - 1096
- Backorders - 116



## Dashboard Features

- Supplier-wise revenue contribution 
- Transportation cost comparison 
- Order fulfillment distribution 
- Backorder analysis 
- Order accuracy tracking
  


## Business Questions

- Which suppliers contribute the most to revenue?
- Which suppliers have the maximum Transportation cost? 
- What factor is causing delays or inefficiencies? 
- How accurate are supplier deliveries? 
- Which suppliers generate the most backorders?
- Which suppliers contribute the most to successfully fulfilled orders?
- Which suppliers maintain the highest order accuracy? 



## Key Insights

- Revenue contribution is relatively balanced across suppliers, reducing over-dependency risk but limiting opportunities for strategic scaling.
- Supplier B, A, and C incur the highest transportation costs, directly impacting profitability and operational efficiency.  
- Average lead time is 15.74 days, indicating moderate delays that affect delivery performance and customer satisfaction 
- Order accuracy stands at 91.33%, indicating strong performance but still leaving room for improvement in operational precision.
- Supplier D accounts for 31.9% of backorders, highlighting supply-demand mismatch and reliability concerns.
- Supplier D also contributes 27.21% of fulfilled orders, indicating high operational dependency despite inefficiencies.
- Supplier A maintains the highest order accuracy but certain suppliers show lower accuracy levels, indicating quality or process gaps in order handling



## Business Recommendations

- Maintain a diversified supplier base to reduce dependency risk, while identifying opportunities to scale high-performing suppliers for better revenue growth.
- Re-evaluate contracts and logistics strategies for high-cost suppliers (Supplier B, A & C) to reduce transportation expenses and improve profitability.
- Optimize supplier lead times by improving coordination, and prioritizing suppliers with faster delivery performance.
- Implement standardized quality checks and monitoring systems to improve overall accuracy and minimize operational errors.
- Address supply gaps with Supplier D by improving demand forecasting, inventory planning, or considering alternative suppliers to reduce backorders.
- Reduce dependency risk by distributing order volume more evenly across suppliers.
- Leverage best practices from Supplier A and apply them across other suppliers to improve consistency and overall delivery quality.


  
---


## Inventory Analysis



![Inventory Analysis](inventory_analysis.png)



## Key Performance Indicators

- Total warehouse capacity - 8.91M
- Total inventory level - 3.04M
- Inventory Utilization% - 34.08%



## Dashboard Features

- Inventory levels across regions
- Inventory levels across suppliers
- Warehouse capacity comparison 
- Warehouse-level order fulfillment 
- Year-wise filtering capability



## Business Questions

- Are warehouses being efficiently utilized? 
- Which regions hold the most inventory? 
- Is there overstocking or underutilization? 
- How is inventory distributed across suppliers? 
- Which warehouses perform best operationally?



## Key Insights

- Total inventory stands at 3.04M against capacity of 8.91M, resulting in only 34.08% utilization, indicating significant underutilization of warehouse capacity. 
- North and West regions hold the highest inventory levels, indicating potential imbalance in stock distribution.
- Low utilization suggests inefficient inventory allocation and excess idle capacity.
- Inventory distribution across suppliers is relatively balanced, reducing supplier dependency risk. 
- Warehouse performance is consistent across all locations, but lacks optimization for maximum efficiency.



## Business Recommendations

- Optimize inventory allocation across warehouses to improve utilization and reduce idle capacity, lowering storage and operational costs.
- Rebalance stock from high-inventory regions to lower-demand areas to improve distribution efficiency.
- Implement demand-driven inventory planning and forecasting models to avoid excess stock and improve overall inventory efficiency.
- Maintain balanced supplier distribution while continuously monitoring supplier performance to prevent future supply concentration risks.
- Standardize operational processes across all warehouses and introduce performance benchmarks to further improve efficiency and scalability.



---



## Logistics & Cost



![Logistics Analysis](logistics_analysis.png)



## Key Performance Indicator

- Total transportation cost - 9.27M
   


## Dashboard Features
 
- Transportation cost trend 
- Region-wise logistics cost analysis 
- Supplier-wise logistics cost comparison 
- Transportation cost distribution by Warehouse
- Category-level transportation cost 



## Business Questions

- How has transportation cost changed over time? 
- How are transportation costs distributed across regions? 
- Which suppliers incur the highest logistics costs? 
- Which warehouses are cost-intensive? 
- Which product categories drive logistics costs?



## Key Insights

- Total transportation cost reached $9.27M, indicating a significant cost component impacting overall profitability.
- Transportation costs have increased since 2022, highlighting rising logistics expenses and potential inefficiencies.
- North and West regions contribute the majority of logistics costs, aligning with high demand but increasing cost pressure.
- Supplier B and A incur the highest logistics costs, making them the most expensive suppliers operationally. 
- Transportation costs are relatively evenly distributed across warehouses, with minor efficiency variations.
- Electronics category drives higher logistics costs due to higher volume and delivery requirements. 



## Business Recommendations

- Implement cost optimization strategies such as route optimization and bulk shipping to reduce logistics expenses.
- Optimize regional distribution networks by relocating inventory closer to demand centers to reduce shipping distance and cost.
- Re-negotiate contracts or evaluate alternative suppliers to reduce high logistics costs associated with Supplier B and A.
- Standardize efficient logistics practices across warehouses to reduce cost variations.
- Optimize packaging, shipping methods, and inventory placement for high-cost categories to reduce transportation expenses.

---

## Business Impact

- Identified 30% order drop-off, directly impacting revenue realization and customer satisfaction.
- Highlighted low inventory utilization (34%), indicating inefficient capital allocation and excess storage cost.
- Revealed high logistics cost ($9.27M), reducing overall profitability.
- Identified supplier inefficiencies (lead time 15.7 days, high backorders), impacting delivery performance and reliability.

---

## Conclusion

The analysis reveals that while the supply chain generates strong revenue ($71.24M), operational inefficiencies across order fulfillment, inventory utilization, and logistics cost significantly impact performance.

Addressing these gaps through better demand forecasting, supplier optimization, and logistics planning can improve efficiency, reduce costs, and enhance overall supply chain effectiveness.

---

## Next Steps / Future Analysis

- Perform supplier-level profitability analysis to identify cost vs revenue contribution
- Build demand forecasting models to improve inventory planning and reduce stock inefficiencies
- Analyze customer delivery timelines to improve service-level performance
- Conduct root cause analysis on order cancellations and backorders
- Optimize warehouse allocation using demand clustering techniques

---

## Tools Used

- Excel – Data cleaning and preprocessing
- SQL (MySQL) – Data extraction and analysis
- Power BI – Data visualization and dashboard creation

---


## Skills Demonstrated

- Data cleaning and preprocessing
- Business problem solving
- Dashboard design and visualization
- Insight generation and storytelling


---


## SQL Skills Demonstrated
- Aggregations (SUM, AVG, COUNT)
- Grouping and filtering (GROUP BY, ORDER BY)
- Business-driven query design
- Performance-focused data analysis


---


## Data Workflow

1. Raw dataset collected and cleaned in Excel
2. Data imported into SQL database
3. SQL queries used to analyze business problems
4. Interactive dashboards created for visualization
5. Insights and recommendations derived from analysis


---

## Project Structure

supply-chain-performance-analysis-sql-powerbi/
│
├── dataset/
│   └── supply_chain_dataset.xlsx
│
├── sql/
│   └── supply_chain_analysis_queries.sql
│
├── powerbi/
│   └── supply_chain_dashboard.pbix
│
├── images/
│   ├── dataset_preview.png
│   ├── business_performance_dashboard_overview.png
│   ├── supplier_analysis.png
│   ├── inventory_analysis.png
│   └── logistics_analysis.png
│
└── README.md


---


## Repository Structure

**dataset** - supply_chain_dataset.xlsx  
Contains cleaned dataset used for supply chain analysis  

**sql** - supply_chain_analysis.sql  
Includes SQL queries for data exploration, KPI calculations, and business analysis  

**powerbi** - supply_chain_dashboard.pbix  
Contains the Power BI dashboard file with all visualizations  

**images** - dataset_preview.png, business_performance_dashboard_overview.png, supplier_analysis.png, inventory_analysis.png, logistics_analysis.png  
Stores dataset preview and dashboard screenshots used in the README  

**README.md**  
Complete project documentation including business context, SQL insights, dashboards, and recommendations  


---


## How to Use

1. Download the dataset from the /dataset folder
2. Import data into your SQL environment
3. Run queries from /sql/supply_chain_analysis_queries.sql
4. Open Power BI file to explore dashboards
5. Interact with filters to analyze different scenarios



---


Author

Sarvesh Vernekar

Aspiring Data Analyst focused on transforming business data into actionable insights through analytics, visualization, and data-driven decision making.
