SELECT productName,
CASE 
WHEN UnitsInStock > 0 THEN 'In Stock'
WHEN UnitsInStock = 0 THEN 'Out of Stock'
END 
AS [stock status]
FROM products


SELECT employeeID, 
CASE 
WHEN Title LIKE '%Sales Representative%' THEN 'Sales Representative'
WHEN Title LIKE '%Vice President, Sales%' THEN 'Vice President, Sales'
WHEN Title LIKE '%Sales Manager%' THEN 'Sales Manager'
WHEN Title LIKE '%Inside Sales Coordinator%' THEN 'Inside Sales Coordinator'
ELSE 'Employee'
END 
AS [employee category]
FROM employees


SELECT productName, 
CASE 
WHEN UnitPrice < 50 THEN 'Low Price'
WHEN UnitPrice BETWEEN 50 AND 100 THEN 'Medium Price'
ELSE 'High Price'
END 
AS [price category]
FROM products

SELECT productName, 
CASE 
WHEN UnitsInStock <= 10 THEN  UnitPrice * 0.1
WHEN UnitsInStock <= 20 THEN UnitPrice * 0.05
ELSE UnitPrice
END 
AS [discounted price]
FROM products

SELECT employeeID, 
CASE 
WHEN Title LIKE '%Sales Representative%' THEN 'Gets Bonus'
WHEN Title LIKE '%Vice President, Sales%' THEN 'Gets Bonus'
WHEN Title LIKE '%Sales Manager%' THEN 'Gets Bonus'
ELSE 'Does not gets bonus'
END 
AS [bonus status]
FROM employees

SELECT customerID, 
CASE 
WHEN COUNT(orderID) > 10 THEN 'high order'
WHEN COUNT(orderID) > 5 THEN 'middle order'
ELSE 'low order'
END 
AS [customer status]
FROM orders
GROUP BY customerID

select ProductName , 
Case 
When UnitsInStock > 90 THEN 'high stock'
When UnitsInStock > 30 THEN 'middle stock'
ELSE 'low stock'
END 
AS [stock status]
FROM Products

SELECT city,
CASE 
WHEN COUNT(customerID) > 4 THEN 'Popular city'
WHEN COUNT(customerID) > 1 THEN 'middle popular city'
ELSE 'low Popular city'
END AS popularity
FROM customers
GROUP BY city


select OrderID,
case 
when (UnitPrice * Quantity) > 100 THEN 'Low amount'
WHEN (UnitPrice * Quantity) > 300 Then 'Middle amount'
When (UnitPrice * Quantity) > 500 THEN 'High amount'
End 
AS [amount status]
from [Order Details]


select BirthDate,
case
when DATEDIFF(YEAR , BirthDate , GetDate()) < 50 THEN 'Middle age'
When DATEDIFF(YEAR , BirthDate , GetDate()) < 70 THEN 'old'
when DATEDIFF(YEAR , BirthDate , GetDate()) < 90 THEN 'too old'
End 
As [age status]
From Employees

