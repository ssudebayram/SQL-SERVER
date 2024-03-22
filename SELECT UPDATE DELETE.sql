SELECT * FROM Products WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Beverages')

SELECT * FROM Suppliers WHERE SupplierID = (SELECT SupplierID FROM Products WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products))

SELECT * FROM Shippers WHERE ShipperID = (SELECT TOP 1 ShipVia FROM Orders WHERE CustomerID = 'MusteriID' ORDER BY OrderDate DESC )

SELECT MAX(OrderDate) FROM Orders WHERE CustomerID = (SELECT TOP 1 CustomerID FROM Orders GROUP BY CustomerID ORDER BY COUNT(OrderID) DESC)

SELECT ProductName FROM Products WHERE SupplierID = (SELECT TOP 1 SupplierID FROM Products GROUP BY SupplierID ORDER BY SUM(UnitsInStock) DESC)

SELECT * FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE OrderID IN (SELECT OrderID FROM [Order Details] WHERE ProductID = 3 AND UnitPrice < (SELECT AVG(UnitPrice) FROM [Order Details] WHERE ProductID = 5)))

SELECT * FROM Categories WHERE CategoryID IN (SELECT CategoryID FROM Products WHERE UnitPrice > 20)

SELECT ContactName FROM Customers WHERE CustomerID = (SELECT TOP 1 CustomerID FROM Orders GROUP BY CustomerID ORDER BY COUNT(*) DESC)

SELECT AVG(UnitPrice) FROM Products WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Beverages')

SELECT * FROM Customers WHERE CustomerID = (SELECT TOP 1 CustomerID FROM Orders GROUP BY CustomerID ORDER BY COUNT(OrderID) DESC)

SELECT * FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders GROUP BY CustomerID HAVING COUNT(OrderID) = 1)

SELECT * FROM Suppliers WHERE SupplierID = (SELECT TOP 1 SupplierID FROM Products GROUP BY SupplierID ORDER BY SUM(UnitsInStock) DESC)

SELECT categoryName FROM categories WHERE categoryID IN (SELECT categoryID  FROM products GROUP BY categoryID HAVING AVG(UnitPrice) > ( SELECT AVG(UnitPrice) FROM products))

SELECT categoryName FROM categories WHERE categoryID = ( SELECT TOP 1 categoryID FROM products  GROUP BY categoryID  ORDER BY SUM(UnitsInStock) DESC )

SELECT categoryName FROM categories WHERE categoryID IN ( SELECT categoryID  FROM products  WHERE SupplierID = 6)

SELECT AVG(UnitPrice) AS [avg price], AVG(UnitsInStock) AS [avg stock] FROM products WHERE categoryID = (SELECT categoryID FROM products WHERE productID = 14)

SELECT productName, UnitsInStock FROM products WHERE UnitsInStock = (SELECT MIN(UnitsInStock) FROM products)









UPDATE Products SET UnitsInStock = UnitsInStock + 10 WHERE ProductID = (SELECT TOP 1 ProductID FROM Products WHERE CategoryID = 4 ORDER BY UnitPrice ASC)

UPDATE [Order Details] SET Quantity = Quantity + 1 WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 'FRANK')

UPDATE Products SET UnitsInStock = 50 WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName = 'Seafood')

UPDATE Orders SET ShippedDate = GETDATE() WHERE ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')

UPDATE Products SET UnitsInStock = 100 WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Produce')

UPDATE Products SET UnitPrice = UnitPrice * 1.1 WHERE ProductID = (SELECT TOP 1 ProductID FROM Products ORDER BY UnitPrice DESC)

UPDATE Orders SET ShippedDate = '2024-02-08' WHERE OrderID = (SELECT MAX(OrderID) FROM Orders WHERE CustomerID = 'ALFKI')

UPDATE Orders SET ShippedDate = GETDATE() WHERE OrderID = (SELECT MAX(OrderID) FROM Orders WHERE CustomerID = 'CACTU')

UPDATE Orders SET ShippedDate = GETDATE() WHERE CustomerID = (SELECT TOP 1 CustomerID FROM Orders GROUP BY CustomerID ORDER BY COUNT(OrderID) DESC) AND OrderID = (SELECT MAX(OrderID) FROM [Order Details] WHERE ProductID = 4)

