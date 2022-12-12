Create Table StudentBkup(
StudentBkupId INT Primary Key, 
StudentName Varchar(50), 
DeptName Varchar(50), 
Exam_Marks INT, 
Details varchar(100) 
); 
Create Table Student(
StudentId INT,
StudentName Varchar(50), 
DeptName Varchar(50), 
Exam_Marks INT, 
Details varchar(100) 
); 
INSERT into Student values (1, 'Tauquir', 'CSBS', 85,'xyz'), (2, 'Ripan', 'CSBS', 90,'xyz'), (3, 
'Soumik', 'CSE', 80,'xyz'), (4, 'Aamir', 'ECE', 100,'xyz'), (5, 'Koyena', 'Bio Tech', 95,'xyz'); 
SELECT * from Student;	
Create Table ExamMarksNew(
ExamMarksNewId INT Primary Key, 
Exam_Marks INT, 
Details varchar(100) 
); 

Create Trigger tr_Student_ForDelete 
ON Student 
For Delete 
As 
Begin 
Declare @Id int, @Name varchar(50), @DName varchar(50), @Marks INT 
SELECT @Id=StudentId from deleted 
SELECT @Name=StudentName from deleted 
SELECT @DName=DeptName from deleted 
SELECT @Marks=Exam_Marks from deleted 
INSERT into StudentBkup values(@Id, @Name, @DName, @Marks, 'Deleted this Student Records at Time:- ' + cast(Getdate() as nvarchar(20))) 
End

Create Trigger tr_Student_ForModify 
ON Student 
For Update 
As 
Begin 
Declare @Id int, @Name varchar(50), @DName varchar(50), @Marks INT 
SELECT @Id=StudentId from deleted 
SELECT @Name=StudentName from deleted 
SELECT @DName=DeptName from deleted 
SELECT @Marks=Exam_Marks from deleted 
INSERT into StudentBkup values(@Id, @Name, @DName, @Marks, 'Updated this Student Records at Time:- ' + cast(Getdate() as nvarchar(20))) 
End 

Create Trigger tr_Exam_Marks_Insteadof_INSERT 
on ExamMarks 
Instead of INSERT 
as Begin 
declare @Id int, @Marks Int 
SELECT @Id=ExamMarksId from INSERTed 
SELECT @Marks=Exam_Marks from INSERTed 
INSERT into ExamMarksNew values(@Id, @Marks, 'INSERTed this details at Time:- ' + cast(GetDate() as nvarchar(20))) 
End

INSERT into ExamMarks values(5,98,'xyz'); Create 
Trigger tr_Exam_Marks_Insteadof_Update 
on ExamMarks 
Instead of Update 
as 
Begin 
Declare @Id int, @Marks Int 
SELECT @Id=ExamMarksId from INSERTed 
SELECT @Marks=Exam_Marks from INSERTed 
INSERT into ExamMarksNew values(@Id, @Marks, 'Updated this details at Time:- ' + 
cast(GetDate() as nvarchar(20))) 
End 