--retieve all cutomer records from both table 
Select OrderDate,
OrderTotal,
CustomerName [Customer Name]
From dbo.Orders
Join dbo.Customers on dbo.Orders.customerID = dbo.Customers.CustomerID

/*Filtering and sorting*/
where OrderTotal >2000
order by OrderTotal desc

--Aggregation Analysis
Select sum (OrderTotal)[Total Transaction],
avg(OrderTotal)[Average Transaction Value],
count (OrderID) [Total Number of Transaction]
from dbo.Orders

/*Groupig*/
Select CustomerID, 
Sum (OrderTotal)[total Spent]
from dbo.Orders
group by CustomerID ;

--Join the operation
Select c.CustomerName,
Sum(o.OrderTotal)[Total Spent]
from dbo.Orders o
Join dbo.customers c
on o.customerID = c.CustomerID
Group by c.CustomerName;

-- next
Select c.CustomerID,
c.CustomerName[Customer Name],
o.OrderID [Order ID],
o.OrderDate [Order Date],
o.OrderTotal[ Total Order]
From dbo.Customers c
inner join dbo.Orders o on c.CustomerID = o.CustomerID
Where o.OrderTotal > (Select avg(OrderTotal)
from dbo.Orders)
order by o.OrderTotal Desc

-- abovve average
Select c.CustomerName,
sum (o.orderTotal)[total spent]
from dbo.Orders o
Join dbo.Customers c on o.CustomerID = c.CustomerID
Group by c.CustomerName
Having Sum (o.OrderTotal)>(
--This Inner subquery finds the average total spending per Customer
Select avg(CustomerTotal)
from (
Select sum(OrderTotal)[CustomerTotal]
from dbo.Orders
Group by CustomerID
) as CustomerTotalsTable
)
Order by [Total Spent] Desc;
