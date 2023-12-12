create database pizzadb;
use pizzadb;

create table pizzasales (
pizza_id int (200),
primary key auto_increment (pizza_id),
order_id int (200),
pizza_name_id varchar(200),
quantity int (50),
order_date date ,
order_time time,
unit_price float,
total_price float,
pizza_size varchar (200),
pizza_category varchar (200),
pizza_ingredients varchar (200),
pizza_name varchar (200));

select * from pizzasales;

#1 The sum of the total price of all pizza orders
select sum(total_price) as "total revenue" from pizzasales;

#2 The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_Order_Value 
FROM pizzasales;

#3-- Total Pizzas Sold: The sum of the quantities of all pizza sold?
SELECT SUM(quantity) AS Total_Pizza_Sold from pizzasales;

#4 The total number of orders placed.
SELECT COUNT(order_id) AS Total_Orders 
FROM pizzasales;

#5The average number of pizzas sold per order,calculated by dividing the total number of pizzas sold by the total number oforders
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,3)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,3)) AS DECIMAL(10,3))
AS Avg_Pizzas_Per_Order
FROM pizzasales;



     #1 Daily trend for total Orders.alter
	Select Day(order_date) as Day, Count(order_id) as "Total Orders" from pizzasales
    Group by Day;
    
    # 2. Monthly Trend for Total Orders.
	Select hour(order_time) as Hours,count(order_id) as "Total Orders" from pizzasales
    Group by Hours;

  # 3. Percentage of Sales by Pizza Category.
	Select pizza_category,Sum(quantity) as Sales from pizzasales
    Group by pizza_category;

-- 4. Percentage of Sales by Pizza Size.
	Select pizza_size,Sum(quantity) as Sales from pizzasales
    Group by pizza_size;

-- 5. Total Pizza Sold by Pizza Category.
	Select pizza_category,Count(*) as Total_Pizza_Sold from pizzasales
    Group by pizza_category;













