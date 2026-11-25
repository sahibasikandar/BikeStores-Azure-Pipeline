-- =====================================================
-- 5 analytical queries over the Gold views
-- =====================================================

-- Q1: Which store generates the most revenue?
SELECT store_name, store_state, total_revenue, total_orders,
       ROUND(total_revenue / total_orders, 2) AS avg_order_value
FROM dbo.store_sales
ORDER BY total_revenue DESC;

-- Q2: Revenue trend by year
SELECT [year], SUM(total_revenue) AS yearly_revenue, SUM(total_orders) AS orders,
       SUM(units_sold) AS units
FROM dbo.monthly_sales
GROUP BY [year]
ORDER BY [year];

-- Q3: Top 10 products by revenue
SELECT TOP 10 product_name, brand_name, category_name, total_revenue, units_sold
FROM dbo.top_products
ORDER BY total_revenue DESC;

-- Q4: Revenue by category (with share of total)
SELECT category_name,
       SUM(total_revenue) AS revenue,
       ROUND(100.0 * SUM(total_revenue) / SUM(SUM(total_revenue)) OVER (), 2) AS pct_of_total
FROM dbo.top_products
GROUP BY category_name
ORDER BY revenue DESC;

-- Q5: Top 10 customers by lifetime value
SELECT TOP 10 customer_id, first_name, last_name, state,
       lifetime_value, total_orders, first_order, last_order
FROM dbo.customer_lifetime_value
ORDER BY lifetime_value DESC;

-- Q6 (bonus): Best 5 months ever
SELECT TOP 5 [year], [month], total_revenue, total_orders
FROM dbo.monthly_sales
ORDER BY total_revenue DESC;

-- Q7 (bonus): Customer value by state
SELECT state, COUNT(*) AS customers, SUM(lifetime_value) AS total_ltv
FROM dbo.customer_lifetime_value
GROUP BY state
ORDER BY total_ltv DESC;
