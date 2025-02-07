CREATE SCHEMA IF NOT EXISTS Supermarket;
USE Supermarket;

CREATE TABLE IF NOT EXISTS Employees(
	Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Store_ID INT NOT NULL,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Yearly_Salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);

CREATE TABLE IF NOT EXISTS Stores(
	Store_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(50) NOT NULL,
    Area DECIMAL(10, 2) NOT NULL, CHECK(Area>0),
    Yearly_Earnings DECIMAL(10, 2) NOT NULL, CHECK(Yearly_Earnings>0),
    Weekly_Visits INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Products(
	Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Store_ID INT NOT NULL,
    Product_Name VARCHAR(50) NOT NULL,
    Category_Name VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL, CHECK(Price>0),
    Discontinued BOOLEAN NOT NULL,
    In_Stock_Quantity INT NOT NULL, CHECK(In_Stock_Quantity>=0),
    Backlog_Quantity INT NOT NULL, CHECK(Backlog_Quantity>=0),
    Weekly_Purchases_Amount INT,
    Weekly_Purchases_Earinings DECIMAL(10, 2),
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);

CREATE TABLE IF NOT EXISTS Customers(
	Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Last_Visit DATETIME NULL,
    Last_Item_Purchased_ID INT NULL,
    FOREIGN KEY (Last_Item_Purchased_ID) REFERENCES Products(Product_ID)
);

CREATE TABLE IF NOT EXISTS Inventory(
	Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(50) NOT NULL,
    Product_ID INT NOT NULL,
    Total_Quantity INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

CREATE TABLE IF NOT EXISTS Shipments(
	Shipment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID INT NOT NULL,
    From_Inventory_ID INT NOT NULL,
    To_Store_ID INT NOT NULL,
    Shipping_Date DATE NOT NULL,
    Quantity INT NOT NULL, CHECK(Quantity>0),
    FOREIGN KEY (From_Inventory_ID) REFERENCES Inventory(Inventory_ID),
    FOREIGN KEY (To_Store_ID) REFERENCES Stores(Store_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
