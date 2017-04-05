--1. Write a query to return all category names with their descriptions from the Categories table.
 --select [CategoryName] , [Description]
 --from [dbo].[Categories]

--2.Write a query to return the contact name, customer id, company name and city name of all Customers in London
--Select [ContactName], [customerID], [companyname], [city]
--From Customers Where city = 'London'

--3.Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
--Select  [SupplierID],[CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[Fax],[HomePage]
--From Suppliers Where (Contacttitle = 'marketing manager' OR Contacttitle = 'sales representative') and not fax = 'NULL'

--4.Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
--Select [CustomerId]
--From [orders] Where ([requireddate] between 'Jan 1, 1997' AND 'Dec 31,1997') AND [freight] < 100

--5.Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
--select [CompanyName] , [ContactName]
--from [Customers] where [Country] = 'Mexico' or [country]= 'Sweden' or [country]= 'Germany'

--6.Write a query to return a count of the number of discontinued products in the Products table.
--select count(*) [Discontinued]
--from [Products]
--where [discontinued] = 1

--7.Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.
--select [categoryname],[description]
--from [categories]
--where [categoryname] like 'co%'

--8.Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.
--select [companyname],[city],[country],[postalcode]
--from [suppliers]
--where [address] like '%rue%'
--order by [companyname]ASC

--9.Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.
--select [productid],[quantity] as 'Quantity Purchased'
--from [order details]
--order by [quantity] desc

--10.Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.
--select customers.[companyname],[address],[city],[postalcode],[country],[orderdate]
--from [customers] join [orders] on customers.[customerid] = orders.[customerid] join [shippers] on orders.[shipvia]=shippers.[shipperid] 
--where shippers.[companyname] = 'Speedy Express'

--11.Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.
--select [companyname],[contactname],[contacttitle],[region]
--from [suppliers]

--12.Write a query to return all product names from the Products table that are condiments.
--select [productname]
--from [products]
--where [categoryid] = 2

--13.Write a query to return a list of customer names who have no orders in the Orders table.
--select [contactname]
--from [customers]
--where [customerid] not in (select [customerid] from orders)

--14.Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.
--insert into [shippers] (companyname)
--values ('Amazon')

--15.Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.
--update [shippers] set [companyname] = 'Amazon Prime Shipping'
--where [companyname] = 'Amazon'

--16.Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.
--select [companyname], round (sum(freight),0) as 'Freight'
--from [dbo].[Shippers],[dbo].[orders]
--group by [companyname]

--17.Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.
--select concat([lastname], [firstname]) as 'displayname'
--from [employees]

--18.Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.
--Insert into [customers] ([customerID],[companyname])
--values ('pamela','Pamelaz')
--insert into [orders] ([customerid])  
--values ('pamela')
--insert into [order details] ([orderid],[productid])
--Values ((select [OrderID] from [Orders] where [CustomerID] ='pamela'),(Select [productid] from [products] Where [productname] = 'Grandma''s Boysenberry Spread'))

--19.Write a query to remove yourself and your order from the database.
--delete from[order details] where [orderid] =(select [orderid] from [orders] where [customerid] ='pamela');
--delete from [orders] where [companyname] ='Pamelaz';
--delete [customers] where [customerid] ='pamela'

--20.Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.
--select [productname], [unitsInStock]
--from [Products]
--where [unitsInstock] > 100