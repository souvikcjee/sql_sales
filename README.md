# Sales Analytics Using SQL

This project explores a retail sales dataset and answers business-driven analytical questions using SQL.  
The dataset includes information about customers, orders, products, shipping modes, and financial metrics such as sales, profit, and discount.

## 📂 Database Tables Used

- **sales**
- **customer**
- **product**

These tables were joined where necessary using keys like `customer_id` and `product_id`.

---

## 🎯 Objectives

The project focuses on analyzing:

- Revenue performance across regions, products, and time
- Profitability trends and discount impact
- Customer segmentation and ranking
- Product performance within categories
- Shipping behavior and operational metrics

---

## 🧠 Key Business Questions Answered

Below are the types of questions explored through SQL:

### **1. Total sales by region**
Identify high-performing geographic markets.

### **2. Top-selling products**
Determine which products drive revenue.

### **3. Discount vs profit**
Evaluate whether discounts hurt profitability.

### **4. Sales by customer segment**
Understand B2B vs B2C contributions.

### **5. Category-level performance**
Prioritize product categories.

### **6. Shipment mode distribution**
Assess operational preferences and cost drivers.

### **7. Monthly sales**
Expose seasonality or time-based trends.

### **8. Customer distribution by state**
Useful for marketing and expansion decisions.

### **9. Top customers by sales**
Support loyalty programs and targeted retention.

### **10. Sub-category analysis**
More granular product insight for merchandising.

### **11. Rank products within a category**
Using window functions for competitive benchmarking.

### **12. Running total of sales (per product)**
Monitor performance evolution over time.

### **13. Region-wise top customers by profit**
Identify high-value relationships in each region.

### **14. Segment-wise average and row numbering**
Useful for profiling and segmentation.

### **15. Day-over-day sales difference**
Highlight growth trends at product level.

### **16. Sales contribution percent by region**
Reveal proportional geographic revenue mix.

### **17. Moving averages**
Smooth noisy data for forecasting contexts.

### **18. Customer-level order extremes**
Find largest and smallest order sizes.

### **19. Running profit totals**
Useful for cumulative customer profitability tracking.

### **20. Dense ranking by shipping mode**
Compare sales within logistical categories.

---

## 🧩 SQL Concepts Demonstrated

This project includes several intermediate–advanced SQL techniques:

- `JOIN`s (inner joins between facts and dimensions)
- `GROUP BY` aggregation
- Window functions:
  - `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`
  - `LAG()`
  - `SUM() OVER()` and `AVG() OVER()`
- Running totals & moving averages
- Percentage of total computations
- Extracting date components
- Business logic interpretation

These are essential tools for real-world data analytics & BI work.

---

## 🚀 Tech Stack

- **Database**: (Insert your DB: e.g., PostgreSQL / MySQL / SQL Server)
- **Language**: SQL

---

## 📈 Insights & Observations (Example)

From the sample outputs:

- As **discount increases**, **total profit decreases**
- **Canon imageCLASS 2200** was the top-selling product
- Certain regions contribute disproportionately to total revenue
- Product rankings show competitive dynamics within their categories

(Replace or expand once you formalize results.)

---

## 📁 File Structure

