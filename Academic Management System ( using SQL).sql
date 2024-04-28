create database Acadamic;
use Acadamic;
create table StudentInfo(
STU_ID int primary key,
STU_NAME VARCHAR(30),
DOB DATE,
PHONE_NO varchar(10),
EMAIL_ID VARCHAR(50),
ADDRESS VARCHAR(100));
create table CourseInfo(
COURSE_ID INT primary key,
COURSE_NAME VARCHAR(30),
COURSE_INSTRUCTOR_NAME VARCHAR(30)
);
create table EnrollmentInfo(
ENROLLMENT_ID INT,STU_ID INT,COURSE_ID INT,ENROLL_STATUS varchar(30),
FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
FOREIGN KEY (COURSE_ID) REFERENCES CourseInfo(COURSE_ID)
);

insert into StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1,'Anadh','1998-01-01','9965907630','Anadh@gmail.com','No1,a colony, b street,chennai'),
(2,'Bharathi','1998-02-02','9965707531','Bharathi@gmail.com','No2,a1 colony, b1 street,chennai'),
(3,'Chandru','1998-03-03','9967887646','chandru@gmail.com','No3,a3 colony, b3 street,chennai'),
(4,'Devi','1998-04-04','9966317680','devi@gmail.com','No4,a4 colony, b4 street,chennai'),
(5,'Elango','1998-05-05','9967678620','Elango@gmail.com','No5,a5 colony, b5 street,chennai'),
(6,'Fasila','1998-06-06','9967668650','fasila@gmail.com','No6,a6 colony, b6 street,chennai'),
(7,'Guna','1998-07-07','9587678666','guna@gmail.com','No7,a7 colony, b7 street,chennai'),
(8,'hema','1998-08-08','9667678656','hema@gmail.com','No8,a8 colony, b8 street,chennai'),
(9,'irfan','1998-09-09','9999678630','irfan@gmail.com','No9,a9 colony, b9 street,chennai');

select * from StudentInfo;

insert into CourseInfo(COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) values
(001,'python','Dheena'),
(002,'sql','kirthi'),
(003,'java','sudhan');

insert into EnrollmentInfo(ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS) values
(010,1,001,'Enrolled'),
(020,1,002,'Enrolled'),
(030,2,002,'Enrolled'),
(040,2,003,'Enrolled'),
(050,3,003,'Enrolled'),
(060,4,001,'Enrolled'),
(070,5,002,'Enrolled'),
(080,6,003,'Enrolled'),
(090,7,001,'Not Enrolled'),
(100,8,002,'Not Enrolled'),
(110,9,003,'Not Enrolled');

-- a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.

select StudentInfo.STU_NAME, StudentInfo.PHONE_NO, StudentInfo.EMAIL_ID, EnrollmentInfo.ENROLL_STATUS
from EnrollmentInfo
inner join StudentInfo on EnrollmentInfo.STU_ID=StudentInfo.STU_ID;

-- b) Write a query to retrieve a list of courses in which a specific student is enrolled.

select CourseInfo.COURSE_NAME
from EnrollmentInfo ei
inner join CourseInfo on ei.COURSE_ID = CourseInfo.COURSE_ID
where ei.STU_ID = 1 and ei.ENROLL_STATUS='Enrolled';

-- c) Write a query to retrieve course information, including course name, instructor information.

select ci.COURSE_NAME,ci.COURSE_INSTRUCTOR_NAME
from CourseInfo ci;

-- d) Write a query to retrieve course information for a specific course .

select COURSE_NAME,COURSE_INSTRUCTOR_NAME
from CourseInfo
where COURSE_ID =001;

-- e) Write a query to retrieve course information for multiple courses.

select COURSE_NAME,COURSE_INSTRUCTOR_NAME
from CourseInfo
where COURSE_ID in (001,002,003);

-- a) Write a query to retrieve the number of students enrolled in each course
 
select ci.COURSE_NAME,
count(ei.STU_ID) AS Number_of_students
from EnrollmentInfo ei
join CourseInfo ci on ei.COURSE_ID = ci.COURSE_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by ci.COURSE_NAME;

-- b) Write a query to retrieve the list of students enrolled in a specific course

select si.STU_NAME
from EnrollmentInfo ei
join StudentInfo si on  ei.STU_ID = si.STU_ID
where ei.COURSE_ID = 002 and ei.ENROLL_STATUS = 'Enrolled';

-- c) Write a query to retrieve the count of enrolled students for each instructor.

select ci.COURSE_INSTRUCTOR_NAME,
count(ei.STU_ID) AS Enrolled_Students_count
from CourseInfo ci
join EnrollmentInfo ei on ci.Course_ID = ei.COURSE_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by ci.COURSE_INSTRUCTOR_NAME;

-- d) Write a query to retrieve the list of students who are enrolled in multiple courses

select si.STU_NAME,
count(ei.COURSE_ID) as Courses_Enrolled
from StudentInfo si
join EnrollmentInfo ei on si.STU_ID = ei.STU_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by si.STU_NAME
having count(ei.COURSE_ID) >1;

-- e) Write a query to retrieve the courses that have the highest number of enrolled students(arranging from highest to lowest)

select ci.COURSE_NAME,
count(ei.STU_ID) as Enrolled_Students_count
from EnrollmentInfo ei
join  CourseInfo ci on ei.COURSE_ID = ci.COURSE_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by ci.COURSE_NAME
order by Enrolled_Students_count desc;
