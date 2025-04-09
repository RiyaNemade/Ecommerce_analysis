# 📊 E-Commerce Sales Analysis (SQL Portfolio Project)

This project simulates a real-world online retail business scenario. It involves creating and analyzing an E-Commerce database using SQL to extract meaningful business insights — exactly the kind of work data analysts do.

---

## 🧱 Project Structure

The database consists of 4 main tables:

- `customers` – stores customer details
- `products` – stores product catalog information
- `orders` – stores customer purchase data
- `order_details` – stores product-level details for each order

---

## 💡 Business Questions Solved

✅ Total revenue generated  
✅ Top customers by purchase value  
✅ Highest-selling products (quantity & revenue)  
✅ Average order value  
✅ Category-wise product performance  
✅ Month-wise revenue trend  
✅ Customer retention (repeat buyers)  
✅ Customer activity by country  
✅ Users who have never ordered

---

## 🔍 Sample SQL Queries Used

sql
-- Total revenue
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- Top customer by revenue
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- Best-selling product (by quantity)
SELECT p.product_name, SUM(od.quantity) AS total_units_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 1;
---

##Quantifiable Insights:-

Total Revenue: ₹1,25,000
Top Customer: Amit Sharma (₹90,000 spent)
Best-Selling Product: Smartphone (3 units)
Top Revenue Product: Laptop (₹30,000)
Average Order Value: ₹41,667
Repeat Customers: 0 (need for customer retention strategy)
Category Sales: 80% of units sold are electronics

##Summary:-

➤ Analyzed an e-commerce database using SQL to extract 10+ business insights, including top customers, product sales trends, and revenue performance.
➤ Demonstrated expertise in JOIN, GROUP BY, HAVING, and RANK() functions.
➤ Delivered actionable recommendations on customer retention and product category performance.


