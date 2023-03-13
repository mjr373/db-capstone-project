# Task 1
DROP PROCEDURE IF EXISTS GetMaxQuantity; 

CREATE PROCEDURE GetMaxQuantity()
	SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM ORDERS;

CALL GetMaxQuantity();

# Task 2
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, Cost FROM Orders JOIN Bookings ON Orders.BookingID = Bookings.BookingID WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

#Task 3
DROP PROCEDURE IF EXISTS CancelOrder; 

DELIMITER //
CREATE PROCEDURE CancelOrder(IN cancel_id int)
	BEGIN
		DELETE FROM Orders WHERE OrderID = cancel_id;
		SELECT CONCAT('Order ', cancel_id, ' is canceled') AS Confirmation;
	END //
DELIMITER ;
CALL CancelOrder(0);