SHOW DATABASES;
USE hhms;
-- Display the Total Appointment in order as Scheduled -> Completed -> Cancelled 
SELECT Appointment_ID , Patient_ID , Status FROM Appointment WHERE Status='Scheduled'

UNION

SELECT Appointment_ID , Patient_ID, Status FROM Appointment WHERE Status='Completed' 

UNION

SELECT Appointment_ID , Patient_ID ,Status FROM Appointment WHERE Status='Cancelled';

-- SELECT * FROM Staff_ID WHERE 
select * from hospital_Staff;
INSERT INTO Hospital_Staff (Staff_ID, First_Name, Middle_Name, Last_Name, Gender, Street, City, State, Zipcode, Blood_Group, Contact) VALUES 
('13', 'Arun', 'Kumar', 'Sharma', 'Male', 'M.G. Road', 'Mumbai', 'Maharashtra', '400001', 'O+', '9876543210'),
('14', 'Arun', 'Kumar', 'Sharma', 'Male', 'M.G. Road', 'Mumbai', 'Maharashtra', '400001', 'O+', '9654371078');

INSERT INTO Nurse  (Nurse_ID,Age,Shift,Ward_ID) VALUES 
(13,26,'Morning',2);


CREATE TABLE Intern_Grp_A (
    ID INT,
    Name VARCHAR(50),
    City VARCHAR(50)
);
INSERT INTO Intern_Grp_A
VALUES
(201, 'Aarav Patel', 'Mumbai'),
(202, 'Riya Shah', 'Pune'),
(203, 'Karan Joshi', 'Mumbai'),
(204, 'Sneha Patil', 'Nashik'),
(205, 'Rahul Gupta', 'Pune');


CREATE TABLE Intern_Grp_B (
    ID INT,
    Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Intern_Grp_B
VALUES
(203, 'Karan Joshi', 'Mumbai'),
(204, 'Sneha Patil', 'Nashik'),
(206, 'Ananya Deshmukh', 'Mumbai'),
(207, 'Vivek Kulkarni', 'Nagpur'),
(208, 'Meera Joshi', 'Pune');



INSERT INTO  Doctor (Doctor_ID,Dept_ID,Experience) VALUES 
(14,4,1);

SELECT * FROM Intern_Grp_A

UNION ALL 

SELECT  * FROM Intern_Grp_B;

-- AIM,THEORY,CONCLUSION INCLUDE IN THE ALL EXP FILES TO BE UPLOADED.
CREATE TABLE Grp_A (
    Intern_ID INT,
    Name VARCHAR(50)
);

INSERT INTO Grp_A VALUES
(201, 'Aarav'),
(202, 'Riya'),
(202, 'Riya'),
(203, 'Karan');

CREATE TABLE Grp_B (
    Intern_ID INT,
    Name VARCHAR(50)
);

INSERT INTO Grp_B VALUES
(202, 'Riya'),
(202, 'Riya'),
(204, 'Sneha');


SELECT Name FROM Intern_Grp_A 

INTERSECT 

SELECT  Name FROM Intern_Grp_B ;


SELECT Name FROM Grp_A 

INTERSECT ALL

SELECT  Name FROM Grp_B ;



