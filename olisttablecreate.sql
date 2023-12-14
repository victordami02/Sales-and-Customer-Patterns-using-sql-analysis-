create database olistsales;
use olistsales;

CREATE TABLE olist_products(
	product_id VARCHAR(60) NOT NULL PRIMARY KEY,
    product_category_name VARCHAR(30) NOT NULL,
    product_name_lenght INT NOT NULL,
    product_description_lenght INT NOT NULL,
    product_photos_qty INT NOT NULL,
    product_weight_g INT NOT NULL,
    product_length_cm INT NOT NULL,
    product_height_cm INT NOT NULL,
    product_width_cm INT NOT NULL
);


CREATE TABLE olist_customer(
	customer_id VARCHAR(60) NOT NULL PRIMARY KEY,
    customer_unique_id VARCHAR(30) NOT NULL,
    customer_zip_code_prefix INT NOT NULL,
    customer_city VARCHAR(60) NOT NULL,
    customer_state VARCHAR(30)
);

CREATE TABLE olist_order_item(
	order_id VARCHAR(60) NOT NULL PRIMARY KEY,
    order_item_id INT  NOT NULL,
    product_id VARCHAR(60) NOT NULL,
    seller_id VARCHAR(60) NOT NULL,
    price FLOAT,
    freight_value FLOAT
);

CREATE TABLE olist_order_dataset(
	order_id VARCHAR(60) NOT NULL PRIMARY KEY,
    customer_id VARCHAR(60)  NOT NULL,
	order_status VARCHAR(30) NOT NULL,
    order_purchase_timestamp datetime NOT NULL,
    order_approved_at datetime NOT NULL,
    order_delivered_carrier_date datetime NOT NULL,
    order_delivered_customer_date datetime NOT NULL,
    order_estimated_delivery_date datetime NOT NULL
);
drop table olist_order_dataset;

CREATE TABLE olist_order_payment(
	order_id VARCHAR(60) NOT NULL PRIMARY KEY,
    payment_sequential VARCHAR(60)  NOT NULL,
	payment_type VARCHAR(30) NOT NULL,
    payment_installments int NOT NULL,
    payment_value int NOT NULL
   
);


LOAD DATA LOCAL INFILE 'olist_products_dataset.csv' INTO TABLE `olist_products`
FIELDS TERMINATED BY ','
ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
