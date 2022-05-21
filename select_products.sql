SELECT
c.id as category_id,
c.description as category_description,
p.id as product_id,
p.description as product_description
FROM products as p 
JOIN categories as c
  ON c.id = p.category_id
WHERE LOWER(p.description) LIKE CONCAT('%', LOWER(:query), '%')
OR LOWER(c.description) LIKE CONCAT('%', LOWER(:query), '%');