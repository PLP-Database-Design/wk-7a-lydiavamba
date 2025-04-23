-- QUESTION 1
CREATE database Product_Details;
USE Product_Details;
CREATE table ProductDetails(
OrderID INT,
CustomerName VARCHAR(60),
Products VARCHAR(100)
);
Insert INTO ProductDetails(OrderID,CustomerName,Products)
VALUES (101, 'John Doe','Laptop, Mouse'),
(102,'Jane Smith','Tablet, Keyboard, Mouse'),
(103,'Emily Clark','Phone');
SELECT * FROM ProductDetails;

-- QUESTION 2
SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', n.n), ',', -1)) AS Product
FROM ProductDetails
JOIN (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) n
  ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= n.n - 1
ORDER BY OrderID, n.n;

CREATE table OrderDetails(
OrderID INT,
CustomerName VARCHAR(60),
Products VARCHAR(100),
Quantity INT
);

SELECT * FROM OrderDetails;
CREATE TABLE OrdersDetails (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);
CREATE TABLE OrderItems (
    OrderID INT,
    Products VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Products),
    FOREIGN KEY (OrderID) REFERENCES OrdersDetails(OrderID)
);
INSERT INTO OrdersDetails (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

INSERT INTO OrderItems (OrderID, Products, Quantity)
SELECT OrderID, Products, Quantity
FROM OrderDetails;
SELECT * FROM OrderItems;
