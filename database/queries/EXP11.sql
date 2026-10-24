 USE hhms;
DELIMITER //
CREATE FUNCTION AnnualSal(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC BEGIN
RETURN salary*12;
END //
DELIMITER ;
-- SELECT Staff_ID,First_Name,Salary , AnnualSal(salary) AS Annual_Salary FROM hospital_Staff;
DROP FUNCTION IF EXISTS CountPatient;
DELIMITER //
CREATE FUNCTION Age(dob DATE)
RETURNS INT
NOT DETERMINISTIC
NO SQL
BEGIN
RETURN TIMESTAMPDIFF(YEAR , dob , CURDATE()) ;
END //
DELIMITER ;
SELECT Patient_Id,First_Name,DOB,Age(dob) AS Age FROM Patient;

DROP FUNCTION IF EXISTS CountPatient;

-- 2. Re-create it cleanly with unique names
DELIMITER //
CREATE FUNCTION Countappt(input_doc_id INT)
RETURNS INT
-- READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total_appointments INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO total_appointments
    FROM appointment
    WHERE Doctor_ID = input_doc_id;
    
    RETURN total_appointments;
END // 
DELIMITER ;

SELECT Countappt(12) AS Total_count;
SELECT TIMESTAMP(CURDATE()); -- Returns Current Date .

DELIMITER //
CREATE  PROCEDURE Showbed(IN ward INT)

	BEGIN
    SELECT Bed_No,
    Bed_Type,
    Ward_ID
    FROM Bed
    WHERE Ward_ID = ward;
	END //
DELIMITER ;
CALL Showbed (2);
DROP PROCEDURE Showbed;
DELIMITER //
CREATE PROCEDURE InsertLab(
IN p_Lab_Name VARCHAR(30),
IN p_Location VARCHAR(30),
IN p_Contact VARCHAR(15)
)
BEGIN 
INSERT INTO Lab
(
Lab_Name,
Location,
Contact
)
VALUES
(
p_Lab_Name ,
p_Location ,
p_Contact
);
END //
DELIMITER ;
CALL InsertLab(
'Cytopathology Lab',
'Second Floor , Room 13',
'022-59487223');

-- To Check the Number of Created Procedures : 
SHOW PROCEDURE STATUS
WHERE Db = 'hhms';

DELIMITER //
CREATE PROCEDURE UpdateSalary
(
IN p_Staff_ID INT,
IN p_salary DECIMAL(10,2)
)
BEGIN
UPDATE Hospital_Staff
SET Salary=p_salary
WHERE Staff_ID=p_Staff_ID;
END //
DELIMITER ;
CALL UpdateSalary(2,50000)
