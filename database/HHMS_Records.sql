USE HHMS;
-- Data Seeding for Healthcare and Hospital Management System.
-- select * from hospital_staff;
INSERT INTO hospital_staff (Staff_ID, First_Name, Middle_Name, Last_Name, Gender, Street, City, State, Zipcode, Blood_Group, Contact) VALUES
('1', 'Arjun', 'Kumar', 'Sharma', 'Male', 'M.G. Road', 'Mumbai', 'Maharashtra', '400001', 'O+', '9876543210'),
('2', 'Anjali', 'Devi', 'Nair', 'Female', 'Kanakapura Road', 'Bengaluru', 'Karnataka', '560062', 'A-', '8765432109'),
('3', 'Rahul', 'Prasad', 'Mishra', 'Male', 'Park Street', 'Kolkata', 'West Bengal', '700016', 'B+', '7654321098'),
('4', 'Priya', 'Kumari', 'Patel', 'Female', 'C.G. Road', 'Ahmedabad', 'Gujarat', '380009', 'AB+', '6543210987'),
('5', 'Amit', 'Singh', 'Verma', 'Male', 'Connaught Place', 'New Delhi', 'Delhi', '110001', 'O-', '9123456789'),
('6', 'Vikram', 'Anand', 'Joshi', 'Male', 'J.M. Road', 'Pune', 'Maharashtra', '411004', 'A+', '9812345670'),
('7', 'Sneha', 'Lata', 'Reddy', 'Female', 'Banjara Hills', 'Hyderabad', 'Telangana', '500034', 'B-', '8701234567'),
('8', 'Deepak', 'Kumar', 'Choudhury', 'Male', 'G.S. Road', 'Guwahati', 'Assam', '781005', 'O+', '7698765432'),
('9', 'Meera', 'Rani', 'Pillai', 'Female', 'MG Road', 'Kochi', 'Kerala', '682016', 'AB-', '6587654321'),
('10', 'Rajesh', 'Kumar', 'Yadav', 'Male', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'B+', '9988776655'),
('11', 'Sunita', 'Kumari', 'Das', 'Female', 'Boring Road', 'Patna', 'Bihar', '800001', 'O-', '8899001122'),
('12', 'Rohan', 'Singh', 'Gill', 'Male', 'Sector 17', 'Chandigarh', 'Punjab', '160017', 'A-', '7766554433');

select * from department;
-- desc department;
INSERT INTO Department (Dept_Name, Dept_Locn, Dept_Desc) VALUES
('Cardiology', 'Block A, 1st Floor', 'Deals with heart disorders, angiographies, and bypass care.'),
('Pediatrics', 'Block B, Ground Flr', 'Specialized medical care for infants, children, and adolescents.'),
('Orthopedics', 'Block C, 2nd Floor', 'Focuses on bone surgeries, joint replacements, and fractures.'),
('Neurology', 'Block A, 3rd Floor', 'Handles brain, spinal cord, and nervous system disorders.'),
('Emergency & Trauma', 'Block E, G Flr', '24/7 critical care, accident response, and urgent triage.');
-- desc ward;
-- select * from ward;
INSERT INTO Ward (Ward_Type, Location, Patient_Capacity) VALUES
('General', 'Male Medical Ward, 2nd Floor', 30),
('ICU', 'Critical Care Unit, Block B, 1st Floor', 12),
('Private', 'Deluxe Wing, 4th Floor', 1),
('General', 'Female Surgical Ward, 2nd Floor', 25),
('ICU', 'Neonatal ICU (NICU), Block B, Ground Flr', 8);
-- desc lab;
-- select * from lab;
INSERT INTO Lab (Lab_Name, Location, Contact) VALUES
('Pathology Lab', 'Basement, Main Block', '022-61234561'),
('Radiology & Imaging', 'Ground Floor, Block C', '022-61234562'),
('Microbiology Lab', '1st Floor, Diagnostic Wing', '022-61234563'),
('Biochemistry Lab', 'Basement, Diagnostic Wing', '022-61234564'),
('Hematology Lab', '2nd Floor, Main Block', '022-61234565');
desc medicine;
select * from medicine;
INSERT INTO Medicine (Medicine_ID, Medicine_Name, Strength, State) VALUES
('MED-PAR-650', 'Paracetamol', '650 mg', 'Syrup'),
('MED-PAN-040', 'Pantoprazole', '40 mg', 'Tablet'),
('MED-AMX-500', 'Amoxicillin', '500 mg', 'Capsule'),
('MED-CET-010', 'Cetirizine', '10 mg', 'Tablet'),
('MED-AZI-500', 'Azithromycin', '500 mg', 'Lotion');

