INSERT `products` (description, category_id)
VALUES
(:description, :category_id);

INSERT `inventories` (product_id, quantity, unit_price)
VALUES
(LAST_INSERT_ID(), 0, 0);