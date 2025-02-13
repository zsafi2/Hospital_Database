DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Rooms (
    Room_ID INT NOT NULL,
    Room_Number VARCHAR(10),
    Capacity INT,
    Nightly_Fee DECIMAL(10, 2),
    PRIMARY KEY (Room_ID)
);

CREATE TABLE Patients (
    Patient_ID INT NOT NULL,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    PRIMARY KEY (Patient_ID)
);

CREATE TABLE Health_Records (
    Record_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    Disease VARCHAR(100),
    Diagnosis_Date DATE,
    Status VARCHAR(50),
    Description TEXT,
    PRIMARY KEY (Record_ID, Patient_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Physicians (
    Physician_ID INT NOT NULL,
    Name VARCHAR(100),
    Certification_Num VARCHAR(20),
    Field_of_Expertise VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    PRIMARY KEY (Physician_ID)
);

CREATE TABLE Nurses (
    Nurse_ID INT NOT NULL,
    Name VARCHAR(100),
    Certification_Num VARCHAR(20),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    PRIMARY KEY (Nurse_ID)
);

CREATE TABLE Medication (
    Medication_ID INT NOT NULL,
    Name VARCHAR(100),
    Type VARCHAR(50),
    PRIMARY KEY (Medication_ID)
);

CREATE TABLE Instructions (
    Instruction_ID INT NOT NULL,
    Description TEXT,
    Status VARCHAR(50),
    Fee DECIMAL(10, 2),
    PRIMARY KEY (Instruction_ID)
);

CREATE TABLE Invoices (
    Account_Number INT NOT NULL,
    Issue_Date DATE,
    Start_Date DATE,
    End_Date DATE,
    PRIMARY KEY (Account_Number)
);

CREATE TABLE Payables (
    Payable_ID INT NOT NULL,
    Invoice_Account_Number INT NOT NULL,
    Amount DECIMAL(10, 2),
    Date DATE,
    Description TEXT,
    PRIMARY KEY (Payable_ID),
    FOREIGN KEY (Invoice_Account_Number) REFERENCES Invoices(Account_Number)
);

CREATE TABLE Payments (
    Payment_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    Amount DECIMAL(10, 2),
    Date DATE,
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Assigned_Rooms (
    Patient_ID INT NOT NULL,
    Room_ID INT NOT NULL,
    Check_In DATE NOT NULL,
    Check_Out DATE,
    PRIMARY KEY (Patient_ID, Room_ID, Check_In),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);

CREATE TABLE Monitor (
    Physician_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE,
    PRIMARY KEY (Physician_ID, Patient_ID),
    FOREIGN KEY (Physician_ID) REFERENCES Physicians(Physician_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

CREATE TABLE Execute (
    Physician_ID INT NOT NULL,
    Nurse_ID INT NOT NULL,
    Task VARCHAR(255) NOT NULL,
    Status VARCHAR(50),
    PRIMARY KEY (Physician_ID, Nurse_ID, Task),
    FOREIGN KEY (Physician_ID) REFERENCES Physicians(Physician_ID),
    FOREIGN KEY (Nurse_ID) REFERENCES Nurses(Nurse_ID)
);

CREATE TABLE `Order` (
    Physician_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    Instruction_ID INT NOT NULL,
    Order_Date DATE,
    PRIMARY KEY (Physician_ID, Patient_ID, Instruction_ID),
    FOREIGN KEY (Physician_ID) REFERENCES Physicians(Physician_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Instruction_ID) REFERENCES Instructions(Instruction_ID)
);

CREATE TABLE Administers (
    Patient_ID INT NOT NULL,
    Nurse_ID INT NOT NULL,
    Medication_ID INT NOT NULL,
    Administer_Date DATE NOT NULL,
    Amount DECIMAL(10, 2),
    PRIMARY KEY (Patient_ID, Nurse_ID, Medication_ID, Administer_Date),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Nurse_ID) REFERENCES Nurses(Nurse_ID),
    FOREIGN KEY (Medication_ID) REFERENCES Medication(Medication_ID)
);
