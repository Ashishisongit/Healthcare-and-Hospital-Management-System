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
