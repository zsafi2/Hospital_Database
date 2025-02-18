# Hospital Management Database System

This repository contains a **Hospital Management Database System** designed to handle core hospital operations—such as patient management, room assignments, physician/nurse tasks, and billing. It was created by **Zaheer Safi**, in collaboration with **Rizwan Mohammad** and **Sammy Dandu**, under **Professor Sara Riazi**.

## Overview

The system demonstrates:
- **Patients**: Storing personal and health record information  
- **Physicians & Nurses**: Managing expertise, assigned tasks, and interactions with patients  
- **Rooms**: Assigning patients, tracking check-in/check-out dates, and updating capacity  
- **Invoices, Payables, and Payments**: Recording billing details and patient payments  

The design ensures proper relationships, data integrity, and convenient information retrieval through well-structured schemas, queries, and (optionally) triggers/transactions.

## How to Run

1. **Clone or Download** the repository:
   ```bash
   git clone https://github.com/your-username/hospital-management-db.git
Create the Database
Use your preferred SQL client (e.g., MySQL, PostgreSQL, etc.).
Run the .sql scripts provided in the repository to create tables and relationships.
Insert Data (Optional)
Optionally run the sample data scripts (if included) or create your own test data.
Execute Queries
Run the queries in your client to retrieve or manipulate data (e.g., list patients, check room capacities, process invoices, etc.).
Test Any Triggers or Transactions (if provided)
Perform the specified operations (INSERT, UPDATE, DELETE) to see automatic updates or rollbacks in action.
Usage
Hospital Staff can look up patient information, assign rooms, and manage daily tasks.
Admin/Finance teams can generate invoices, record payments, and track payables.
Developers can adapt or extend this schema to suit similar real-world database requirements.
Contributing
Fork the repository.
Create a new branch:
bash
Copy
Edit
git checkout -b feature-name
Commit your changes:
bash
Copy
Edit
git commit -m "Add some feature"
Push to the branch:
bash
Copy
Edit
git push origin feature-name
Create a Pull Request to merge your changes.
License
This project is provided for educational purposes. Feel free to adapt or modify it, but please include attribution to the original authors and professor if you incorporate major sections of this design.
