-- 1
SELECT
	p.id AS product_id,
	p.name AS product_name,
	p.stock - COALESCE(SUM(pc.quantity),0) AS current_stock
FROM 
	products p
LEFT JOIN
	product_carts pc ON p.id =pc.product_id
LEFT JOIN
	carts c ON pc.cart_id = c.id AND c.status = 'checkout'
GROUP BY
	p.id, p.name;

-- 2
SELECT 
	o.id AS order_id,
	AVG(TIMESTAMPDIFF(SECOND, o.created_at, fo.date)) AS avg_time_difference
FROM 
	orders o
JOIN
	feedback_orders fo ON o.id = fo.order_id
GROUP BY 
	o.id;

-- 3
SELECT
p.name AS product_name,
p.stock AS current_stock
FROM 
products p
JOIN
	product_carts pc ON p.id = pc.product_id
JOIN
	carts c ON pc.cart_id = c.id AND c.status = 'checkout'
GROUP BY
p.id
HAVING current_stock < 5;

-- 4
SELECT
DATE(o.created_at) AS order_date,
COUNT(DISTINCT o.cart_id) AS total_carts,
COUNT(DISTINCT pc.product_id) AS total_products,
SUM(p.price * pc_quantity
-- 6
SELECT AVG(orders.total_price) AS validated_orders
FROM orders
WHERE orders.`status`= 'validated';

