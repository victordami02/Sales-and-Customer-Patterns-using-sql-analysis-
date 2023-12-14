SELECT * FROM olistsales.olist_products;
select * from olist_order_dataset;

-- day name of most order --
select order_purchase_timestamp,
dayname(order_purchase_timestamp)
 from olist_order_dataset;
 
alter table olist_order_dataset add column order_dayname varchar(20);

update olist_order_dataset
set order_dayname = dayname(order_purchase_timestamp)
;

SET SQL_SAFE_UPDATES = 0;
-- day name of most order --

select order_purchase_timestamp,
monthname(order_purchase_timestamp)
 from olist_order_dataset;
 
alter table olist_order_dataset add column order_month varchar(20); 
update olist_order_dataset
set order_month = monthname(order_purchase_timestamp);

-- unique customer city--
select count(distinct customer_city)  from olist_customer;

-- write a sql query for which city have the most order having the order table and the customer table --


SELECT
    c.customer_city,
    COUNT(o.order_id) AS total_orders
FROM
    olist_customer c
JOIN
    olist_order_dataset o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_city
ORDER BY
    total_orders DESC
LIMIT 10;

-- how many unique product line do we have --
select distinct product_category_name from olist_products;
select count(distinct product_category_name) from olist_products;
-- most common payment method--
select payment_type, count(payment_type) as cnt from olist_order_payment
group by payment_type
order by cnt desc;
-- if high payment product pay in high no of installments
SELECT
    payment_installments,
    MAX(payment_value) AS max_payment_value
FROM
    olist_order_payment
GROUP BY
    payment_installments
ORDER BY
    max_payment_value DESC
LIMIT 10;
 
-- what is the best selling products --
select product_category_name, count(product_category_name) as cnt
from olist_products
group by product_category_name
order by cnt desc;

-- highest month with total revenue--

SELECT
    order_month as month,
    SUM(op.payment_value) AS total_revenue
FROM
    olist_order_dataset od
JOIN
    olist_order_payment op ON od.order_id = op.order_id
GROUP BY
    order_month
ORDER BY
    total_revenue desc;
-- product with the highest revenue --
select product_category_name,
SUM(op.payment_value) AS total_revenue
from olist_products ol
join 
olist_order_payment op ON ol.product_id = op.order_id
group by product_category_name
order by total_revenue; 
-- what city as the highest revenue --

-- sale per day --
select order_dayname, count(*) as total_sales
from olist_order_dataset
group by order_dayname 
order by total_sales desc;

