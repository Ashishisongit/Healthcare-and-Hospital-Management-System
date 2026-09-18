
-- Databse for Healthcare and Hospital Management System.
CREATE DATABASE HHMS;
USE HHMS;

CREATE TABLE HOSPITAL_STAFF(
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(15) NOT NULL,
    Middle_Name VARCHAR(15) DEFAULT NULL,
    Last_Name VARCHAR(15) NOT NULL,
    Gender ENUM('MALE','FEMALE','OTHERS'),
    Street VARCHAR(15) NOT NULL,
    City VARCHAR(15) NOT NULL,
    State VARCHAR(15) NOT NULL,
    Zipcode INT NOT NULL,
    Blood_Group VARCHAR(15),
    Contact VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE DEPARTMENT(
    Dept_ID INT AUTO_INCREMENT PRIMARY KEY,
    Dept_Name VARCHAR(30) NOT NULL,
    Dept_Locn VARCHAR(20) UNIQUE NOT NULL,
    Dept_Desc VARCHAR(70)
);

CREATE TABLE WARD(
    Ward_ID INT AUTO_INCREMENT PRIMARY KEY,
    Ward_Type ENUM('General','Private','ICU') NOT NULL,
    Location VARCHAR(40) NOT NULL,
    Patient_Capacity INT NOT NULL
);

CREATE TABLE LAB(
    Lab_ID INT AUTO_INCREMENT PRIMARY KEY,
    Lab_Name VARCHAR(30) NOT NULL,
    Location VARCHAR(30) NOT NULL,
    Contact VARCHAR(15) UNIQUE NOT NULL
);
CREATE TABLE MEDICINE(
    Medicine_ID VARCHAR(15) PRIMARY KEY,
    Medicine_Name VARCHAR(25) NOT NULL,
    Strength VARCHAR(8) NOT NULL,
    State VARCHAR(10) NOT NULL
);

CREATE TABLE DOCTOR(
    Doctor_ID INT PRIMARY KEY,
    Dept_ID INT NOT NULL,
    Experience INT DEFAULT 0,
    FOREIGN KEY (Doctor_ID)
        REFERENCES HOSPITAL_STAFF(Staff_ID),
    FOREIGN KEY (Dept_ID)
        REFERENCES DEPARTMENT(Dept_ID)
);

CREATE TABLE NURSE(
    Nurse_ID INT PRIMARY KEY,
    Age INT NOT NULL,
    Shift VARCHAR(10) NOT NULL,
    Ward_ID INT NOT NULL,
    FOREIGN KEY (Nurse_ID)
        REFERENCES HOSPITAL_STAFF(Staff_ID),
    FOREIGN KEY (Ward_ID)
        REFERENCES WARD(Ward_ID)
);


CREATE TABLE BED(
    Bed_No INT AUTO_INCREMENT PRIMARY KEY,
    Ward_ID INT NOT NULL,
    Bed_Type ENUM('Critical','General','Pediatric','Other'),
    Status INT DEFAULT 0,
    FOREIGN KEY (Ward_ID)
        REFERENCES WARD(Ward_ID)
);

CREATE TABLE PATIENT(
    Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(15) NOT NULL,
    Middle_Name VARCHAR(15) DEFAULT NULL,
    Last_Name VARCHAR(15) NOT NULL,
    Gender ENUM('Male','Female','Others') NOT NULL,
    DOB DATE NOT NULL,
    Street_Name VARCHAR(15),
    City VARCHAR(20) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Zipcode INT NOT NULL,
    Blood_Group VARCHAR(5) NOT NULL,
    Contact VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE APPOINTMENT(
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Appointment_Date DATE NOT NULL,
    Slot TIME NOT NULL,
    Status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (Patient_ID)
        REFERENCES PATIENT(Patient_ID),
    FOREIGN KEY (Doctor_ID)
        REFERENCES DOCTOR(Doctor_ID)
);

CREATE TABLE PATIENT_MEDICAL_RECORD(
    Record_ID VARCHAR(30) PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Diagnosis VARCHAR(30) NOT NULL,
    Treatment VARCHAR(60) NOT NULL,
    Symptoms VARCHAR(50) NOT NULL,
    Advice VARCHAR(50) NOT NULL,
    FOREIGN KEY (Patient_ID)
        REFERENCES PATIENT(Patient_ID),
    FOREIGN KEY (Doctor_ID)
        REFERENCES DOCTOR(Doctor_ID)
);


CREATE TABLE TEST_ORDER(
    Appointment_ID INT NOT NULL,
    Test_No VARCHAR(30) NOT NULL,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Lab_ID INT NOT NULL,
    Test_Name VARCHAR(30) NOT NULL,
    Order_Date DATE NOT NULL,
    Status VARCHAR(20) DEFAULT 'Pending',
    PRIMARY KEY (Appointment_ID, Test_No),
    FOREIGN KEY (Appointment_ID)
        REFERENCES APPOINTMENT(Appointment_ID),
    FOREIGN KEY (Patient_ID)
        REFERENCES PATIENT(Patient_ID),
    FOREIGN KEY (Doctor_ID)
        REFERENCES DOCTOR(Doctor_ID),
    FOREIGN KEY (Lab_ID)
        REFERENCES LAB(Lab_ID)
);


CREATE TABLE TEST_RESULT(
    Result_ID INT PRIMARY KEY,
    Appointment_ID INT NOT NULL,
    Test_No VARCHAR(30) NOT NULL,
    Result_Date DATE NOT NULL,
    Report VARCHAR(150) NOT NULL,
    FOREIGN KEY (Appointment_ID, Test_No)
        REFERENCES TEST_ORDER(Appointment_ID, Test_No)
);

CREATE TABLE PRESCRIPTIONS(
    Prescription_ID INT AUTO_INCREMENT PRIMARY KEY,
    Record_ID VARCHAR(30) NOT NULL,
    Prescription_Date DATE NOT NULL,
    Instructions VARCHAR(30),
    FOREIGN KEY (Record_ID)
        REFERENCES PATIENT_MEDICAL_RECORD(Record_ID)
);


CREATE TABLE PRESCRIPTION_ITEM(
    Prescription_ID INT NOT NULL,
    Medicine_ID VARCHAR(15) NOT NULL,
    Dosage VARCHAR(10) NOT NULL,
    Duration VARCHAR(10) NOT NULL,
    Frequency VARCHAR(10) NOT NULL,
    PRIMARY KEY (Prescription_ID, Medicine_ID),
    FOREIGN KEY (Prescription_ID)
        REFERENCES PRESCRIPTIONS(Prescription_ID),
    FOREIGN KEY (Medicine_ID)
        REFERENCES MEDICINE(Medicine_ID)
);

CREATE TABLE BILL(
    Bill_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Bill_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2)
        CHECK (Total_Amount >= 0) NOT NULL,
    Discount DECIMAL(10,2)
        CHECK (Discount >= 0) DEFAULT 0,
    Bill_Status ENUM('Paid','Pending','Partial')
        DEFAULT 'Pending',
    FOREIGN KEY (Patient_ID)
        REFERENCES PATIENT(Patient_ID)
);

CREATE TABLE PAYMENT(
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Bill_ID INT NOT NULL,
    Amount DECIMAL(10,2),
    Payment_Mode ENUM('Cash','Cashless','Insurance')
        DEFAULT 'Cashless',
    Payment_Date DATE NOT NULL,
    Payed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Bill_ID)
        REFERENCES BILL(Bill_ID)
);
