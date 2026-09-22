select Nurse_ID from nurse where Shift='Morning';
select Nurse_ID from nurse where Shift='Night';
select distinct bed_type from bed;
select Bed_no from bed where ward_id=4;
select First_Name,Last_Name,Blood_Group from patient order by DOB DESC;
Select * From hospital_Staff where First_name Like 'A%'; -- Starts with A Condition , Logical Operation
select Contact from hospital_Staff where Gender='Female';
Update hospital_staff
SET Salary = CASE Staff_ID
    WHEN 1 THEN 124578
    WHEN 2 THEN 154556
    WHEN 3 THEN 245689
    WHEN 4 THEN 214589
    WHEN 5 THEN 325645
END
WHERE Staff_ID IN (1, 2, 3, 4, 5);
