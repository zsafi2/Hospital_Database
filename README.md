# Hospital Management Database System

This repository contains a **Hospital Management Database System** designed to handle core hospital operations—such as patient management, room assignments, physician/nurse tasks, and billing. It was created by **Zaheer Safi**, in collaboration with **Rizwan Mohammad** and **Sammy Dandu**, under **Professor Sara Riazi**.

## Overview

The system demonstrates:
- **Patients**: storing personal and health record information  
- **Physicians & Nurses**: managing expertise, assigned tasks, and interactions with patients  
- **Rooms**: assigning patients, tracking check-in/check-out dates, and updating capacity  
- **Invoices, Payables, and Payments**: recording billing details and patient payments  

The design ensures proper relationships, data integrity, and convenient information retrieval through well-structured schemas, queries, and (optionally) triggers/transactions.

---

## Entity-Relationship Diagram (ERD)

This project follows an **Enhanced Entity-Relationship Diagram (EERD)** model to design and organize hospital data efficiently. The model includes:
- **Primary entities**: Patients, Physicians, Nurses, Rooms, Health Records, Invoices, Payments, and Medications.  
- **Key relationships**: Room assignments, physician monitoring, medication administration, and financial transactions.  
- **Database constraints**: Ensuring referential integrity and handling many-to-many relationships.  

Refer to the **EERD diagram** provided in the repository for a visual representation.

---

## Assumptions

- **Composite Key for Health Records**: Uses `(Patient_ID, Record_ID)` for uniqueness.  
- **Multivalued Field of Expertise for Physicians**: A physician can specialize in multiple fields.  
- **Tracking Multiple Medications and Tasks**: Medication administration and tasks execution tables allow multiple entries.  
- **Detailed Tracking of Invoices and Payments**: Patients can have multiple invoices and payments linked.  
- **Non-overlapping Payables**: Each payable entry is unique and associated with a specific invoice.  
- **Order Dates for Instructions**: Orders are time-stamped to track chronological medical history.  
- **Handling Room Assignments**: Rooms can be assigned to different patients with unique check-in/check-out dates.  

---

## Database Schema

### **Tables and Primary Keys**
The database consists of multiple tables, each with defined primary and foreign keys:

- **Rooms** (`Room_ID`, `Room_Number`, `Capacity`, `Nightly_Fee`)
- **Patients** (`Patient_ID`, `Name`, `Address`, `Phone`)
- **Health Records** (`Record_ID`, `Patient_ID`, `Disease`, `Diagnosis_Date`, `Status`, `Description`)
- **Physicians** (`Physician_ID`, `Name`, `Certification_Num`, `Field_of_Expertise`, `Address`, `Phone`)
- **Nurses** (`Nurse_ID`, `Name`, `Certification_Num`, `Address`, `Phone`)
- **Medication** (`Medication_ID`, `Name`, `Type`)
- **Instructions** (`Instruction_ID`, `Description`, `Status`, `Fee`)
- **Invoices** (`Account_Number`, `Issue_Date`, `Start_Date`, `End_Date`)
- **Payables** (`Payable_ID`, `Invoice_Account_Number`, `Amount`, `Date`, `Description`)
- **Payments** (`Payment_ID`, `Patient_ID`, `Amount`, `Date`)
- **Assigned Rooms** (`Patient_ID`, `Room_ID`, `Check_In`, `Check_Out`)
- **Monitor** (`Physician_ID`, `Patient_ID`, `Start_Date`, `End_Date`)
- **Execute** (`Physician_ID`, `Nurse_ID`, `Task`, `Status`)
- **Order** (`Physician_ID`, `Patient_ID`, `Instruction_ID`, `Order_Date`)
- **Administers** (`Patient_ID`, `Nurse_ID`, `Medication_ID`, `Administer_Date`, `Amount`)

All primary and foreign keys are detailed in the `.sql` schema files.

---

## How to Run

### 1. Clone or Download the Repository
```bash
git clone https://github.com/your-username/hospital-management-db.git
