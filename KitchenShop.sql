DROP TABLE IF EXISTS `order_items`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `inventories`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `customers`;

CREATE TABLE IF NOT EXISTS `customers` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50),
	`email` varchar(50),
	PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `categories` (
	`id` int NOT NULL AUTO_INCREMENT,
	`description` varchar(50),
	PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `products` (
	`id` int NOT NULL AUTO_INCREMENT,
	`description` varchar(50),
	`category_id`	int NOT NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `inventories` (
	`product_id`	int NOT NULL,
	`quantity`	smallint NOT NULL,
	`unit_price`	decimal(12,2) NOT NULL,
	PRIMARY KEY(`product_id`),
	FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `orders` (
	`id` int NOT NULL AUTO_INCREMENT,
	`customer_id`	int NOT NULL,
	`order_date`	datetime NOT NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `order_items` (
	`id` int NOT NULL AUTO_INCREMENT,
	`order_id`	int NOT NULL,
	`product_id`	int NOT NULL,
	`quantity`	int NOT NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

LOCK TABLES `customers` WRITE;

INSERT INTO `customers` (id, name, email)
VALUES
(1, 'Nolan Santiago','orci@outlook.net'),
(2, 'Edan Buckley','aliquam.erat.volutpat@hotmail.ca'),
(3, 'Oren Thompson','cursus.a.enim@icloud.couk'),
(4, 'Robin Terry','orci.quis@outlook.ca'),
(5, 'Jin Cortez','curabitur.dictum@hotmail.net');

LOCK TABLES `categories` WRITE;

INSERT INTO `categories` (id,description) VALUES (1,'Bowls'),
 (2,'Graters'),
 (3,'Heaters'),
 (4,'Knives'),
 (5,'Mashers'),
 (6,'Mixers'),
 (7,'Openers'),
 (8,'Pans'),
 (9,'Pots'),
 (10,'Scoopers'),
 (11,'Slicers'),
 (12,'Spatulas'),
 (13,'Strainers');

LOCK TABLES `products` WRITE;

INSERT INTO `products` (id,description,category_id) VALUES (1,'Mixing bowl',1),
 (2,'Cheese grater',2),
 (3,'Microwave oven',3),
 (4,'Bread knife',4),
 (5,'Chef''s knife',4),
 (6,'Paring knife',4),
 (7,'Pizza cutter',4),
 (8,'Balloon whisk',6),
 (9,'Blender',6),
 (10,'Bottle opener',7),
 (11,'Can opener',7),
 (12,'Saucepan',8),
 (13,'Frying pan',8),
 (14,'Soup pot',9),
 (15,'Ladle',10),
 (16,'Kitchen shear',11),
 (17,'Silicone spatula',12),
 (18,'Sieve',13),
 (19,'Colander',13);

LOCK TABLES `inventories` WRITE;

INSERT INTO `inventories` (product_id,quantity,unit_price) VALUES (1,28,6.2),
 (2,23,12.96),
 (3,4,5.23),
 (4,4,12.44),
 (5,9,5.43),
 (6,23,10.27),
 (7,10,6.93),
 (8,17,6.51),
 (9,19,11.4),
 (10,27,10.09),
 (11,9,14.55),
 (12,6,6.17),
 (13,13,8.26),
 (14,27,9.76),
 (15,12,7.79),
 (16,21,11.15),
 (17,10,10.48),
 (18,24,12.53),
 (19,3,5.93);

LOCK TABLES `orders` WRITE;

INSERT INTO `orders` (id,customer_id,order_date) 
VALUES
(1,1,'2012-01-01'),
(2,2,'2012-01-01'),
(3,3,'2012-01-02'),
(4,4,'2012-01-02'),
(5,5,'2012-01-03'),
(6,1,'2012-01-03'),
(7,2,'2012-01-04'),
(8,3,'2012-01-04'),
(9,4,'2012-01-05'),
(10,5,'2012-01-05'),
(11,1,'2012-01-06'),
(12,2,'2012-01-06');

LOCK TABLES `order_items` WRITE;

INSERT INTO `order_items` (id,order_id,product_id,quantity) 
VALUES
(1,1,1,1),
(2,1,3,3),
(3,1,5,5),
(4,2,7,7),
(5,2,9,9),
(6,3,11,2),
(7,3,12,4),
(8,3,13,6),
(9,3,15,8),
(10,4,2,1),
(11,5,4,3),
(12,5,6,5),
(13,6,8,7),
(14,6,10,9),
(15,6,12,2),
(16,6,14,4),
(17,7,16,6),
(18,7,18,8),
(19,8,10,1),
(20,9,1,3),
(21,10,3,5),
(22,10,5,7),
(23,11,7,9),
(24,11,9,2),
(25,11,11,4),
(26,11,13,6),
(27,12,15,8),
(28,12,17,1);

UNLOCK TABLES;
