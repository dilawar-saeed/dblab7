-- Q1
select count(*) as [Count of Orders in 1998]
from Orders
where year(OrderDate) = '1998'

-- Q2
select sum(UnitsInStock) as [Sum of all units]
from Products

-- Q3
select sum(UnitsInStock*UnitPrice) as [Worth of all available products]
from Products

-- Q4
select o.OrderID, o.OrderDate, p.ProductName
from Orders o
    inner join [Order Details] od on o.OrderID = od.OrderID
    inner join Products p on od.ProductID = p.ProductID

-- Q5
select o.OrderID, o.OrderDate, p.ProductName, c.CategoryName
from Orders o
    inner join [Order Details] od on o.OrderID = od.OrderID
    inner join Products p on od.ProductID = p.ProductID
    inner join Categories c on c.CategoryID = p.CategoryID
where CategoryName = 'Beverages'

-- Q6
select s.CompanyName, count(p.ProductID) as [Number of Products]
from Suppliers s
    inner join Products p on p.SupplierID = s.SupplierID
group by CompanyName
order by [Number of Products] DESC

-- Q7
select s.CompanyName, CategoryName, count(p.ProductID) as [Number of Products], avg(p.UnitPrice) as [Average Price], sum(p.UnitsInStock) as [Total Units in
Stock]
from Suppliers s
    inner join Products p on p.SupplierID = s.SupplierID
    inner join Categories c on c.CategoryID = p.CategoryID
group by s.CompanyName, CategoryName
order by s.CompanyName

-- Q8
select r.RegionDescription as [Region Description], count(e.EmployeeID) as [Number of Employees]
from Employees e
    inner join EmployeeTerritories et on et.EmployeeID = e.EmployeeID
    inner join Territories t on t.TerritoryID = et.TerritoryID
    inner join Region r on r.RegionID = T.RegionID
group by r.RegionDescription
order by [Number of Employees]

-- Q9
select OrderID, sum((UnitPrice*Quantity)-Discount) as [Total Amount]
from [Order Details]
group by OrderID

-- Q10
select c.CategoryName, count(p.ProductID)
from Categories c
    inner join Products p on p.CategoryID = c.CategoryID
group by c.CategoryName

-- Q11
select c.ContactName, s.CompanyName, count(o.OrderID) as [Number of Orders]
from Customers c
    INNER JOIN orders o on o.CustomerID = c.CustomerID
    INNER JOIN [Order Details] od on od.OrderID = o.OrderID
    INNER JOIN products p on p.ProductID = od.ProductID
    INNER JOIN suppliers s on s.SupplierID = p.SupplierID
group by c.ContactName, s.CompanyName

-- Q12
select e.TitleofCourtesy + ' ' + e.FirstName + ' ' + e.LastName  as [Employee Name], year(o.OrderDate), count(o.OrderID) as [Number of Orders]
from Employees e
    INNER JOIN orders o ON e.EmployeeID = o.EmployeeID
GROUP BY [Employee Name]
ORDER BY [Employee Name], year(o.OrderDate)

--Q13
SELECT
    CONCAT(E.FirstName, ' ', E.LastName) AS 'Employee Name',
    CONCAT(m.FirstName, ' ', m.LastName) AS 'Manager Name',
    COUNT(O.OrderID) AS 'No. of Orders'
FROM employees e
    inner join Employees m on e.ReportsTo = m.EmployeeID
    left join Orders o on e.EmployeeID = o.EmployeeID
GROUP BY CONCAT(e.FirstName, ' ', e.LastName), CONCAT(m.FirstName, ' ', m.LastName)

--Q14
select c.ContactName as 'Customer Name'
from Customers c
    left join Orders o on o.CustomerID = c.CustomerID
where o.CustomerID is null

--Q15
select CONCAT(e.FirstName, ' ', e.LastName) as 'Employee Full Name', c.ContactName as 'Customer Name'
from Employees e
cross join Customers c