# Task 1
DELETE FROM Bookings WHERE BookingID IN (1, 2, 3, 4); #must remove foreign key constraint before executing

INSERT INTO Bookings (BookingID, TableNumber, BookingDate, EmployeeID, CustomerID)
VALUES
(1, 5, '2022-10-10',1, 1),
(2, 3, '2022-11-12', 1, 3),
(3, 2, '2022-10-11', 3, 2),
(4, 2, '2022-10-13', 4, 1);

#Task 2
DROP PROCEDURE IF EXISTS CheckBooking; 

DELIMITER //
CREATE PROCEDURE CheckBookings( IN chk_date DATE, IN chk_table INT)
	BEGIN
		DECLARE message VARCHAR(40);
        DECLARE booking_num INT;
        SELECT BookingID INTO booking_num FROM Bookings 
			WHERE TableNumber = chk_table AND BookingDate = chk_date;
		IF booking_num IS NULL THEN
			SET message = CONCAT('Table ', chk_table, ' is not booked');
		ELSE
			SET message = CONCAT('Table ', chk_table, ' is booked');
		END IF;
        SELECT message AS 'Booking Status';
    END//
DELIMITER ;

CALL CheckBookings('2022-10-10', 5); #should be booked
CALL CheckBookings('2022-10-10', 1); #should not be booked

#Task3 
# Note: I had to remove the foreign key constraint on BookingID to make this procedure usable- I will leave it off
DROP PROCEDURE IF EXISTS AddValidBooking; 

DELIMITER //
CREATE PROCEDURE AddValidBooking( IN chk_date DATE, IN chk_table INT)
	BEGIN
		DECLARE message VARCHAR(40);
        DECLARE booking_num INT;
        SELECT BookingID INTO booking_num FROM Bookings 
			WHERE TableNumber = chk_table AND BookingDate = chk_date;
            
		START TRANSACTION;
        INSERT INTO Bookings (TableNumber, BookingDate) VALUES (chk_table, chk_date);
		IF booking_num IS NULL THEN 
			COMMIT;
			SET message = CONCAT('Table ', chk_table, ' is not booked. Booking made.');
		ELSE
			ROLLBACK;
			SET message = CONCAT('Table ', chk_table, ' is booked. Booking not made.');
		END IF;
        SELECT message AS 'Booking Status';
    END//
DELIMITER ;

CALL AddValidBooking('2022-10-10', 5); #should be booked
CALL AddValidBooking('2022-10-10', 13); #should not be booked
