SELECT Employees.EmployeeID, COUNT(Orders.OrderID), SUM([Order Details].UnitPrice * [Order Details].Quantity) from Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Employees.EmployeeID
/*Her bir çalýþanýn sipariþlerinin sayýsý ve toplam tutarý*/


select Customers.ContactName , Count(Orders.OrderID) from Customers
JOIN Orders on Customers.CustomerID = Orders.CustomerID 
GROUP BY Customers.ContactName
/* Her müþterinin adýný ve o müþteriye ait toplam sipariþ sayýsý */


select TOP 1 Employees.EmployeeID , Count(Orders.OrderID) from Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
Group by Employees.EmployeeID
Order BY Count(Orders.OrderID) DESC 
/* Hangi çalýþanýn toplamda en fazla sipariþ sattýðý */

select TOP 1 Customers.CustomerID , Count(Orders.OrderID) from Customers
JOIN Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.CustomerID
Order by count(Orders.OrderID) desc
/* Hangi müþteri toplamda en fazla sipariþi vermiþtir*/

SELECT Customers.CustomerID,MIN(Orders.OrderDate) AS [First Order Date],MAX(Orders.OrderDate) AS [Last Order Date]
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID
/* Her müþterinin ilk ve son sipariþ tarihleri */

select Categories.CategoryName , count(Suppliers.SupplierID) FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
group by Categories.CategoryName
/* Her kategoride toplam kaç tedarikçi çalýþýyor */

SELECT Categories.CategoryName, AVG(Products.UnitPrice) AS [Avg Price], SUM(Products.UnitsInStock) AS [Total Stock]
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
/*Bir kategorideki ürünlerin ortalama fiyatý ve stok durumu*/


select Products.ProductName , Categories.CategoryName , Suppliers.SupplierID from Suppliers
JOIN Products ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
Group by Products.ProductName , Categories.CategoryName , Suppliers.SupplierID
/*Her bir ürünün adý, kategorisi ve tedarikçisinin adý*/


