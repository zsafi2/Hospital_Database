CREATE VIEW PatientDetails AS
SELECT 
    p.Patient_ID, 
    p.Name AS Patient_Name, 
    p.Address AS Patient_Address, 
    p.Phone AS Patient_Phone, 
    hr.Record_ID, 
    hr.Disease, 
    hr.Diagnosis_Date, 
    hr.Status AS Health_Status, 
    hr.Description AS Health_Description
FROM 
    Patients p
JOIN 
    Health_Records hr ON p.Patient_ID = hr.Patient_ID;
    
CREATE VIEW RoomOccupancy AS
SELECT 
    r.Room_ID, 
    r.Room_Number, 
    r.Capacity, 
    r.Nightly_Fee, 
    ar.Patient_ID, 
    p.Name AS Patient_Name, 
    ar.Check_In, 
    ar.Check_Out
FROM 
    Rooms r
JOIN 
    Assigned_Rooms ar ON r.Room_ID = ar.Room_ID
JOIN 
    Patients p ON ar.Patient_ID = p.Patient_ID;


CREATE VIEW PhysicianPatientMonitor AS
SELECT 
    ph.Physician_ID, 
    ph.Name AS Physician_Name, 
    ph.Field_of_Expertise, 
    m.Patient_ID, 
    p.Name AS Patient_Name, 
    m.Start_Date, 
    m.End_Date
FROM 
    Physicians ph
JOIN 
    Monitor m ON ph.Physician_ID = m.Physician_ID
JOIN 
    Patients p ON m.Patient_ID = p.Patient_ID;


CREATE VIEW NurseMedicationAdministration AS
SELECT 
    n.Nurse_ID, 
    n.Name AS Nurse_Name, 
    a.Patient_ID, 
    p.Name AS Patient_Name, 
    a.Medication_ID, 
    m.Name AS Medication_Name, 
    a.Administer_Date, 
    a.Amount
FROM 
    Nurses n
JOIN 
    Administers a ON n.Nurse_ID = a.Nurse_ID
JOIN 
    Patients p ON a.Patient_ID = p.Patient_ID
JOIN 
    Medication m ON a.Medication_ID = m.Medication_ID;

CREATE VIEW InvoiceDetails AS
SELECT 
    i.Account_Number, 
    i.Issue_Date, 
    i.Start_Date, 
    i.End_Date, 
    p.Payable_ID, 
    p.Amount AS Payable_Amount, 
    p.Date AS Payable_Date, 
    p.Description AS Payable_Description
FROM 
    Invoices i
JOIN 
    Payables p ON i.Account_Number = p.Invoice_Account_Number;


select * from PatientDetails;
select * from RoomOccupancy;
select * from PhysicianPatientMonitor;
select * from NurseMedicationAdministration;
select * from InvoiceDetails;

