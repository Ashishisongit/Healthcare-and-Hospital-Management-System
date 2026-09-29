use HHMS;
show TABLES;
ALTER TABLE department RENAME TO dept;
desc dept;
ALTER TABLE dept ADD COLUMN email VARCHAR(35)  UNIQUE;
select * from dept;
UPDATE dept 
SET email = CASE Dept_ID
    WHEN 1 THEN 'cardiology@hhms.in'
    WHEN 2 THEN 'pediatrics@hhms.in'
    WHEN 3 THEN 'orthopedic@hhms.in'
    WHEN 4 THEN 'neurology@hhms.in'
    WHEN 5 THEN 'emergency@hhms.in'
END
WHERE Dept_ID IN (1, 2, 3, 4, 5);
-- Reviewing the Patient Medical Record Assigned to Doctor with Staff_id =12
select distinct * from patient_medical_record where doctor_id=12;
INSERT INTO appointment (Patient_ID, Doctor_ID, Appointment_Date, Slot, Status) value
(12, 3, '2026-10-01', '09:00:00', 'Pending');
-- Safe Mode in SQL
SET SQL_SAFE_UPDATES = 0;
Delete From appointment where status ='Pending';
-- Deleted Appontment having Appointment Status as Pending 
select * from appointment where status ='Pending';
Update appointment SET status ='Completed' where appointment_id=9;
-- Adding Salary to the existing employees 
alter table hospital_staff modify column salary decimal(10,2) not null;
Update hospital_staff
SET salary = Case Staff_id
	WHEN 1 THEN 50230.45
    WHEN 2 THEN 60245.15
    WHEN 3 THEN 75123.21
    WHEN 4 THEN 52350.45
    WHEN 5 THEN 62030.15
    WHEN 6 THEN 72120.21
    WHEN 7 THEN 50450.45
    WHEN 8 THEN 60420.15
    WHEN 9 THEN 75020.21
    WHEN 10 THEN 50340.45
    WHEN 11 THEN 62300.15
    WHEN 12 THEN 75200.21
END
WHERE Staff_id IN (1,2,3,4,5,6,7,8,9,10,11,12) ;
select * from hospital_staff 
order by Gender DESC,salary ASC;
select * from hospital_staff 
order by Gender DESC,salary ASC;
-- Aggregate Function MAX , MIN , AVG , SUM , COUNT
SELECT COUNT(*)as total_bed FROM bed;
SELECT contact,Patient_id FROM patient WHERE First_name LIKE ('R%');
SELECT First_name,Patient_id FROM patient WHERE First_name LIKE ('%R%');
SELECT * FROM HOSPITAL_STAFF ORDER BY SALARY DESC LIMIT 5;
SELECT * FROM HOSPITAL_STAFF INNER JOIN DOCTOR ON HOSPITAL_STAFF.STAFF_ID = DOCTOR.DOCTOR_ID;
SELECT * FROM HOSPITAL_STAFF INNER JOIN NURSE ON HOSPITAL_STAFF.STAFF_ID = NURSE.NURSE_ID WHERE SALARY <124578;
SELECT  * FROM HOSPITAL_STAFF NATURAL JOIN DOCTOR;
-- FOR LEFT JOOIN LEFT JOIN KA SAB AAYEGA AND FOR RIGHT JOIN RIGHT KA SAB AAYEGA 
-- FOR  FULL JOIN THERE IS NO SPECIFIC KEYWORD U NEED TO TAKE UNION OF LEFT AND RIGHT .
