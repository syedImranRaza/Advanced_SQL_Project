USE EcommerceDB;

/* 05. Using Aliases
Retrieve FirstName and LastName of customers 
and display them as First Name and Last Name.*/

select 
    FirstName as 'First Name',
    LastName As 'Last Name'
FROM
    customers;

/* 06. Basic Aggregations

Find the total number of customers in the Customers table. */

select 
    COUNT(CustomerID) as 'Total Count'
FROM    
    customers;

-- Calculate the average price of all products in the Products table. --

select 
    AVG(Price) as 'Average Price'
FROM
    products;

-- Count the number of orders that have the OrderStatus as 'Completed' --

select 
    COUNT(OrderID) as 'Count of Completed Orders'
FROM
    Orders
WHERE
    OrderStatus = 'Completed';

/* Filtering with Aggregates

List all products where the StockQuantity is greater than 100.*/

select *
FROM
    products
WHERE
    StockQuantity > 100;

/* Group By and Aggregations

Find the number of customers grouped by their Country.*/

select 
    COUNT(CustomerID), Country
from 
    customers
GROUP BY Country;

-- Calculate the total stock quantity of products grouped by their Category. --

select 
    SUM(StockQuantity), Category
from 
    products
GROUP BY Category;