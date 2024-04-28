create table student_table (
    Student_id SERIAL PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    email_id TEXT,
    Phone_no NUMERIC,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT
);

insert into student_table (Student_id, Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
values
(1,'Adhil','Computer Science','Adhil@gmail.com',1234567890,'123 Main St,chennai','01-01-2000','Male','Computer Science',3.8,'A'), 
(2,'Banu','Mathematics','banu@gmail.com',9876543210,'456 street,chennai','15-02-1999','Female','Mathematics',4.2,'A'),
(3,'Cheran','Physics','cheran@gmail.com',5551234567,'789 street,chennai','05-03-2001','Male','Physics',2.9,'C'),
(4,'Divya','Science','Divya@gmail.com',7894561230,'569 street,chennai','16-04-2002','Female','Science',3.1,'B'),
(5,'Eshvar','matematics','Eshvar@gmail.com',2589631470,'894 street,chennai','26-05-2001','Male','Mathematics',4.1,'A'),
(6,'Gunasri','English','Gunasri@gmail.com',9874561230,'123 street,chennai','21-06-1999','Female','English',4.5,'A'),
(7,'Hameed','Tamil','Hameed@gmail.com',9325647108,'782 street,chennai','11-08-2001','Male','Tamil',3.6,'B'),
(8,'Irfana','Computer Science','Irfana@gmail.com',9023145685,'963 street,chennai','13-07-1999','Female','Computer Science',3.1,'B'),
(9,'Jana','Mathematics','Jana@gmail.com',7845613024,'012 street,chennai','20-09-2000','Male','Mathematics',2.9,'C'),
(10,'Kavya','Physics','Kavya@gmail.com',8756412390,'356 street,chennai','09-11-2000','Female','Physics',4.9,'A');    

select * from student_table order by Grade desc;

select * from student_table where Gender = 'Male';

select * from student_table where GPA < 5.0;

with updated_student AS (
    update student_table
    set email_id = 'new_email@gmail.com'
    where Student_id = 1
    RETURNING *
)
select * from updated_student;

select Stu_name, extract(YEAR FROM AGE(Date_of_birth)) AS Age
from student_table
where Grade = 'B';

select Department, Gender, AVG(GPA) AS Avg_GPA
from student_table
GROUP BY Department, Gender;

alter table student_table RENAME TO student_info;

select Stu_name
from student_info
where GPA = (select MAX(GPA) from student_info);