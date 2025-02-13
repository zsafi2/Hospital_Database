DELIMITER //

CREATE TRIGGER UpdateRoomCapacity
AFTER INSERT ON Assigned_Rooms
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET Capacity = Capacity - 1
    WHERE Room_ID = NEW.Room_ID;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER UpdateInvoiceDate
BEFORE UPDATE ON Invoices
FOR EACH ROW
BEGIN
    IF NEW.Start_Date != OLD.Start_Date THEN
        SET NEW.Issue_Date = CURDATE();
    END IF;
END //

DELIMITER ;

