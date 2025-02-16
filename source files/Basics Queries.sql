
USE EcommerceDB;

-- 01. Retrieve Data --

/*
Write a query to fetch all columns and records from the Customers table.
*/
 
Select * from customers;

-- Retrieve only the FirstName and LastName of all customers. --

select 
    FirstName, 
    LastName 
from 
    customers;


-- Display the ProductName and Price of all products from the Products table.  --

select 
    ProductName,
    Price 
from 
    Products;


-- 02. Filtering Data with WHERE --

-- Find all customers who signed up after January 1, 2021. --

select 
    FirstName, 
    LastName, 
    SignUpDate  
from 
    customers
Where 
    SignUpDate > '01-01-2021';

-- Retrieve all orders where the OrderStatus is 'Completed'--

select * from Orders
where
    OrderStatus = 'Completed';


-- 03. Sorting Data with ORDER BY --
-- List all products, sorted by Price in descending order. --

select * from products 
ORDER BY price DESC;

-- Display all customers, sorted alphabetically by their LastName --

select * 
from customers
ORDER BY LastName DESC; 

-- 04. Limiting Results with LIMIT --
-- Retrieve the first 5 products from the Products table.--

select TOP(5)
    *
from Products;

-- Get the top 3 customers who signed up earliest. --

select top(3) * from customers 
ORDER BY SignUpDate ASC;