--Question: What is the total sales amount by region?
SELECT SUM(sales),region FROM(
SELECT sales,region FROM sales AS s
INNER JOIN  customer AS c
ON s.customer_id=c.customer_id)
GROUP BY region

--Question: Which products generated the most sales?
SELECT product_name, SUM(sales) AS sum FROM
(SELECT sales,product_name FROM sales AS s
INNER JOIN  product AS c
ON s.product_id=c.product_id)
GROUP BY product_name
ORDER BY sum DESC;
--Ans: Canon imageCLASS 2200 advanced copier

--Question: How does the discount affect profit?

SELECT discount,SUM(profit) AS tot_profit  
FROM sales
GROUP BY discount
ORDER BY discount;
-- Ans: AS discount increases total profit decrease

--How much sales does each customer segment contribute?
SELECT segment, SUM(sales) FROM
(SELECT  segment, sales FROM sales AS s
INNER JOIN  customer AS c
ON s.customer_id=c.customer_id)
GROUP BY segment

--What are the total sales for each product category?

SELECT category, SUM(sales) AS sum FROM
(SELECT sales, category FROM sales AS s
INNER JOIN  product AS c
ON s.product_id=c.product_id)
GROUP BY category
ORDER BY sum DESC;

-- How many orders were shipped by each shipping mode?
SELECT ship_mode,count(ship_mode) FROM sales
GROUP BY ship_mode;

--What are the total sales for each month?

SELECT EXTRACT(MONTH FROM order_date) AS month,SUM(sales)
FROM sales
GROUP By month
--How many customers are there in each state?
SELECT state, COUNT(state)
FROM customer
GROUP BY state;


--Who are the top 5 customers in terms of total sales?
SELECT customer_name,SUM(sales) as sum FROM
(SELECT sales,customer_name FROM sales AS s
INNER JOIN  customer AS c
ON s.customer_id=c.customer_id)
GROUP BY customer_name
ORDER BY sum DESC
LIMIT 5;

-- What is the total sales for each product subcategory?
SELECT sub_category, SUM(sales) AS sum FROM
(SELECT sales,sub_category FROM sales AS s
INNER JOIN  product AS c
ON s.product_id=c.product_id)
GROUP BY sub_category
ORDER BY sum DESC;

--How can we rank products by their total sales within each product category?
SELECT category, product_name, sum, RANK() OVER(PARTITION BY category ORDER BY sum DESC) FROM (
SELECT SUM(sales) as sum,category, product_name 
FROM (SELECT sales,category, product_name FROM sales AS s
INNER JOIN  product AS c
ON s.product_id=c.product_id)
GROUP BY category,product_name);


-- How can we calculate cumulative sales over time (running total) for each
--product?
SELECT product_name,sales, SUM(sales) OVER(PARTITION BY product_name ORDER BY order_date ) FROM 
(SELECT sales,order_date, product_name FROM sales AS s
INNER JOIN  product AS c
ON s.product_id=c.product_id)


--How can we find the top 3 customers based on profit within each region?
SELECT * FROM(
SELECT customer_name, region,profit, RANK() OVER(PARTITION BY region ORDER BY profit DESC ) AS rank
FROM customer AS c INNER JOIN sales AS s
ON c.customer_id=s.customer_id)
WHERE rank <4;


--How can we find the average sales for each segment and assign a row
--number to each customer based on their sales?

SELECT customer_name,segment, sales,AVG(s.sales) OVER(PARTITION BY segment), ROW_NUMBER() OVER(PARTITION BY segment ORDER BY sales DESC)
FROM customer AS c INNER JOIN sales as s
ON c.customer_id=s.customer_id


--How can we calculate the difference in sales between consecutive days for
--each product?
SELECT product_name, sales, order_date,sales-lag0 AS sale_diff FROM(
SELECT product_name, sales, order_date, LAG(s.sales,1,0) OVER( PARTITION BY product_name ORDER BY order_date) as lag0
FROM product AS p INNER JOIN
sales as s
ON p.product_id=s.product_id)

--How can we calculate the percentage of total sales contributed by each
--region?
SELECT tot_sales,region, tot_sales/SUM(tot_sales) OVER() AS percent FROM(
SELECT SUM(sales) AS tot_sales, region FROM customer AS c INNER JOIN
sales AS s
On c.customer_id=s.customer_id
GROUP BY region
)

 --How can we calculate the moving average of sales over the last 3 orders for
--each product?

SELECT sales, order_date, product_name,AVG(sales) OVER (PARTITION BY product_name ORDER BY order_date  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
FROM product AS p INNER JOIN 
sales AS s
ON p.product_id=s.product_id


--How can we find the largest and smallest order (by sales) for each customer?
SELECT sales, customer_name, MAX(sales) OVER(PARTITION BY customer_name) AS largest_sales, MIN(sales) OVER(PARTITION BY customer_name) FROM sales as s INNER JOIN customer as c
ON s.customer_id=c.customer_id


--How can we calculate the running total of profit for each customer?

SELECT sales, customer_name, profit,order_date, SUM(profit) OVER(PARTITION BY customer_name ORDER BY order_date) FROM sales as s INNER JOIN customer as c
ON s.customer_id=c.customer_id

--How can we assign a dense rank to each sale based on total sales, grouped
--by ship mode?
SELECT sales, ship_mode, DENSE_RANK() OVER(PARTITION BY ship_mode ORDER BY sales DESC)
FROM sales

