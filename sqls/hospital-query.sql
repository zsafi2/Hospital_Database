-- Query 1: Retrieve all patients along with their assigned room information.
SELECT 
    Patients.Patient_ID,
    Patients.Name AS Patient_Name,
    Rooms.Room_ID,
    Rooms.Room_Number,
    Assigned_Rooms.Check_In,
    Assigned_Rooms.Check_Out
FROM 
    Patients
JOIN 
    Assigned_Rooms ON Patients.Patient_ID = Assigned_Rooms.Patient_ID
JOIN 
    Rooms ON Assigned_Rooms.Room_ID = Rooms.Room_ID;

-- Query 2: List physicians and the patients they monitor along with the start 
-- and end dates of monitoring.
SELECT 
    Physicians.Physician_ID,
    Physicians.Name AS Physician_Name,
    Patients.Name AS Patient_Name,
    Monitor.Start_Date,
    Monitor.End_Date
FROM 
    Physicians
JOIN 
    Monitor ON Physicians.Physician_ID = Monitor.Physician_ID
JOIN 
    Patients ON Monitor.Patient_ID = Patients.Patient_ID;

-- Query 3: Retrieve medication administrations along with patient and nurse details.
SELECT 
    Patients.Name AS Patient_Name,
    Nurses.Name AS Nurse_Name,
    Medication.Name AS Medication_Name,
    Administers.Administer_Date,
    Administers.Amount
FROM 
    Administers
JOIN 
    Patients ON Administers.Patient_ID = Patients.Patient_ID
JOIN 
    Nurses ON Administers.Nurse_ID = Nurses.Nurse_ID
JOIN 
    Medication ON Administers.Medication_ID = Medication.Medication_ID;

-- Query 4: List the physicians and the instructions they have ordered for patients, 
-- including the order date.
SELECT 
    Physicians.Name AS Physician_Name,
    Patients.Name AS Patient_Name,
    Instructions.Description AS Instruction_Description,
    `Order`.Order_Date
FROM 
    `Order`
JOIN 
    Physicians ON `Order`.Physician_ID = Physicians.Physician_ID
JOIN 
    Patients ON `Order`.Patient_ID = Patients.Patient_ID
JOIN 
    Instructions ON `Order`.Instruction_ID = Instructions.Instruction_ID;

-- Query 5: Get the list of nurses and the tasks they have executed along with their status.
SELECT 
    Nurses.Name AS Nurse_Name,
    Execute.Task,
    Execute.Status
FROM 
    Execute
JOIN 
    Nurses ON Execute.Nurse_ID = Nurses.Nurse_ID;

-- Query 6: Retrieve the average nightly fee for rooms that are currently assigned to patients.
SELECT 
    AVG(Rooms.Nightly_Fee) AS Average_Nightly_Fee
FROM 
    Rooms
JOIN 
    Assigned_Rooms ON Rooms.Room_ID = Assigned_Rooms.Room_ID;


-- Query 7: Calculate the total amount of payables for each invoice.
SELECT 
    Invoices.Account_Number,
    SUM(Payables.Amount) AS Total_Payable
FROM 
    Invoices
JOIN 
    Payables ON Invoices.Account_Number = Payables.Invoice_Account_Number
GROUP BY 
    Invoices.Account_Number;

-- Query 8: Find the average fee of instructions.
SELECT 
    AVG(Instructions.Fee) AS Average_Fee
FROM 
    Instructions;

-- Query 9: Count the number of medications administered to each patient.
SELECT 
    Patients.Name AS Patient_Name,
    COUNT(Administers.Medication_ID) AS Number_of_Medications
FROM 
    Patients
JOIN 
    Administers ON Patients.Patient_ID = Administers.Patient_ID
GROUP BY 
    Patients.Name;

-- Query 10: Sum the total payments made by each patient.
SELECT 
    Patients.Name AS Patient_Name,
    SUM(Payments.Amount) AS Total_Paid
FROM 
    Patients
JOIN 
    Payments ON Patients.Patient_ID = Payments.Patient_ID
GROUP BY 
    Patients.Name;


-- Query 11: Retrieve the details of instructions that have been ordered the most.
SELECT 
    Instructions.Description,
    COUNT(`Order`.Instruction_ID) AS Number_of_Orders
FROM 
    Instructions
JOIN 
    `Order` ON Instructions.Instruction_ID = `Order`.Instruction_ID
GROUP BY 
    Instructions.Description
ORDER BY 
    Number_of_Orders DESC
LIMIT 1;


-- Query 12: Retrieve the details of all patients who have been prescribed an instruction by a 
-- physician whose field of expertise is 'Cardiology'
SELECT *
FROM Patients 
WHERE Patient_ID IN (
    SELECT `Order`.Patient_ID
    FROM `Order`
    JOIN Physicians ON Physicians.Physician_ID = `Order`.Physician_ID
    WHERE Field_of_Expertise = 'Cardiology'
);

-- Query 13: Find the names of nurses who have administered medication to 
-- patients diagnosed with 'Hypertension'
SELECT Nurses.Name
FROM Nurses
WHERE Nurse_ID IN (
    SELECT Administers.Nurse_ID
    FROM Administers
    JOIN Patients ON Administers.Patient_ID = Patients.Patient_ID
    JOIN Health_Records ON Patients.Patient_ID = Health_Records.Patient_ID
    WHERE Health_Records.Disease = 'Hypertension'
);

-- Query 14:  Find the total amount payable for each invoice
SELECT Invoices.Account_Number, SUM(Payables.Amount) AS TotalPayable
FROM Invoices
JOIN Payables ON Invoices.Account_Number = Payables.Invoice_Account_Number
WHERE Invoices.Account_Number IN (
    SELECT Payables.Invoice_Account_Number
    FROM Payables
)
GROUP BY Invoices.Account_Number;

-- Query 15: List the room details for rooms that are currently 
-- assigned to patients with the disease 'Asthma'
SELECT *
FROM Rooms
WHERE Room_ID IN (
    SELECT Assigned_Rooms.Room_ID
    FROM Assigned_Rooms
    JOIN Patients ON Assigned_Rooms.Patient_ID = Patients.Patient_ID
    JOIN Health_Records ON Patients.Patient_ID = Health_Records.Patient_ID
    WHERE Health_Records.Disease = 'Asthma'
);
