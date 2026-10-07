-- EXP 5
USE HHMS;
SELECT First_Name,DOB,City,Contact_No FROM Patient;
SELECT * FROM Hospital_Staff;
SELECT DISTINCT Blood_Group FROM Patient;
SELECT DISTINCT Payment_Mode FROM Payment;
SELECT Test_No AS Ref_no , Test_Name AS Name_of_Test FROM Test_Order;
SELECT Lab_Name AS Lab , Location AS Located_At FROM Lab;
SELECT * FROM Test_Result WHERE Result_ID =501;
SELECT * FROM Appointment WHERE Status ='Completed';
SELECT Staff_ID,First_Name FROM Hospital_Staff WHERE Salary > 50000;
SELECT * FROM  Bill WHERE Total_Amount <=1500 ;
SELECT First_Name, Salary,Salary + 5000 AS Revised_Salary ,Salary / 2 AS Half_Salary,Salary * 12 AS Annual_Income FROM Hospital_Staff ;
SELECT * ,Total_Amount - Discount AS Discounted_Amount FROM Bill;
SELECT * FROM Bed WHERE Bed_No % 2 = 0;
SELECT First_Name ,Salary FROM Hospital_Staff WHERE SALARY >40000 AND SALARY <50000;
SELECT First_Name ,Gender,Salary  FROM Hospital_Staff WHERE SALARY >40000 OR GENDER = 'Male';
SELECT * FROM nurse WHERE NOT Shift = 'Night';
SELECT * FROM Patient WHERE First_Name LIKE ('R%');
SELECT * FROM Hospital_Staff WHERE First_Name LIKE '%it%';
SELECT Staff_ID, First_Name, Salary
FROM Hospital_Staff
WHERE Salary BETWEEN 50000 AND 65000;
SELECT Patient_ID, First_Name, DOB
FROM Patient
WHERE DOB BETWEEN '1980-01-01' AND '1995-12-31';
SELECT Bill_ID, Patient_ID, Total_Amount
FROM Bill
WHERE Total_Amount BETWEEN 1000 AND 3000;
SELECT Nurse_ID, Age, Shift FROM Nurse WHERE Age BETWEEN 25 AND 30;
SELECT * FROM Bed WHERE Bed_No BETWEEN 1 AND 10; 
SELECT * FROM Bed WHERE Bed_No NOT BETWEEN 5 AND 7; 
SELECT * FROM  Doctor WHERE Dept_ID IN (1,4,5);
SELECT Patient_ID,Test_No,Test_Name FROM  Test_Order WHERE Lab_ID NOT IN (1,4,5);
SELECT Staff_ID ,First_Name ,Salary FROM  Hospital_Staff WHERE City NOT IN ('Mumbai','New Delhi','Kochi','Guwhati','Lucknow','Patna');
SELECT First_Name , Last_Name  FROM Patient WHERE Middle_Name IS NULL LIMIT 5;
SELECT * FROM Bill WHERE Bill_Status IS NOT NULL ;
SELECT * FROM Prescriptions WHERE Prescription_Date IS NOT NULL ;
SELECT Staff_ID,First_Name ,Salary FROM Hospital_Staff  ORDER BY Salary ASC;
SELECT * FROM  ward ORDER BY Patient_Capacity ASC;
SELECT Patient_ID,First_Name ,DOB FROM Patient  ORDER BY DOB DESC;
SELECT Patient_ID,First_Name ,DOB,Zipcode FROM Patient  ORDER BY DOB DESC , Zipcode ASC;
SELECT COUNT(*) AS Total_Appointment FROM Appointment ;
SELECT COUNT(*) AS Male_Patients FROM Patient WHERE GENDER='Male';
SELECT  AVG(Discount) AS Avg_Discount FROM Bill ;
SELECT Gender , MAX(Salary) AS MAX_Salary FROM Hospital_Staff WHERE Gender='Female' ;
-- Here Without Group By Clause it Throws Error . Basically Without Group By 
-- Clause u won't be Able to Show More Then One Columns of Table if Applying Aggregat Function.
SELECT  MAX(Experience) AS Max_Exp , MIN(Experience) AS Min_Exp  FROM Doctor;
SELECT  MAX(Total_Amount) AS Max_Amount , MIN(Total_Amount) AS Min_Amount  FROM Bill;
SELECT Gender , SUM(Salary) AS Total_Salary_Amount FROM Hospital_Staff Group By Gender;
SELECT Bed_Type,SUM(Bed_No) AS Total_Beds FROM Bed GROUP BY  Bed_Type HAVING SUM(Bed_No) > 14;
SELECT Payment_Mode,COUNT(Payment_Mode) AS No_of_Modes FROM Payment GROUP BY Payment_Mode HAVING COUNT(Payment_Mode) > 0; 

SELECT Appointment_ID,Doctor_ID, COUNT(*) AS Total_Appointments  FROM Appointment 
WHERE Patient_ID IN (3,11,14) 
GROUP BY  Doctor_ID ,Appointment_ID
HAVING COUNT(*) > 0;

SELECT Patient_ID,Blood_Group, COUNT(*) AS Total_BG  FROM Patient
WHERE Blood_Group IN ('O+','AB+','A-')
GROUP BY  Patient_ID ,Blood_Group
HAVING COUNT(*) > 0;

-- Use of LIMIT 

SELECT Appointment_ID , Test_Name FROM test_order LIMIT 5;
SELECT * FROM Hospital_Staff ORDER BY Salary DESC LIMIT 5;
SELECT * FROM Appointment ORDER BY Appointment_Date ASC LIMIT 3;
-- AS + WHERE + Comparison + ORDER BY

SELECT First_Name, 12*Salary AS Annual_Salary FROM hospital_staff WHERE Salary > 50000 ORDER BY Annual_Salary DESC;
-- AS + BETWEEN + AND + IN + ORDER BY
SELECT Patient_ID,First_Name AS Name ,Blood_Group FROM Patient WHERE
 DOB BETWEEN '1985-04-12' AND 
 '2005-07-08' AND 
 Blood_Group IN ('A+','AB+','O-') 
 ORDER BY Patient_ID ASC;
 
 -- AS + Arithmetic Operator + WHERE + ORDER BY
 
 SELECT Staff_ID, First_Name AS Name ,
 Leaves + 1 AS Updated_Leaves FROM Hospital_Staff
 WHERE Gender='Male' ORDER BY Leaves DESC;
 
 -- WHERE + GROUP BY + Aggregate + HAVING + ORDER BY
 
 SELECT Appointment_ID,Doctor_ID, COUNT(*) AS No_of_Appointments
 FROM Appointment WHERE Appointment_ID > 10 
 GROUP BY Appointment_ID,Doctor_ID HAVING COUNT(*) <2;
 
 -- AS + OR + AND + LIKE + ORDER BY + LIMIT
 
SELECT Staff_ID,First_Name AS NAME ,Salary,Leaves FROM Hospital_Staff 
WHERE Salary >= 30000 AND Salary <= 40000 
OR Leaves IN (1,2,3) ORDER BY Staff_ID ASC LIMIT 10;