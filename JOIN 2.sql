SELECT Territories.TerritoryDescription FROM Territories 
INNER JOIN Region ON Territories.RegionID = Region.RegionID
WHERE Region.RegionDescription = 'Eastern'
/* do�u konumunda ki b�lgelerin s�ralanmas� */


SELECT DISTINCT e.FirstName,e.LastName,e.HomePhone FROM Employees e
JOIN  Orders o ON e.EmployeeID = o.EmployeeID
JOIN  [Order Details] od ON o.OrderID = od.OrderID
JOIN  Products p ON od.ProductID = p.ProductID
JOIN  Suppliers s ON p.SupplierID = s.SupplierID
JOIN  Categories c ON p.CategoryID = c.CategoryID
JOIN  Customers cust ON o.CustomerID = cust.CustomerID
JOIN  EmployeeTerritories et ON e.EmployeeID = et.EmployeeID
JOIN  Territories t2 ON et.TerritoryID = t2.TerritoryID
WHERE s.PostalCode = '33007' AND c.CategoryName != 'Seafood'
/* Tedarik�isinin posta kodu 33007 olan �r�nlerimden deniz �r�nleri (seafood) hari� �r�nlerin yer ald��� sipari�ler ile ilgilenmi� �al��anlar�m�n ad, soyad, ev telefonu alanlar�n� getir*/
 




SELECT DISTINCT c.CustomerID, p.CategoryID, COUNT(od.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Territories t ON t.RegionID = t.RegionID
JOIN Region r ON t.RegionID = r.RegionID
WHERE r.RegionDescription = 'Eastern' 
 AND o.ShipName = 'Federal Shipping'
GROUP BY c.CustomerID, p.CategoryID
ORDER BY c.CustomerID, p.CategoryID
/* Konumu 'Eastern' olan m��terilerimin, federal shipping ile ta��nan �r�nlerini kategorilere g�re s�ralay�n�z */





SELECT DISTINCT Orders.OrderID
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN EmployeeTerritories ON Orders.EmployeeID = EmployeeTerritories.EmployeeID
JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID
JOIN Region ON Territories.RegionID = Region.RegionID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON [Order Details].ProductID = Products.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Territories.TerritoryDescription LIKE '%Londra%' 
AND SUBSTRING(Suppliers.CompanyName, 4, 1) = 'e' 
AND Products.UnitPrice BETWEEN 30 AND 60
/* Tedarik �ehri londra olan, kargo �irketinin  4. harfi e olan sto�umda bulunan ve birim fiyat� 30 - 60 aras�nda olan sipari�lerim nelerdir */



SELECT DISTINCT Suppliers.ContactName, Suppliers.Phone
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE Orders.OrderID NOT IN (SELECT [Order Details].OrderID FROM [Order Details] JOIN Products ON [Order Details].ProductID = Products.ProductID
 WHERE Products.UnitsInStock > 0  AND Products.Discontinued='True')
/* Sat��� durdurulmu� ve ayn� zamanda sto�u kalmam�� �r�nlerimin tedarik�ilerinin isimlerini ve telefon numaralar�n� listeleyiniz*/



SELECT DISTINCT c.ContactName FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID WHERE o.OrderDate > '1998-01-01'
ORDER BY c.ContactName ASC
/* 1 Ocak 1998 tarihinden sonra sipari� veren m��terilerimin isimlerini artan olarak s�ralay�n�z */


SELECT c.ContactName, COUNT(o.OrderID) FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName
/* M��terilerimin toplam sipari� adetlerini M��teri ad� ile birlikte raporlay�n */



SELECT c.CustomerID, c.ContactName, c.City AS CustomerCity, COUNT(o.OrderID) AS TotalOrders FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
INNER JOIN EmployeeTerritories et ON e.EmployeeID = et.EmployeeID
INNER JOIN Territories t ON et.TerritoryID = t.TerritoryID
INNER JOIN Region r ON t.RegionID = r.RegionID
GROUP BY c.CustomerID, c.ContactName, c.City
HAVING COUNT(o.OrderID) >= 15
/* En az 15 sipari� vermi� m��terilerimin toplam sipari� adetini m��teri ad�, m��teri ID verisi ve m��teri firman�n �ehri ile birlikte raporlay�n */



SELECT Customers.ContactName, COUNT(Orders.OrderID) FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.ContactName
/* M��terilerimin toplam sipari� adetlerini M��teri ad� ile birlikte raporlay�n */



SELECT o.OrderDate, COUNT(DISTINCT od.ProductID) AS FarkliUrunSayisi, SUM(od.Quantity) AS ToplamUrunAdeti FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderDate
ORDER BY o.OrderDate
/*Sipari�lerimde ka� farkl� �r�n ve ka� adet �r�n satm���m? Tarihleri de g�r�nt�leyerek raporlay�n�z*/



SELECT COUNT(*) FROM [Order Details] OD
INNER JOIN products P ON OD.ProductID = P.ProductID
INNER JOIN categories C ON P.CategoryID = C.CategoryID
WHERE C.CategoryName = 'Condiments'
/* Condiments kategorisindeki �r�nlerden ka� sipari� verilmi� */


SELECT ShipName, COUNT(Orders.OrderID) FROM Orders GROUP BY ShipName
/* Kargo �irketlerine g�re ta��nan sipari� say�lar� nas�ld�r */


SELECT SUM([Order Details].Quantity * [Order Details].UnitPrice) FROM [Order Details] 
JOIN orders  ON [Order Details].OrderID = [Order Details].OrderID
JOIN Customers  ON Orders.CustomerID = Customers.CustomerID
/* T�m cirom ne kadar */



SELECT SUM([Order Details].Quantity * [Order Details].UnitPrice) FROM [Order Details] 
JOIN orders  ON [Order Details].OrderID = Orders.OrderID
WHERE YEAR (Orders.OrderDate) = 1997
/* 1997 y�l�ndaki t�m cirom ne kadar */


SELECT e.FirstName, SUM(od.quantity * od.unitPrice) AS TotalSales FROM Employees e
INNER JOIN orders o ON e.employeeID = o.employeeID
INNER JOIN [Order Details] od ON o.orderID = od.orderID
GROUP BY e.employeeID, e.FirstName
ORDER BY TotalSales DESC
/* �al��anlar�m ne kadarl�k sat�� yapm��lar */




SELECT TOP 3 s.CompanyName AS Tedarik�i, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS [Sat�� Tutar�] FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY s.CompanyName
ORDER BY SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) DESC
/* Tedarik�ilerim bana ne kadar kazand�r�yor? En �ok kazand�ran ilk 3 tedarik�iyi getirin */


select Orders.OrderID from Orders 
INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID 
WHERE Employees.City = 'Tacoma'
/* �ehri tacoma olan �al��anlar�m�n ald��� sipari�lerin listesi */

select Employees.EmployeeID, Employees.FirstName, Employees.LastName FROM Employees
WHERE Employees.City = 'New York'
/*New York �ehrinden sorumlu �al��an(lar)�m kim?*/




SELECT e.FirstName, SUM(od.quantity * od.unitPrice) AS TotalSales FROM Employees e
INNER JOIN orders o ON e.employeeID = o.employeeID
INNER JOIN [Order Details] od ON o.orderID = od.orderID
GROUP BY e.employeeID, e.FirstName
ORDER BY TotalSales DESC
/* �al��anlar�m ne kadarl�k sat�� yapm��lar */



















