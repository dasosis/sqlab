CREATE TABLE STUDENT
(
    Student_ID int,
    stu_name Varchar(100),
    stu_address Varchar(200),
    Phone Numeric(10,0),
    Email Varchar(50),
    Date_of_Birth Date,
    Date_of_Admission Date,
    Date_of_Passing Date,
	PresentAddress Varchar(200),
	DeptId int, 
	CourseId int, 
	BatchId int, 
	StatusId int
);

CREATE TABLE DEPARTMENT
(
    DeptId int,
    DeptName Varchar(50)
);

CREATE CLUSTERED INDEX cls_stu on student(student_id);
CREATE UNIQUE CLUSTERED INDEX cls_dep on department(deptid);

INSERT INTO STUDENT
VALUES('101', 'Shivam', 'Kolkata', '9900990099', 'shivam@gmail.com', '2001-06-13', '2020-07-21', '2024-06-20', 'Kolkata', '1001', '1200', '10111', '410');
INSERT INTO STUDENT
VALUES('102', 'Rishav', 'Gaya', '9900990099', 'rishav@gmail.com', '2002-03-11', '2020-07-21', '2024-06-20', 'Kolkata', '1002', '1210', '15310', '210');
INSERT INTO STUDENT
VALUES('103', 'Satyam', 'Newtown', '9900990099', 'satyam@gmail.com', '2002-06-19', '2020-07-21', '2024-06-20', 'Kolkata', '1001', '1200', '10111', '115');
INSERT INTO STUDENT
VALUES('104', 'Sameer', 'Kolkata', '9900990099', 'sameer@gmail.com', '2001-09-03', '2020-07-21', '2024-06-20', 'Kolkata', '1006', '1240', '10310', '315');
INSERT INTO STUDENT
VALUES('121', 'Rahul', 'Kolkata', '9900990099', 'rahul@gmail.com', '2002-11-16', '2020-07-21', '2024-06-20', 'Kolkata', '1001', '1200', '10410', '410');
INSERT INTO STUDENT
VALUES('124', 'Raunak', 'Patna', '9900990099', 'raunak@gmail.com', '2001-05-23', '2020-07-21', '2024-06-20', 'Kolkata', '1002', '1210', '15310', '410');
INSERT INTO STUDENT
VALUES('132', 'Rajeev', 'DumDum', '9900990099', 'rajeev@gmail.com', '2002-07-29', '2020-07-21', '2024-06-20', 'Kolkata', '1001', '1200', '10410', '115');
INSERT INTO STUDENT
VALUES('139', 'Shorab', 'Park Street', '9900990099', 'shorab@gmail.com', '2002-10-09', '2020-07-21', '2024-06-20', 'Kolkata', '1001', '1200', '10111', '115');
INSERT INTO STUDENT
VALUES('153', 'Aditya', 'Kolkata', '9900990099', 'aditya@gmail.com', '2001-06-20', '2020-07-21', '2024-06-20', 'Kolkata', '1006', '1240', '10310', '410');
INSERT INTO STUDENT
VALUES('158', 'Ayush', 'Howrah', '9900990099', 'ayush@gmail.com', '2001-12-07', '2020-07-21', '2024-06-20', 'Kolkata', '1001', '1200', '10410', '410');

--SELECT * FROM STUDENT;

INSERT INTO DEPARTMENT
VALUES('1001', 'CSE');
INSERT INTO DEPARTMENT
VALUES('1002', 'EE');
INSERT INTO DEPARTMENT
VALUES('1006', 'CE');
INSERT INTO DEPARTMENT
VALUES('1029', 'ME');



CREATE NONCLUSTERED INDEX ncls_stu ON student(stu_name asc,stu_address asc)
WHERE stu_address = 'KOLKATA';


--SELECT * FROM DEPARTMENT;



execute sp_helpindex student;
execute sp_helpindex department;

drop index ncls_inc_stu on student;


select * from STUDENT;


CREATE NONCLUSTERED INDEX ncls_inc_stu ON student(stu_name asc,stu_address asc)
include(email,phone)
WHERE stu_address = 'KOLKATA';

select * from studept;

select * from STUDENT;
go
create view studept as select student_id, stu_name, deptname
from student inner join DEPARTMENT
on STUDENT.DeptId = DEPARTMENT.DeptId
where DeptName = 'cse';
go
DROP view studept;




--DROP TABLE STUDENT;
--DROP TABLE DEPARTMENT;

