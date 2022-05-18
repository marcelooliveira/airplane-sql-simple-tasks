DROP TABLE IF EXISTS `inventory`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `category`;

CREATE TABLE IF NOT EXISTS `category` (
	`id` int NOT NULL AUTO_INCREMENT,
	`description` varchar(50) DEFAULT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `product` (
	`id` int NOT NULL AUTO_INCREMENT,
	`description` varchar(50) DEFAULT NULL,
	`category_id`	int NOT NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `inventory` (
	`product_id`	int NOT NULL,
	`quantity`	smallint NOT NULL,
	`unit_price`	decimal(12,2) NOT NULL,
	PRIMARY KEY(`product_id`),
	FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

LOCK TABLES `category` WRITE;

INSERT INTO `category` (id,description) VALUES (1,'Bowls'),
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

LOCK TABLES `product` WRITE;

INSERT INTO `product` (id,description,category_id) VALUES (1,'Mixing bowl',1),
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

LOCK TABLES `inventory` WRITE;

INSERT INTO `inventory` (product_id,quantity,unit_price) VALUES (1,28,6.2),
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

UNLOCK TABLES;
