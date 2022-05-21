SELECT 
    c.id as customer_id,
    c.name,
    SUM(oi.quantity * i.unit_price) AS total_amount
FROM orders as o
INNER JOIN order_items as oi
	ON oi.order_id = o.id
INNER JOIN products as p
	ON p.id = oi.product_id
INNER JOIN inventories as i
	ON i.product_id = p.id
INNER JOIN customers as c
	ON c.id = o.customer_id
GROUP BY c.id 
ORDER BY total_amount DESC
LIMIT 3
