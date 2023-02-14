USE mydb;
INSERT INTO MenuItems (ItemID, Name, Type, Price)
VALUES
(1, 'Olives','Starters',5),
(2, 'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread','Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10, 'Greek yoghurt','Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Turkish Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);


INSERT INTO Menu (MenuItemID, MenuID, Cuisine)
VALUES
(1, 1, 'Greek'),
(1, 7, 'Greek'),
(1, 10, 'Greek'),
(1, 13, 'Greek'),
(2, 3, 'Italian'),
(2, 9, 'Italian'),
(2, 12, 'Italian'),
(2, 15, 'Italian'),
(3, 5, 'Turkish'),
(3, 17, 'Turkish'),
(3, 11, 'Turkish'),
(3, 16, 'Turkish');

INSERT INTO Employees (EmployeeID, Name, Role, Salary)
VALUES
(01,'Mario Gollini','Manager',70000),
(02,'Adrian Gollini','Assistant Manager',65000),
(03,'Giorgos Dioudis','Head Chef',50000),
(04,'Fatma Kaya','Assistant Chef',45000),
(05,'Elena Salvai','Head Waiter',40000),
(06,'John Millar','Receptionist', 35000);
select * from Employees;

INSERT INTO Customers (CustomerID, Name, Address, PhoneNumber)
VALUES
(01,'Anna Iversen','724, Parsley Lane, Old Town, Chicago, IL',351258074),
(02,'Joakim Iversen','334, Dill Square, Lincoln Park, Chicago, IL',351474048),
(03,'Vanessa McCarthy','879 Sage Street, West Loop, Chicago, IL',351970582),
(04,'Marcos Romero','132  Bay Lane, Chicago, IL',351963569),
(05,'Hiroki Yamane','989 Thyme Square, EdgeWater, Chicago, IL',351074198),
(06,'Diana Miller','245 Dill Square, Lincoln Park, Chicago, IL',351584508);

INSERT INTO Bookings (BookingID, TableNumber, BookingDate, EmployeeID, CustomerID)
VALUES
(1, 12, '2022-1-1',1, 5),
(2, 12, '2022-1-1', 1, 5),
(3, 19, '2022-1-1', 3, 1),
(4, 15, '2022-1-2', 4, 2),
(5, 5, '2022-1-2', 2, 3),
(6, 8, '2022-1-3', 5, 1);

Insert into delivery_status (DeliveryID, DeliveryStatus)
values
(1, 'complete'),
(2, 'complete'),
(3, 'not delivered');

INSERT INTO Orders (OrderID, MenuID, BookingID, Quantity, Cost, DeliveryID)
VALUES
(1, 1, 1, 2, 86, 1),
(2, 2, 2, 1, 37, 2),
(3, 2, 3, 1, 37, 2),
(4, 3, 4, 1, 40, 2),
(5, 1, 5, 1, 43, 3);