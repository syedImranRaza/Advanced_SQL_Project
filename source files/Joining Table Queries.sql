USE EcommerceDB;

/* Joining Tables
Simple Joins

Retrieve all orders along with the FirstName and LastName of the customer who placed each order.*/

select 
    c.FirstName, c.LastName, s.*
FROM    
    orders s
JOIN customers c ON c.CustomerID = s.CustomerID;

--List all products along with the SupplierName for each product.--

select 
    p.*, s.SupplierName 
from 
    products p
JOIN Suppliers s ON s.SupplierID = p.SupplierID

/* Filtering with Joins

Fetch all completed orders, displaying the CustomerID, FirstName, LastName, and OrderDate.*/

select 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderDate,
    o.OrderStatus
FROM    
    Orders o
JOIN customers c on c.CustomerID = o.CustomerID
WHERE
    o.OrderStatus = 'Completed'

-- Retrieve all products supplied by 'TechWorld Inc.'. --

select 
    *
from 
    Products p
join Suppliers s on s.SupplierID = p.SupplierID
WHERE
    s.SupplierName = 'TechWorld Inc.'

/* Multiple Joins

Display all orders, including the FirstName of the customer and the ProductName of each product in the order.*/


select 
    c.FirstName,
    o.*,
    p.ProductName
FROM
    Orders o
JOIN Customers c on c.CustomerID = o.CustomerID
Join OrderDetails od ON od.OrderID = o.OrderID
JOIN Products p on p.ProductID = od.ProductID 

-- Find all customers who have responded to a marketing campaign and include the campaign's name and channel.--

