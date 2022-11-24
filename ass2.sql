CREATE TABLE STUDENT
(
    Student_ID int,
    Name Varchar(100),
    Address Varchar(200),
    Phone Numeric(10,0),
    Email Varchar(50),
    Date_of_Birth Date,
    Date_of_Admission Date,
    Date_of_Passing Date,
);

SELECT *
FROM STUDENT;
ALTER TABLE STUDENT ADD PresentAddress Varchar(200);

CREATE TABLE DEPARTMENT
(
    DeptId int NOT NULL primary key,
    DeptName Varchar(50)
);

CREATE TABLE COURSE
(
    CourseId int NOT NULL primary key,
    CourseName Varchar(50)
);

CREATE TABLE BATCH
(
    BatchId int NOT NULL primary key,
    BatchName Varchar(50)
);

CREATE TABLE StudentStatus
(
    StatusId int NOT NULL primary key,
    StatusDesc Varchar(50)
);

ALTER TABLE STUDENT ADD DeptId int, CourseId int, BatchId int, StatusId int;

SELECT *
FROM DEPARTMENT;
INSERT INTO DEPARTMENT
VALUES('1001', 'CSE');
INSERT INTO DEPARTMENT
VALUES('1002', 'EE');
INSERT INTO DEPARTMENT
VALUES('1006', 'CE');
INSERT INTO DEPARTMENT
VALUES('1029', 'ME');

SELECT *
FROM COURSE;
INSERT INTO COURSE
VALUES('1200', 'COMPUTERSCENGG');
INSERT INTO COURSE
VALUES('1210', 'ELECTRICALENGG');
INSERT INTO COURSE
VALUES('1240', 'CIVILENGG');
INSERT INTO COURSE
VALUES('1290', 'MECHANICALENGG');

SELECT *
FROM BATCH;
INSERT INTO BATCH
VALUES('10111', 'BCS3B');
INSERT INTO BATCH
VALUES('10310', 'BCE3');
INSERT INTO BATCH
VALUES('10410', 'CSBS2');
INSERT INTO BATCH
VALUES('15310', 'BEE3');

SELECT *
FROM StudentStatus;
INSERT INTO StudentStatus
VALUES('210', 'Not Present');
INSERT INTO StudentStatus
VALUES('410', 'Completed');
INSERT INTO StudentStatus
VALUES('115', 'Present');
INSERT INTO StudentStatus
VALUES('315', 'Not Completed');

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

SELECT STUDENT.*, DEPARTMENT.DeptName
FROM DEPARTMENT
    INNER JOIN STUDENT
    ON DEPARTMENT.DeptId = STUDENT.DeptId;


SELECT *
FROM COURSE
WHERE courseid NOT IN
  (SELECT courseid
FROM STUDENT);


SELECT STUDENT.*, StudentStatus.StatusDesc
FROM STUDENT
    INNER JOIN StudentStatus
    ON STUDENT.StatusId = StudentStatus.StatusId
WHERE StudentStatus.StatusDesc = 'Not Present';

SELECT STUDENT.*, StudentStatus.StatusDesc, DEPARTMENT.DeptName, BATCH.BatchName
FROM STUDENT
    INNER JOIN StudentStatus
    ON STUDENT.StatusId = StudentStatus.StatusId
    INNER JOIN DEPARTMENT
    ON STUDENT.DeptId = DEPARTMENT.DeptId
    INNER JOIN BATCH
    ON STUDENT.BatchId = BATCH.BatchId
WHERE StudentStatus.StatusDesc = 'Completed' AND DEPARTMENT.DeptName = 'CSE' AND BATCH.BatchName = 'CSBS2';
