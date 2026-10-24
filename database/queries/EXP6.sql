 USE hhms;
 
SELECT   First_Name,Ward_Type
FROM hospital_staff
NATURAL JOIN ward;

SELECT   Medicine_ID,Medicine_Name
FROM Medicine
NATURAL JOIN Prescription_Item;


SELECT   Test_No,Medicine_Name
FROM Medicine
NATURAL JOIN Prescription_Item;