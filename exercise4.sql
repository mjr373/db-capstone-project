#Task 1
DROP PROCEDURE IF EXISTS AddBooking; 

DELIMITER //
CREATE PROCEDURE AddBooking(IN new_book_id INT, IN book_cust_id INT, IN book_table INT, IN book_date DATE) #does not check if that booking is actually available  
	BEGIN
		INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID) 
				VALUES (new_book_id, book_table, book_date, book_cust_id);
        SELECT 'New Booking Added' AS Confirmation;
    END//
DELIMITER ;

CALL AddBooking(9, 3, 4, '2022-12-30');

#Task 2
DROP PROCEDURE IF EXISTS UpdateBooking; 

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN book_id INT, IN book_date DATE) #does not check if that booking is actually available  
	BEGIN
		UPDATE Bookings SET BookingDate = book_date WHERE BookingID = book_id;
        SELECT CONCAT( 'Booking ', book_id, ' updated') AS Confirmation;
    END//
DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');

#Task 3
DROP PROCEDURE IF EXISTS CancelBooking; 

DELIMITER //
CREATE PROCEDURE CancelBooking(IN book_id INT)
	BEGIN
		DELETE FROM Bookings WHERE BookingID = book_id;
        SELECT CONCAT( 'Booking ', book_id, ' deleted') AS Confirmation;
    END//
DELIMITER ;

CALL CancelBooking(9);