-- desc doctor;
-- select * from doctor;
INSERT INTO  Doctor (Doctor_ID,Dept_ID,Experience) VALUES 
(2,4,1),
(3,5,3),
(11,1,1),
(5,2,0),
(9,1,5),
(12,3,2);
-- desc nurse ;
-- select * from nurse ;
INSERT INTO nurse  (Nurse_ID,Age,Shift,Ward_ID) VALUES 
(1,26,'Morning',2),
(4,31,'Night',5),
(6,28,'Afternoon',1),
(7,22,'Evening',3),
(8,24,'Morning',4),
(10,29,'Night',2);
-- desc bed ;
-- select * from bed;
INSERT INTO Bed (Ward_ID, Bed_Type, Status) VALUES
(1, 'General', 0),
(1, 'General', 1),
(1, 'General', 1),
(1, 'General', 0),
(2, 'Critical', 0),
(2, 'Critical', 0),
(2, 'Critical', 1),
(3, 'Other', 1),
(4, 'General', 0),
(4, 'General', 0),
(4, 'General', 1),
(4, 'General', 1),
(5, 'Pediatric', 0),
(5, 'Pediatric', 0),
(5, 'Pediatric', 1),
(5, 'Pediatric', 1);

-- desc patient ;
-- select * from patient;
INSERT INTO Patient (First_Name, Last_Name, Gender, DOB, Street_Name, City, State, Zipcode, Blood_Group, Contact) VALUES
( 'Rajesh', 'Kumar', 'Male', '1985-04-12', 'M.G. Road', 'Mumbai', 'Maharashtra', 400001, 'O+', '9876500001'),
( 'Sunita', 'Sharma', 'Female', '1992-08-23', 'Link Road', 'Delhi', 'Delhi', 110001, 'A+', '9876500002'),
( 'Aravind', 'Nair', 'Male', '1978-11-05', 'K.P. Road', 'Bengaluru', 'Karnataka', 560001, 'B-', '9876500003'),
( 'Kiran', 'Patel', 'Others', '1995-02-17', 'C.G. Road', 'Ahmedabad', 'Gujarat', 380009, 'AB+', '9876500004'),
( 'Meenakshi', 'Iyer', 'Female', '2001-06-30', 'Avinashi Road', 'Coimbatore', 'Tamil Nadu', 641018, 'O-', '9876500005'),
( 'Amit', 'Mishra', 'Male', '1967-09-14', 'Park Street', 'Kolkata', 'West Bengal', 700016, 'B+', '9876500006'),
( 'Sneha', 'Reddy', 'Female', '1989-12-05', 'Road No 12', 'Hyderabad', 'Telangana', 500034, 'A-', '9876500007'),
( 'Vikram', 'Joshi', 'Male', '1974-03-22', 'J.M. Road', 'Pune', 'Maharashtra', 411004, 'O+', '9876500008'),
( 'Priya', 'Das', 'Female', '1998-05-19', 'Boring Road', 'Patna', 'Bihar', 800001, 'AB-', '9876500009'),
( 'Rohan', 'Gill', 'Male', '1993-01-25', 'Sector 17', 'Chandigarh', 'Punjab', 160017, 'B+', '9876500010'),
( 'Ananya', 'Choudhury', 'Female', '2005-07-08', 'G.S. Road', 'Guwahati', 'Assam', '781005', 'O+', '9876500011'),
( 'Sanjay', 'Yadav', 'Male', '1960-10-31', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', 226001, 'A+', '9876500012'),
( 'Deepika', 'Pillai', 'Female', '1982-04-03', 'MG Road', 'Kochi', 'Kerala', 682016, 'B-', '9876500013'),
( 'Vijay', 'Mehta', 'Male', '1955-11-20', 'Station Road', 'Jaipur', 'Rajasthan', 302006, 'AB+', '9876500014'),
( 'Rahul', 'Sen', 'Others', '1990-02-14', 'Salt Lake', 'Kolkata', 'West Bengal', 700091, 'O-', '9876500015');
-- desc appointment ;
-- select * from appointment;
INSERT INTO Appointment (Patient_ID, Doctor_ID, Appointment_Date, Slot, Status) VALUES
(1, 9, '2026-10-01', '09:30:00', 'Completed'),
(2, 5, '2026-10-01', '10:15:00', 'Completed'),
(3, 2, '2026-10-01', '11:00:00', 'Cancelled'),
(4, 12, '2026-10-02', '09:30:00', 'Scheduled'),
(5, 3, '2026-10-02', '14:00:00', 'Scheduled'),
(6, 12, '2026-10-02', '16:30:00', 'Scheduled'),
(7, 11, '2026-10-03', '10:00:00', 'Scheduled'),
(8, 9, '2026-10-03', '11:30:00', 'Scheduled'),
(9, 11, '2026-10-03', '12:15:00', 'Scheduled'),
(10, 3, '2026-10-04', '15:00:00', 'Scheduled'),
(11, 5, '2026-10-07', '11:30:00', 'Scheduled'),
(12, 9, '2026-09-01', '09:30:00', 'Completed'),
(13, 12, '2026-11-02', '10:15:00', 'Scheduled'),
(14, 9, '2026-09-02', '15:00:00', 'Cancelled'),
(15, 3, '2026-09-15', '11:00:00', 'Cancelled');
-- desc PATIENT_MEDICAL_RECORD ;
-- select * from PATIENT_MEDICAL_RECORD;
INSERT INTO patient_medical_record (Record_ID, Patient_ID, Doctor_ID, Diagnosis, Treatment, Symptoms, Advice) VALUES
('REC-2026-001', 1, 9, 'Type 2 Diabetes', 'Metformin 500mg daily, dietary adjustments', 'Polyuria, increased thirst, fatigue', 'Low carbohydrate diet, daily morning walks'),
('REC-2026-002', 2, 5, 'Acute Viral Fever', 'Paracetamol 650mg, hydration, bed rest', 'High fever, body ache, chills', 'Check temperature every 4 hours, drink fluids'),
('REC-2026-003', 3, 2, 'Hypertension', 'Amlodipine 5mg once daily', 'Frequent headaches, dizziness', 'Reduce salt intake, avoid stressful activities'),
('REC-2026-004', 4, 12, 'Gastroenteritis', 'ORS fluids, Antibiotics, Probiotics', 'Vomiting, watery diarrhea, stomach cramps', 'Strict bland diet, avoid dairy products for 3 days'),
('REC-2026-005', 5, 3, 'Bronchial Asthma', 'Salbutamol inhaler twice daily as needed', 'Wheezing, shortness of breath, dry cough', 'Avoid dust and smoke, keep inhaler handy'),
('REC-2026-006', 6, 12, 'Migraine', 'Naproxen 500mg during onset, dark room rest', 'Severe unilateral headache, nausea, photophobia', 'Identify triggers, maintain a fixed sleep cycle'),
('REC-2026-007', 7, 11, 'Urinary Tract Infection', 'Course of Nitrofurantoin 100mg for 5 days', 'Burning frequent urination, pelvic pain', 'Drink plenty of water, complete antibiotic course'),
('REC-2026-008', 8, 9, 'Osteoarthritis', 'Physiotherapy sessions, Analgesics as needed', 'Knee joint pain, stiffness in morning', 'Avoid squatting, use knee support while walking'),
('REC-2026-009', 9, 11, 'Iron Deficiency Anemia', 'Iron supplements, Vitamin C tablets', 'Extreme fatigue, pale skin, weakness', 'Include green leafy vegetables and apples in diet'),
('REC-2026-010', 10, 3, 'Acute Tonsillitis', 'Amoxicillin 500mg, warm saline gargles', 'Severe throat pain, difficulty swallowing, fever', 'Avoid cold drinks, rest your throat'),
('REC-2026-011', 11, 5, 'Dengue Fever', 'Symptomatic treatment, platelet monitoring', 'High fever, joint pain, skin rashes', 'Complete bed rest, hospitalize if platelets drop'),
('REC-2026-012', 12, 9, 'Sciatica', 'Lumbar stretch exercises, NSAIDs for pain', 'Radiating pain from lower back to left leg', 'Avoid lifting weights, sleep on hard mattress'),
('REC-2026-013', 13, 12, 'Typhoid Fever', 'Ceftriaxone injection course for 5 days', 'Step-ladder fever, abdominal pain, weakness', 'Eat easily digestible foods, drink boil water'),
('REC-2026-014', 14, 9, 'Cervical Spondylosis', 'Cervical collar usage, physiotherapy', 'Neck pain radiating to shoulders, numbness', 'Maintain proper posture while working on laptop'),
('REC-2026-015', 15, 3, 'Hyperthyroidism', 'Methimazole therapy, beta-blockers', 'Weight loss, tremors, rapid heart rate', 'Regular thyroid profile tests every 6 weeks');
-- desc TEST_ORDER ;
-- select * from TEST_ORDER;
INSERT INTO Test_Order (Appointment_ID, Test_No, Patient_ID, Doctor_ID, Lab_ID, Test_Name, Order_Date, Status) VALUES
(1, 'LAB-TX-001', 1, 9, 4, 'HbA1c Blood Sugar Test', '2026-10-01', 'Completed'),
(1, 'LAB-TX-002', 1, 9, 1, 'Fasting Blood Glucose', '2026-10-01', 'Completed'),
(2, 'LAB-TX-003', 2, 5, 1, 'Complete Blood Count', '2026-10-01', 'Completed'),
(4, 'LAB-TX-004', 4, 12, 3, 'Stool Culture Routine', '2026-10-02', 'Pending'),
(5, 'LAB-TX-005', 5, 3, 2, 'Chest X-Ray PA View', '2026-10-02', 'Sample Collected'),
(6, 'LAB-TX-006', 6, 12, 5, 'Serum Electrolytes', '2026-10-02', 'Pending'),
(7, 'LAB-TX-007', 7, 11, 3, 'Urine Routine & Culture', '2026-10-03', 'Pending'),
(8, 'LAB-TX-008', 8, 9, 2, 'X-Ray Knee Joint AP', '2026-10-03', 'Sample Collected'),
(9, 'LAB-TX-009', 9, 11, 5, 'Serum Iron Profile', '2026-10-03', 'Pending'),
(10, 'LAB-TX-010', 10, 3, 3, 'Throat Swab Culture', '2026-10-04', 'Pending');
-- desc TEST_RESULT ;
-- select * from TEST_RESULT;
INSERT INTO Test_Result (Result_ID, Appointment_ID, Test_No, Result_Date, Report) VALUES
(501, 1, 'LAB-TX-001', '2026-10-02', 'HbA1c level is 7.4 percent, indicating poorly controlled blood sugar levels. Diabetic management optimization required.'),
(502, 1, 'LAB-TX-002', '2026-10-02', 'Fasting Blood Glucose is 148 mg/dL. Confirms hyperglycemia in line with elevated glycosylated hemoglobin findings.'),
(503, 2, 'LAB-TX-003', '2026-10-01', 'Complete Blood Count shows an elevated WBC count of 12,500 cells/mcL, indicating acute viral or bacterial infection.');
-- desc PRESCRIPTIONS ;
-- select * from PRESCRIPTIONS;
INSERT INTO Prescriptions (Record_ID, Prescription_Date, Instructions) VALUES
('REC-2026-001', '2026-10-01', '1 tab daily after food'),
('REC-2026-002', '2026-10-01', '1 tab thrice daily'),
('REC-2026-003', '2026-10-01', '1 tab every morning'),
('REC-2026-004', '2026-10-02', 'Take ORS fluids regularly'),
('REC-2026-005', '2026-10-02', 'Inhale twice a day');
-- desc PRESCRIPTION_ITEM ;
-- select * from PRESCRIPTION_ITEM;
INSERT INTO PRESCRIPTION_ITEM (Prescription_ID, Medicine_ID, Dosage, Duration, Frequency) VALUES
(1, 'MED-PAN-040', '40 mg', '30 Days', '1-0-0'),
(2, 'MED-PAR-650', '650 mg', '5 Days', '1-1-1'),
(3, 'MED-CET-010', '10 mg', '10 Days', '0-0-1'),
(4, 'MED-AMX-500', '500 mg', '5 Days', '1-0-1'),
(5, 'MED-AZI-500', '500 mg', '3 Days', '1-0-0');
-- desc BILL ;
-- select * from BILL;
INSERT INTO Bill (Patient_ID, Bill_Date, Total_Amount, Discount, Bill_Status) VALUES
(1, '2026-10-02', 1500.00, 150.00, 'Paid'),
(2, '2026-10-02', 850.00, 0.00, 'Paid'),
(3, '2026-10-01', 3400.00, 200.00, 'Partial'),
(4, '2026-10-02', 1200.50, 0.00, 'Pending'),
(5, '2026-10-03', 5800.00, 500.00, 'Paid');
-- desc PAYMENT ;
-- select * from PAYMENT;
INSERT INTO Payment (Bill_ID, Amount, Payment_Mode, Payment_Date) VALUES
(1, 1350.00, 'Cashless', '2026-10-02'),
(2, 850.00, 'Cash', '2026-10-02'),
(3, 1500.00, 'Cashless', '2026-10-01'), 
(5, 5300.00, 'Insurance', '2026-10-03'),
(3, 1700.00, 'Cash', '2026-10-04');    
