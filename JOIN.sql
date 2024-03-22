SELECT Employees.EmployeeID, COUNT(Orders.OrderID), SUM([Order Details].UnitPrice * [Order Details].Quantity) from Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY Employees.EmployeeID
/*Her bir �al��an�n sipari�lerinin say�s� ve toplam tutar�*/


select Customers.ContactName , Count(Orders.OrderID) from Customers
JOIN Orders on Customers.CustomerID = Orders.CustomerID 
GROUP BY Customers.ContactName
/* Her m��terinin ad�n� ve o m��teriye ait toplam sipari� say�s� */


select TOP 1 Employees.EmployeeID , Count(Orders.OrderID) from Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
Group by Employees.EmployeeID
Order BY Count(Orders.OrderID) DESC 
/* Hangi �al��an�n toplamda en fazla sipari� satt��� */

select TOP 1 Customers.CustomerID , Count(Orders.OrderID) from Customers
JOIN Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.CustomerID
Order by count(Orders.OrderID) desc
/* Hangi m��teri toplamda en fazla sipari�i vermi�tir*/

SELECT Customers.CustomerID,MIN(Orders.OrderDate) AS [First Order Date],MAX(Orders.OrderDate) AS [Last Order Date]
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID
/* Her m��terinin ilk ve son sipari� tarihleri */

select Categories.CategoryName , count(Suppliers.SupplierID) FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
group by Categories.CategoryName
/* Her kategoride toplam ka� tedarik�i �al���yor */

SELECT Categories.CategoryName, AVG(Products.UnitPrice) AS [Avg Price], SUM(Products.UnitsInStock) AS [Total Stock]
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
/*Bir kategorideki �r�nlerin ortalama fiyat� ve stok durumu*/


select Products.ProductName , Categories.CategoryName , Suppliers.SupplierID from Suppliers
JOIN Products ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
Group by Products.ProductName , Categories.CategoryName , Suppliers.SupplierID
/*Her bir �r�n�n ad�, kategorisi ve tedarik�isinin ad�*/


