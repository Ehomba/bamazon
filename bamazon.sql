DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
  item_id INT NOT NULL,
  product_name VARCHAR(45) NULL,
  department_name VARCHAR(45) NULL,
  price DECIMAL(10,2) NULL,
  stock_quantity INT NULL,
  PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Nintendo Swatch", "Video Games", 399.99, 125);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Hat", "Clothes", 9.99, 1050);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Shirt", "Clothes", 9.99, 950);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("World Of Warcraft", "Video Games", 39.99, 10000);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Washer and Dryer set", "Appliances", 599.99, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Shorts", "Clothes", 19.99, 150);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Octopath Traveler", "Video Games", 59.99, 65);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("iPad Pro", "Electronics", 799.99, 25);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Nintendo DS", "Video Games", 299.99, 45);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("PS4", "Video Games", 399.99, 200);