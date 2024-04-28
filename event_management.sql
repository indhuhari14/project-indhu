create table Events (
    Event_Id SERIAL PRIMARY KEY,
    Event_Name TEXT,
    Event_Date DATE,
    Event_Location TEXT,
    Event_Description TEXT
);

create table Attendees (
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name TEXT,
    Attendee_Phone TEXT,
    Attendee_Email TEXT,
    Attendee_City TEXT
);

create table Registrations (
    Registration_id SERIAL PRIMARY KEY,
    Event_Id INT REFERENCES Events(Event_Id),
    Attendee_Id INT REFERENCES Attendees(Attendee_Id),
    Registration_Date DATE,
    Registration_Amount NUMERIC
);

insert into Events (Event_Name, Event_Date, Event_Location, Event_Description)
values
    ('Conference A', '2024-05-15', 'chennai', 'Sql'),
    ('conference B', '2024-06-10', ' madurai', 'Psql'),
	('conference c', '2024-07-01', ' salem', 'Tsql'),
	('conference D', '2024-08-11', ' goa', 'mysql');
	
--select * from Events;

insert into Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
values
    ('vijay', '1234567890', 'vijay@gmil.com', 'salem'),
    ('Jana', '9876543210', 'jana@gmil.com', 'erode'),
	('dinesh', '7865843210', 'dinesh@gmil.com', 'karur'),
	('sugun', '8656563210', 'sugun@gmil.com', 'mallur');

--select * from Attendees;

insert into Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
values
    (1, 1, '2024-05-10', 100.00),
    (2, 2, '2024-06-01', 50.00);
	
--select * from Registrations;

with Events_h as (
	insert into Events (Event_Name, Event_Date, Event_Location, Event_Description)
	values ('python', '2024-07-20', 'New delhi', 'python')
	returning*
)
select * from Events_h;

with Up_location as(
	update Events
	SET Event_Location = 'Updated location'
	where Event_Id = 1
	returning *
)
select * from Up_location;

WITH deleted_event AS (
    delete from Registrations
    where Event_Id = 2
    returning Event_Id
)
delete from Events
where Event_Id = (select Event_Id from deleted_event);

insert into Attendees (Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
values ('New Attendee', '5551234567', 'new.attendee@gmail.com', 'New City');

insert into Registrations (Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
values (1, 3, '2024-07-15', 75.00); 

select * from Events;

select Attendee_Name, Attendee_Email from Attendees;

select e.Event_Name, COUNT(r.Registration_id) AS Attendee_Count
from Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
group by e.Event_Id, e.Event_Name;

drop table Events,Attendees,Registrations;