USE EcommerceDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Country VARCHAR(50),
    SignUpDate DATE,
    EmailOptIn VARCHAR(3)
);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT,
    SupplierID INT
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(20),
    PaymentMethod VARCHAR(20),
    Discount DECIMAL(5, 2),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    Country VARCHAR(50),
    ContactEmail VARCHAR(100),
    PhoneNumber VARCHAR(20)
);


CREATE TABLE MarketingCampaigns (
    CampaignID INT PRIMARY KEY,
    CustomerID INT,
    CampaignName VARCHAR(100),
    Channel VARCHAR(50),
    SentDate DATE,
    Response VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