UPDATE Products SET UnitsInStock = UnitsInStock - 10 WHERE ProductID = (SELECT TOP 1 ProductID FROM Products WHERE CategoryID = 7 ORDER BY UnitPrice DESC)

UPDATE Orders SET OrderDate = '2024-03-01' WHERE OrderID = (SELECT MAX(OrderID) FROM Orders WHERE CustomerID = 'QUEEN')

UPDATE products SET Discontinued = 'False' WHERE categoryID = (SELECT TOP 1 categoryID FROM products where Discontinued = 'True')

UPDATE products SET UnitPrice = (SELECT AVG(UnitPrice) FROM products WHERE categoryID = 5) WHERE categoryID = 7

UPDATE products SET UnitsInStock = (SELECT AVG(UnitsInStock) FROM products WHERE categoryID = 2) WHERE categoryID = 5

UPDATE products SET categoryID = (SELECT categoryID FROM categories WHERE categoryName = 'Produce') WHERE UnitsInStock < 20

UPDATE products SET UnitsInStock = UnitsInStock - 5 WHERE productName LIKE '%Ikura%'

UPDATE products SET UnitPrice = UnitPrice * 1.05 WHERE supplierID = (SELECT supplierID  FROM suppliers  WHERE CompanyName = 'Tokyo Traders')

UPDATE orders SET ShippedDate = '2024-01-07' WHERE orderID = (SELECT TOP 1 orderID FROM orders WHERE customerID = 'BERGS' ORDER BY orderDate DESC )

UPDATE products SET categoryID = (SELECT categoryID FROM categories WHERE categoryName = 'Condiments') WHERE UnitPrice BETWEEN 10 AND 50

UPDATE orders SET Freight = Freight * 1.1 WHERE orderDate = (SELECT MAX(orderDate) FROM orders)











DELETE FROM Products WHERE ProductID NOT IN (SELECT ProductID FROM [Order Details])

DELETE FROM Categories WHERE CategoryID NOT IN (SELECT DISTINCT CategoryID FROM Products)

DELETE FROM Orders WHERE CustomerID = 'ALFKI' AND OrderID = (SELECT MAX(OrderID) FROM Orders WHERE CustomerID = 'BOLID')

DELETE FROM Categories WHERE CategoryID NOT IN (SELECT DISTINCT CategoryID FROM [Order Details])

DELETE FROM Orders WHERE CustomerID = 'CONSH' AND OrderDate < (SELECT MAX(OrderDate) FROM Orders WHERE CustomerID = 'CHOPS')

DELETE FROM Categories WHERE CategoryID IN (SELECT CategoryID FROM Products WHERE ProductID = 20)

DELETE FROM categories WHERE categoryID IN (SELECT categoryID FROM products WHERE SupplierID = 6 )

DELETE FROM categories WHERE categoryID IN (SELECT categoryID FROM products WHERE UnitsInStock < 10)

DELETE FROM products WHERE categoryID = (SELECT categoryID FROM products WHERE UnitsInStock = (SELECT MIN(UnitsInStock) FROM products ))

DELETE FROM orders WHERE customerID IN (SELECT customerID FROM customers WHERE Region = 'BC')

DELETE FROM products WHERE supplierID = (SELECT supplierID FROM suppliers WHERE CompanyName = 'Karkki Oy')

DELETE FROM orders WHERE employeeID NOT IN ( SELECT employeeID  FROM employees)

DELETE FROM [order details] WHERE orderID IN ( SELECT orderID  FROM orders  WHERE orderDate < '2024-02-02')

DELETE FROM orders WHERE orderID IN (SELECT orderID FROM [order details] WHERE productID = 15 AND orderID IN ( SELECT orderID FROM orders WHERE orderDate < '2024-01-01' ))

DELETE FROM orders WHERE customerID IN ( SELECT customerID  FROM customers  WHERE employeeID = 3)

DELETE FROM orders WHERE orderID = (SELECT TOP 1 orderID FROM orders WHERE customerID = 'RANCH' ORDER BY orderDate DESC )

DELETE FROM orders WHERE customerID IN (SELECT customerID FROM customers WHERE employeeID = 1)

DELETE FROM orders WHERE orderID = ( SELECT TOP 1 orderID FROM orders WHERE customerID = 'ALFKI' ORDER BY orderDate DESC )

DELETE FROM orders WHERE customerID IN (SELECT customerID FROM customers WHERE employeeID = 5)

