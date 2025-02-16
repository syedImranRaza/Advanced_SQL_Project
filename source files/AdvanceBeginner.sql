USE EcommerceDB;

/* Subqueries
Subqueries in WHERE

List all products whose SupplierID matches the supplier of the product named 'Laptop'. */

select 
    *
FROM    
    Products
WHERE
    SupplierID = 
        (
            Select 
                SupplierID 
            from Products
            Where
                ProductName = 'Laptop' 
        )

-- Fetch all customers who have placed an order. --

SELECT
    c.CustomerID,
    c.FirstName
FROM
    Customers c 
JOIN Orders o ON o.CustomerID = c.CustomerID


/* Subqueries in SELECT

Display all orders along with the total number of products in each order. */


SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Orders.OrderStatus,
    (
        Select 
            COUNT(OrderDetails.ProductID)
        from 
            OrderDetails 
        where 
            Orders.OrderID = OrderDetails.OrderID
    )
FROM
    Orders


/* Advanced Beginner Queries
Using CASE

Write a query to display High, Medium, 
or Low based on the Price of products (Price > 1000 = High, 500 <= Price <= 1000 = Medium, Price < 500 = Low). */

Select 
    Price,
CASE
    WHEN Price > 1000 THEN 'High'
    WHEN Price BETWEEN 500 AND 1000 THEN 'Medium'
    WHEN Price < 500 THEN 'Low'
End AS BaseOfPrice
FROM
    Products

/*Create a query that adds a column indicating whether the customer opted into email marketing (Yes or No).*/

ALTER TABLE Customers
ALTER COLUMN EmailMarketingOption VARCHAR(20);

UPDATE Customers
SET EmailMarketingOption = 
    CASE
        WHEN EmailOptIn = 'Yes' then 'Email Sent'
        when EmailOptIn = 'No' then 'Email not Sent'
        else 'Unknown'
    End;

/* Combining Data with UNION

Write a query to list all FirstName and LastName of customers from the USA and Canada. */


SELECT FirstName,LastName
FROM Customers
WHERE Country = 'USA'
UNION
SELECT FirstName,LastName
FROM Customers
WHERE Country = 'Canada'

/* Pattern Matching with LIKE

Find all suppliers whose ContactEmail contains 'support'. */

SELECT * FROM Suppliers
WHERE ContactEmail like '%support%'


select * from customers where FirstName like 'A%'

/* Practical Scenarios
Orders and Revenue

Calculate the total revenue generated from completed orders. */

Select 
    OrderStatus,
    SUM(TotalAmount) as Total_Revnuew
FROM Orders
Where OrderStatus = 'Completed'
GROUP BY OrderStatus

-- Display all completed orders along with the total amount after applying the discount. --

SELECT
    OrderStatus,
    TotalAmount,
    TotalAmount - Discount as After_Discount
FROM
    Orders
WHERE
    OrderStatus = 'Completed'


/* Inventory Analysis

List all products where the stock is below 50. */

SELECT
    ProductName,
    StockQuantity
from Products
where StockQuantity <= 50

-- Find the product with the highest stock quantity. --

select ProductName, StockQuantity
FROM Products 
WHERE StockQuantity = (Select MAX(StockQuantity) from Products)

-- OR --

select Top(1) ProductName, StockQuantity
from products 
ORDER BY StockQuantity DESC 


/* Challenge Questions
Combining Skills

List all customers who have placed orders for products in the Electronics category. */

SELECT C.FirstName, P.Category
FROM Products P 
JOIN OrderDetails OD on OD.ProductID = P.ProductID
Join Orders O on O.OrderID = OD.OrderID
Join Customers C on C.CustomerID = O.CustomerID
WHERE P.category = 'Electronics'

-- Write a query to find the most expensive product in each Category. --

WITH RankedProducts AS (
    SELECT
        ProductID,
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
    FROM Products
)
SELECT Category, Price
FROM RankedProducts
WHERE RowNum = 1;

/* Supplier Insights

Retrieve the total number of products supplied by each supplier. */

SELECT S.SupplierName, COUNT(P.SupplierID) as TotalNoOfProducts from products P
JOIN Suppliers S on S.SupplierID = P.SupplierID
GROUP BY S.SupplierName

-- Find all suppliers who supply 2 or more than 2 different products. --

WITH ProductDistinctCount as (
Select 
    S.SupplierName as Sname,
    COUNT(Distinct ProductID) as DistinctCount
FROM
    Products P
JOIN Suppliers S ON S.SupplierID = P.SupplierID
GROUP BY S.SupplierName
)

select Sname, DistinctCount from ProductDistinctCount  where DistinctCount >=2 

/* Top Performers

Display the customer who has spent the most on completed orders. */

SELECT top(1)
    C.FirstName,
    SUM(OD.Subtotal) as TotalPurchsing
FROM Customers C
Join Orders O on O.CustomerID = C.CustomerID
JOIN OrderDetails OD on OD.OrderID = O.OrderID
WHERE O.OrderStatus = 'Completed'
GROUP BY C.FirstName
Order By TotalPurchsing DESC

-- Retrieve the product that has been sold the most (based on OrderDetails). --

SELECT top(1) P.ProductName,
    sum(OD.Quantity) as TTY
FROM Products P
JOIN OrderDetails OD on OD.ProductID = P.ProductID
GROUP BY P.ProductName
Order By TTY DESC
