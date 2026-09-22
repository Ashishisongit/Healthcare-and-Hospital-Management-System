select Nurse_ID from nurse where Shift='Morning';
select Nurse_ID from nurse where Shift='Night';
select distinct bed_type from bed;
select Bed_no from bed where ward_id=4;
select First_Name,Last_Name,Blood_Group from patient order by DOB DESC;
Select * From hospital_Staff where First_name Like 'A%'; -- Starts with A Condition , Logical Operation
select Contact from hospital_Staff where Gender='Female';