CREATE SCHEMA IF NOT EXISTS Supermarket;
USE Supermarket;

CREATE TABLE IF NOT EXISTS Stores(
	Store_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(50) NOT NULL,
    Area DECIMAL(10, 2) NOT NULL, CHECK(Area>0),
    Weekly_Earnings DECIMAL(10, 2) NOT NULL, CHECK(Weekly_Earnings>0),
    Weekly_Visits INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ProductTypes(
	Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Category_Name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employees(
	Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Store_ID INT NOT NULL,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Yearly_Salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
);

CREATE TABLE IF NOT EXISTS Items(
	Product_ID INT NOT NULL,
    Store_ID INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL, CHECK(Price>0),
    Discontinued BOOLEAN NOT NULL,
    In_Stock_Quantity INT NOT NULL, CHECK(In_Stock_Quantity>=0),
    Backlog_Quantity INT NOT NULL, CHECK(Backlog_Quantity>=0),
    Weekly_Purchases_Amount INT,
    FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID),
    FOREIGN KEY (Product_ID) REFERENCES ProductTypes(Product_ID)
);

CREATE TABLE IF NOT EXISTS Customers(
	Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Last_Visit DATETIME NULL,
    Last_Item_Purchased_ID INT NULL,
    FOREIGN KEY (Last_Item_Purchased_ID) REFERENCES Items(Product_ID)
);

CREATE TABLE IF NOT EXISTS Inventory(
	Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(50) NOT NULL,
    Product_ID INT NOT NULL,
    Total_Quantity INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES ProductTypes(Product_ID)
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
    FOREIGN KEY (Product_ID) REFERENCES ProductTypes(Product_ID)
);


INSERT INTO Stores (Location, Area, Weekly_Earnings, Weekly_Visits) VALUES
("Бургас", 2000, 100000, 1500),
("София", 3500, 450000, 4000),
("Айтос", 1600, 80000, 1000)
;

INSERT INTO Employees(Store_ID, First_Name, Last_Name, Position, Yearly_Salary) VALUES
(1, "Иван", "Петров", "Касиер", 2100),
(1, "Мария", "Георгиева", "Касиер", 2000),
(1, "Петър", "Христов", "Мениджър", 3000),
(2, "Здравко", "Николов", "Касиер", 2500),
(2, "Снежана", "Тодорова", "Касиер", 2700),
(2, "Делян", "Пеевски", "Мениджър", 4200),
(3, "Мехмет", "Йълмаз", "Касиер", 1600),
(3, "Хасан", "Димитров", "Касиер", 1700),
(3, "Владимир", "Василев", "Мениджър", 2400)
;

INSERT INTO ProductTypes (Product_ID, Product_Name, Category_Name) VALUES
(1, "Хляб", "Основни хранителни продукти"),
(2, "Мляко", "Млечни продукти"),
(3, "Захар", "Основни хранителни продукти"),
(4, "Яйца", "Основни хранителни продукти"),
(5, "Краве масло", "Млечни продукти"),
(6, "Олио", "Основни хранителни продукти"),
(7, "Сирене", "Млечни продукти"),
(8, "Кашкавал", "Млечни продукти"),
(9, "Кисело мляко", "Млечни продукти"),
(10, "Салам", "Месни продукти"),
(11, "Сьомга", "Месни продукти"),
(12, "Картофи", "Зеленчуци"),
(13, "Лук", "Зеленчуци"),
(14, "Домати", "Зеленчуци"),
(15, "Чушки", "Зеленчуци"),
(16, "Моркови", "Зеленчуци"),
(17, "Банани", "Плодове"),
(18, "Ябълки", "Плодове"),
(19, "Портокали", "Плодове"),
(20, "Лимони", "Плодове"),
(21, "Грозде", "Плодове"),
(22, "Боб", "Основни хранителни продукти"),
(23, "Леща", "Основни хранителни продукти"),
(24, "Ориз", "Основни хранителни продукти"),
(25, "Макарони", "Основни хранителни продукти"),
(26, "Бисквити", "Сладки изделия"),
(27, "Шоколад", "Сладки изделия"),
(28, "Бадеми", "Ядки"),
(29, "Фъстъци", "Ядки"),
(30, "Лешници", "Ядки"),
(31, "Кашу", "Ядки"),
(32, "Мед", "Основни хранителни продукти"),
(33, "Кафе", "Напитки"),
(34, "Чай", "Напитки"),
(35, "Минерална вода", "Напитки"),
(36, "Студен чай", "Напитки"),
(37, "Тоалетна хартия", "Нехранителни продукти")
;
