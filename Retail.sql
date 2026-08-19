CREATE DATABASE RetailStoreDB;
USE RetailStoreDB;
CREATE TABLE store_sales
(
sale_id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
customer_name VARCHAR(50),
gender VARCHAR(10),
age INT,
city VARCHAR(40),
state VARCHAR(40),
product_name VARCHAR(60),
category VARCHAR(40),
quantity INT,
unit_price DECIMAL(10,2),
discount DECIMAL(10,2),
total_amount DECIMAL(10,2),
payment_mode VARCHAR(20),
salesperson VARCHAR(50)
);
INSERT INTO store_sales
(order_date,customer_name,gender,age,city,state,product_name,category,quantity,unit_price,discount,total_amount,payment_mode,salesperson)

VALUES

('2026-01-01','Rahul','Male',24,'Delhi','Delhi','Laptop','Electronics',1,55000,5000,50000,'Credit Card','Amit'),

('2026-01-02','Priya','Female',29,'Delhi','Delhi','Mobile','Electronics',2,18000,1000,35000,'UPI','Rohit'),

('2026-01-03','Ankit','Male',32,'Noida','UP','Chair','Furniture',4,2500,500,9500,'Cash','Neha'),

('2026-01-05','Sneha','Female',28,'Mumbai','Maharashtra','Sofa','Furniture',1,30000,2000,28000,'Debit Card','Amit'),
('2026-01-06','Rohan','Male',35,'Pune','Maharashtra','Television','Electronics',1,45000,3000,42000,'Credit Card','Neha'),

('2026-01-08','Meena','Female',41,'Jaipur','Rajasthan','Dining Table','Furniture',1,25000,1500,23500,'UPI','Rahul'),

('2026-01-10','Amit','Male',30,'Delhi','Delhi','Refrigerator','Electronics',1,42000,2000,40000,'Credit Card','Neha'),

('2026-01-12','Pooja','Female',27,'Lucknow','UP','Washing Machine','Electronics',1,28000,1000,27000,'Cash','Rohit'),

('2026-01-14','Karan','Male',26,'Chandigarh','Punjab','Office Chair','Furniture',2,4500,500,8500,'UPI','Rahul'),

('2026-01-15','Komal','Female',31,'Delhi','Delhi','Microwave','Electronics',1,15000,500,14500,'Debit Card','Amit'),

('2026-01-18','Sahil','Male',36,'Jaipur','Rajasthan','Bed','Furniture',1,38000,3000,35000,'Cash','Neha'),

('2026-01-19','Ritika','Female',25,'Noida','UP','Laptop','Electronics',1,60000,4000,56000,'Credit Card','Rahul'),

('2026-01-21','Deepak','Male',38,'Mumbai','Maharashtra','Air Conditioner','Electronics',1,52000,3000,49000,'UPI','Amit'),

('2026-01-22','Anjali','Female',34,'Pune','Maharashtra','Wardrobe','Furniture',1,32000,2000,30000,'Cash','Neha'),

('2026-01-23','Manoj','Male',42,'Delhi','Delhi','Mobile','Electronics',3,16000,2000,46000,'UPI','Rohit'),
('2026-01-25','Neha','Female',29,'Lucknow','UP','Study Table','Furniture',2,7000,1000,13000,'Debit Card','Rahul'),

('2026-01-26','Tarun','Male',40,'Delhi','Delhi','Television','Electronics',1,47000,2000,45000,'Cash','Amit'),

('2026-01-27','Shweta','Female',33,'Mumbai','Maharashtra','Sofa','Furniture',1,35000,3000,32000,'Credit Card','Neha'),

('2026-01-29','Mohit','Male',37,'Jaipur','Rajasthan','Laptop','Electronics',1,62000,5000,57000,'UPI','Rahul'),

('2026-01-30','Nisha','Female',26,'Delhi','Delhi','Mixer Grinder','Home Appliance',2,4500,500,8500,'Cash','Rohit');
desc store_sales;
select * from store_sales;
select customer_name, city , product_name from  store_sales;
select * from store_sales where city="Delhi";
select product_name from store_sales;
select * from store_sales where total_amount > 30000;
select * from store_sales where age > 30;
select * from store_sales order by total_amount desc;
select * from store_sales limit 5;
select * from store_sales where customer_name like "R%";
select distinct city from store_sales;
select sum(total_amount) from store_sales;
select avg(total_amount) from store_sales;
select max(total_amount) from store_sales;
select min(total_amount) from store_sales;
select count(quantity) from store_sales;
select city, sum(total_amount) from store_sales group by city;
select category, sum(total_amount) from store_sales group by category;
select payment_mode, count(*) from store_sales group by payment_mode;
select customer_name, count(*) from store_sales group by customer_name having count(*) >1;
select city , sum(total_amount) as totalsales from store_sales group by city order by totalsales desc limit 1;
select category , sum(total_amount) as totalsales from store_sales group by category order by totalsales desc limit 1;
select month(order_date)as month , sum(total_amount) as monthlyrevenue from store_sales group by month(order_date) order by month(order_date);
select * from store_sales order by total_amount desc limit 5;
select product_name ,sum(quantity) as total_qty_sold from store_sales group by product_name;
select city , avg(total_amount) from store_sales group by city; 
select sale_id,quantity*unit_price as gross_amt from store_sales;
select customer_name, payment_mode from store_sales where payment_mode="UPI";
select payment_mode,count(*) as order_count from store_sales group by payment_mode order by order_count desc limit 1;
select product_name from store_sales where unit_price>20000;
select customer_name, age from store_sales where age between 25 and 35;
select gender, count(gender) from store_sales group by gender;
select state, sum(total_amount) from store_sales group by state;
select salesperson , max(total_amount) from store_sales group by salesperson;
select count(distinct sale_id) as total_orders, sum(total_amount) as total_revenue, avg(total_amount) as avg_total_order, max(total_amount) as highest_sale,
min(total_amount) as lowest_sale from store_sales;
select  count(distinct customer_name) as total_customers from store_sales;
select city , avg(total_amount) as city_wise_sales from store_sales group by city;
select category , sum(total_amount) as totalsales from store_sales group by category;
select payment_mode,count(*) as order_count from store_sales group by payment_mode;
select salesperson, count(sale_id) as total_orders, sum(total_amount)as total_revenue,  avg(total_amount) as avg_total_order, 
max(total_amount) as highest_sale, count(distinct customer_name) as total_customers from store_sales group by salesperson order by total_revenue desc;
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS monthly_sales FROM store_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')ORDER BY month;
select product_name ,count(product_name) as total_products from store_sales group by product_name order by total_products desc limit 1;