START TRANSACTION;

-- Step 1: Assign the room to the patient
INSERT INTO Assigned_Rooms (Patient_ID, Room_ID, Check_In, Check_Out)
VALUES (5, 3, '2024-07-25', '2024-07-26');

-- Step 2: Update the room capacity
UPDATE Rooms
SET Capacity = Capacity - 1
WHERE Room_ID = 101;

COMMIT;


START TRANSACTION;

-- Step 1: Insert the payment record
INSERT INTO Payments (Payment_ID, Patient_ID, Amount, Date)
VALUES (6, 2, 75.00, '2024-07-25');

-- Step 2: Update the invoice payable amount
UPDATE Payables
SET Amount = Amount - 75.00
WHERE Invoice_Account_Number = (
    SELECT Account_Number
    FROM Invoices
    WHERE Patient_ID = 2
);

COMMIT;

START TRANSACTION;

-- Step 1: Insert the order
INSERT INTO `Order` (Physician_ID, Patient_ID, Instruction_ID, Order_Date)
VALUES (5, 2, 2, '2024-07-25');

-- Step 2: Log the medication administration
INSERT INTO Administers (Patient_ID, Nurse_ID, Medication_ID, Administer_Date, Amount)
VALUES (2, 1, 2, '2024-07-25', 2.5);

COMMIT;

