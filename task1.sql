DROP VIEW IF EXISTS OrdersView;
CREATE VIEW OrdersView AS 
	SELECT OrderID, Quantity, Cost 
    FROM Orders
    WHERE Quantity > 2;
    
select * from OrdersView; #note, no data in table is > 2


#In my schema, customers and orders are joined through the booking table so I need five tables. Also, no cost > 150 in data
SELECT Customers.CustomerID AS CustomerID, Customers.Name, Orders.OrderID, Orders.Cost AS Cost, Menu.MenuID as Menu, MenuItems.Name AS CourseName
	FROM Customers 
	INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
	INNER JOIN Orders ON Bookings.BookingID = Orders.BookingID
	INNER JOIN Menu ON orders.MenuID = Menu.MenuID
	INNER JOIN Menuitems ON Menuitems.ItemID = Menu.MenuItemID
	WHERE Cost > 150 ORDER BY Cost ASC;
 
#in view form 
CREATE VIEW Task2 AS
	SELECT Customers.CustomerID AS CustomerID, Customers.Name, Orders.OrderID, Orders.Cost AS Cost, Menu.MenuID as Menu, MenuItems.Name AS CourseName
	FROM Customers 
	INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID
	INNER JOIN Orders ON Bookings.BookingID = Orders.BookingID
	INNER JOIN Menu ON orders.MenuID = Menu.MenuID
	INNER JOIN Menuitems ON Menuitems.ItemID = Menu.MenuItemID
	WHERE Cost > 150 ORDER BY Cost ASC;

SELECT Name 
FROM menuitems
WHERE Name = ANY (
	SELECT Menuitems.Name
	FROM MenuItems
	JOIN Menu ON Menuitems.ItemID = Menu.MenuItemID
	JOIN orders ON orders.MenuID = Menu.MenuID
	WHERE Orders.Quantity > 2);

#in view form
CREATE VIEW TASk3 AS
SELECT Name 
FROM menuitems
WHERE Name = ANY (
	SELECT Menuitems.Name
	FROM MenuItems
	JOIN Menu ON Menuitems.ItemID = Menu.MenuItemID
	JOIN orders ON orders.MenuID = Menu.MenuID
	WHERE Orders.Quantity > 2);
