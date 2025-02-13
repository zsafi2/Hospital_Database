USE hospital;

-- Insert data into Rooms
INSERT INTO Rooms (Room_ID, Room_Number, Capacity, Nightly_Fee) VALUES
(1, '101', 2, 150.00),
(2, '102', 1, 100.00),
(3, '103', 3, 200.00),
(4, '104', 2, 175.00),
(5, '105', 1, 125.00);

-- Insert data into Patients
INSERT INTO Patients (Patient_ID, Name, Address, Phone) VALUES
(1, 'John Doe', '123 Elm Street', '555-1234'),
(2, 'Jane Smith', '456 Oak Avenue', '555-5678'),
(3, 'Alice Johnson', '789 Pine Road', '555-8765'),
(4, 'Bob Brown', '135 Maple Lane', '555-4321'),
(5, 'Carol White', '246 Birch Boulevard', '555-6789');

-- Insert data into Health_Records
INSERT INTO Health_Records (Record_ID, Patient_ID, Disease, Diagnosis_Date, Status, Description) VALUES
(1, 1, 'Flu', '2024-01-15', 'Ongoing', 'Seasonal flu with fever and cough'),
(2, 2, 'Diabetes', '2023-12-05', 'Resolved', 'Type 2 diabetes, stable condition'),
(3, 3, 'Hypertension', '2024-02-20', 'Ongoing', 'High blood pressure, needs monitoring'),
(4, 4, 'Asthma', '2024-03-10', 'Ongoing', 'Chronic asthma, requires medication'),
(5, 5, 'Back Pain', '2024-04-22', 'Resolved', 'Lower back pain, physical therapy completed');

-- Insert data into Physicians
INSERT INTO Physicians (Physician_ID, Name, Certification_Num, Field_of_Expertise, Address, Phone) VALUES
(1, 'Dr. Emily Adams', 'Cert12345', 'Internal Medicine', '321 Medical Park', '555-9876'),
(2, 'Dr. James Clark', 'Cert67890', 'Cardiology', '654 Health Street', '555-5432'),
(3, 'Dr. Linda Carter', 'Cert11223', 'Orthopedics', '987 Wellness Road', '555-6780'),
(4, 'Dr. Robert Lee', 'Cert44556', 'Pediatrics', '135 Doctor Avenue', '555-1239'),
(5, 'Dr. Susan Miller', 'Cert78901', 'Neurology', '246 Clinic Drive', '555-3456');

-- Insert data into Nurses
INSERT INTO Nurses (Nurse_ID, Name, Certification_Num, Address, Phone) VALUES
(1, 'Nurse Lisa Green', 'CertA123', '789 Nursing Lane', '555-9876'),
(2, 'Nurse Mark Harris', 'CertB456', '456 Care Road', '555-6543'),
(3, 'Nurse Sarah Lewis', 'CertC789', '321 Health Drive', '555-7890'),
(4, 'Nurse Thomas Young', 'CertD012', '654 Clinic Lane', '555-3210'),
(5, 'Nurse Emily Scott', 'CertE345', '987 Wellness Blvd', '555-4320');

-- Insert data into Medication
INSERT INTO Medication (Medication_ID, Name, Type) VALUES
(1, 'Aspirin', 'Painkiller'),
(2, 'Metformin', 'Antidiabetic'),
(3, 'Lisinopril', 'Antihypertensive'),
(4, 'Albuterol', 'Bronchodilator'),
(5, 'Ibuprofen', 'Anti-inflammatory');

-- Insert data into Instructions
INSERT INTO Instructions (Instruction_ID, Description, Status, Fee) VALUES
(1, 'Administer insulin', 'Completed', 50.00),
(2, 'Perform ECG', 'Pending', 75.00),
(3, 'Prescribe antibiotics', 'Completed', 30.00),
(4, 'Schedule X-ray', 'In Progress', 100.00),
(5, 'Provide physical therapy', 'Completed', 200.00);

-- Insert data into Invoices
INSERT INTO Invoices (Account_Number, Issue_Date, Start_Date, End_Date) VALUES
(1, '2024-05-01', '2024-04-01', '2024-04-30'),
(2, '2024-05-15', '2024-04-15', '2024-04-30'),
(3, '2024-06-01', '2024-05-01', '2024-05-31'),
(4, '2024-06-15', '2024-05-15', '2024-05-31'),
(5, '2024-07-01', '2024-06-01', '2024-06-30');

-- Insert data into Payables
INSERT INTO Payables (Payable_ID, Invoice_Account_Number, Amount, Date, Description) VALUES
(1, 1, 200.00, '2024-04-05', 'Room Charges'),
(2, 2, 75.00, '2024-04-20', 'Medication'),
(3, 3, 150.00, '2024-05-10', 'Room Charges'),
(4, 4, 100.00, '2024-05-20', 'Instructions'),
(5, 5, 180.00, '2024-06-10', 'Medication and Room Charges');

-- Insert data into Payments
INSERT INTO Payments (Payment_ID, Patient_ID, Amount, Date) VALUES
(1, 1, 200.00, '2024-04-06'),
(2, 2, 75.00, '2024-04-21'),
(3, 3, 150.00, '2024-05-12'),
(4, 4, 100.00, '2024-05-22'),
(5, 5, 180.00, '2024-06-12');

-- Insert data into Assigned_Rooms
INSERT INTO Assigned_Rooms (Patient_ID, Room_ID, Check_In, Check_Out) VALUES
(1, 1, '2024-04-01', '2024-04-05'),
(2, 2, '2024-04-15', '2024-04-20'),
(3, 3, '2024-05-01', '2024-05-05'),
(4, 4, '2024-05-15', '2024-05-20'),
(5, 5, '2024-06-01', '2024-06-05');

-- Insert data into Monitor
INSERT INTO Monitor (Physician_ID, Patient_ID, Start_Date, End_Date) VALUES
(1, 1, '2024-04-01', '2024-04-05'),
(2, 2, '2024-04-15', '2024-04-20'),
(3, 3, '2024-05-01', '2024-05-05'),
(4, 4, '2024-05-15', '2024-05-20'),
(5, 5, '2024-06-01', '2024-06-05');

-- Insert data into Execute
INSERT INTO Execute (Physician_ID, Nurse_ID, Task, Status) VALUES
(1, 1, 'Administer insulin', 'Completed'),
(2, 2, 'Perform ECG', 'Pending'),
(3, 3, 'Prescribe antibiotics', 'Completed'),
(4, 4, 'Schedule X-ray', 'In Progress'),
(5, 5, 'Provide physical therapy', 'Completed');

-- Insert data into `Order`
INSERT INTO `Order` (Physician_ID, Patient_ID, Instruction_ID, Order_Date) VALUES
(1, 1, 1, '2024-04-01'),
(2, 2, 2, '2024-04-15'),
(3, 3, 3, '2024-05-01'),
(4, 4, 4, '2024-05-15'),
(5, 5, 5, '2024-06-01');

-- Insert data into Administers
INSERT INTO Administers (Patient_ID, Nurse_ID, Medication_ID, Administer_Date, Amount) VALUES
(1, 1, 1, '2024-04-01', 2),
(2, 2, 2, '2024-04-15', 1),
(3, 3, 3, '2024-05-01', 3),
(4, 4, 4, '2024-05-15', 1),
(5, 5, 5, '2024-06-01', 4);
