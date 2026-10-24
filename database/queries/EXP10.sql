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

-- 3. Test the calculation
SELECT Countappt(12) AS Total_count;