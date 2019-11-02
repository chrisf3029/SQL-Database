create table Students(
studentID char(11) not null primary key,
firstName varchar(20) not null,
lastName varchar(20) not null,
gender char(1) not null,
dateofbirth date not null
);

create table Courses(
courseCode varchar(6) not null primary key,
courseName varchar(70) not null,
level char(2) not null,
credits int not null
);

create table Registration(
studentID char(11) not null,
courseCode varchar(6) not null,
grade decimal(2,1),
primary key(studentID, courseCode),
foreign key(studentID) references Students(studentID),
foreign key(courseCode) references Courses(courseCode)
);

insert into Students(studentID, firstName, lastName, gender, dateofbirth)
values
    ('861103-2438', 'Adam', 'Johnson', 'M', '1990-10-01'),
    ('911212-1746', 'Eva', 'Smith', 'F', '1991-08-20'),
    ('950829-1848', 'Anna', 'Washington', 'F', '1993-09-26'),
    ('123456-0980', 'Eric', 'Alonzo', 'M', '1990-05-26'),
    ('908023-2456', 'Bo', 'Ek', 'M', '1992-03-15'),
    ('098735-3456', 'Danny', 'Goss', 'M', '1992-02-01'),
    ('124345-3430', 'Mike', 'White', 'M', '1995-06-10'),
    ('124568-1345', 'Emily', 'Young', 'F', '1995-04-28'),
    ('908409-0010', 'Cathy', 'Lee', 'F', '1993-10-06'),
    ('124587-9088', 'Ben', 'Woo', 'M', '1992-11-30'),
    ('120953-0909', 'Anna', 'Washington', 'F', '1990-10-09'),
    ('120449-1008', 'John', 'Goss', 'M', '1995-10-26');
    
insert into Courses(courseCode, courseName, level, credits)
values
    ('CS056', 'Database Systems', 'G1', 5),
    ('CS010', 'C++', 'U1', 5),
    ('ENG111', 'English', 'U1', 3),
    ('FIN052', 'Finance', 'G1', 5),
    ('PHY210', 'Physics', 'U2', 5),
    ('CHE350', 'Chemistry', 'U3', 5),
    ('BIO001', 'Biology', 'U1', 3),
    ('CS052', 'Operating Systems', 'G1', 5);

insert into Registration(studentID, courseCode, grade)
values
    ('861103-2438','CS056', 4),
    ('861103-2438', 'CS010', 4),
    ('861103-2438', 'PHY210', 3.5),
    ('911212-1746', 'ENG111', 2),
    ('950829-1848', 'CHE350', 3),
    ('950829-1848', 'BIO001', 2.5),
    ('123456-0980', 'CS052', 3.5),
    ('123456-0980', 'CS056', 4),
    ('908023-2456', 'PHY210', 3.0),
    ('908023-2456', 'CS056', 1.0),
    ('908023-2456', 'CS010', 2.0),
    ('124345-3430', 'FIN052', 2.5),
    ('124345-3430', 'CHE350', 4),
    ('908409-0010', 'CS052', 2),
    ('124587-9088', 'BIO001', 4),
    ('124587-9088', 'CS052', 3.5);

--Number 3
select firstName, lastName from Students order by lastName asc, firstName asc;

--Number 4
select studentID, firstName, lastName from Students where dateofbirth>'1993-12-31' and gender='F';

--Number 5
select count(courseCode) from Registration where courseCode='CS056';

--Number 6
select courseCode from Courses where courseCode like'CS%';

--Number 7
select courseCode, courseName from Courses where credits<5;

--Number 8
select level, count(level) from Courses group by level;

--Number 9
select courseCode from Registration where studentID='861103-2438';

--Number 10
select studentID from Registration where grade in (select max(grade) from Registration where courseCode='CS052') and courseCode='CS052';

--Number 11
select courseCode from Registration
where studentID = '861103-2438'
and courseCode in
(select courseCode from Registration
where studentID = '123456-0980');

--Number 12
select studentID from Students where studentID not in (select studentID from Registration);

--Number 13
select studentID, sum(grade), avg(grade) from Registration group by studentID having avg(grade)>3;

--Number 14
select studentID from Registration group by studentID order by count(studentID) desc limit 1;

--Number 15
select studentID from Registration where courseCode='PHY210' or courseCode='BIO001';

--Number 16
select firstName, lastName from Students order by dateofbirth desc limit 1;

--Number 17
update Courses set credits=6 where courseCode like 'CS%' and credit=5;

--Number 18
delete from Registration where studentID='908409-0010';

--Number 19
update Registration	set grade=3.8 where courseCode='PHY210' and studentID='861103-2438';

select * from Registration;
select * from Courses;
select * from Students;

drop table Registration; 
drop table Courses; 
drop table Students;
