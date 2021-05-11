1. Get all customers and their addresses.

SELECT * FROM customers as c
	JOIN addresses as a ON a.customer_id = c.id;

2. Get all orders and their line items (orders, quantity and product).

SELECT o.id, li.quantity, li.product_id FROM orders as o
	JOIN line_items as li ON li.order_id = o.id;

3. Which warehouses have cheetos?

SELECT w.warehouse, wp.on_hand FROM warehouse_product as wp
	JOIN warehouse as w ON w.id = wp.warehouse_id
	JOIN products as p ON p.id = wp.product_id
	WHERE wp.product_id = 5;

4. Which warehouses have diet pepsi?

SELECT w.warehouse, wp.on_hand FROM warehouse_product as wp
	JOIN warehouse as w ON w.id = wp.warehouse_id
	JOIN products as p ON p.id = wp.product_id
	WHERE wp.product_id = 6;

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT  a.customer_id, c.first_name, COUNT(a.customer_id) FROM addresses as a
	JOIN orders as o ON o.address_id = a.id
	JOIN customers as c ON c.id = a.customer_id
	GROUP BY c.first_name, a.customer_id;

6. How many customers do we have?

SELECT COUNT(*) as customer_total FROM customers;

7. How many products do we carry?

SELECT COUNT(*) as product_total FROM products;

8. What is the total available on-hand quantity of diet pepsi?

SELECT SUM(wp.on_hand) as total_pepsi FROM warehouse_product as wp
	JOIN warehouse as w ON w.id = wp.warehouse_id
	JOIN products as p ON p.id = wp.product_id
	WHERE wp.product_id = 6;

## Stretch
9. How much was the total cost for each order?
10. How much has each customer spent in total?
11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).