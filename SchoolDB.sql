CREATE DATABASE SchoolDB
use SchoolDB

create table Students(
Id int primary key identity,
FullName varchar(100) not null,
Age smallint check(age>6 and age<20),
Email varchar(50) unique,
Score int check(score>=0 and score<=100) DEFAULT 0
)

insert into Students values
('Fidan Behbudova',17,'fidan@gmail.com',90,11),
('Mahire Memmedova',15,'mahire@gmail.com',100,9),
('Inci Qocayeva',13,'inci@gmail.com',60,6),
('Roza Memmedli',11,'roza@gmail.com',70,5),
('Sebine Eliyeva',9,'sebine@gmail.com',75,3)


alter table Students
add Class smallint


update Students
Set Email='abc@gmail.com'
where Score>90

delete from Students where age<10


alter table Students drop constraint CK_Students_Score
alter table Students add constraint CK_Students_Score Check(score>=0 and score<=100 and score%5=0 )


select name
from sys.check_constraints
where parent_object_id = object_id('Students');

alter table Students
add constraint CK_Students_Score
check (Score >= 0 AND Score <= 100);


create table TopStudents(
Id int,
FullName varchar(50) not null,
Score int Check(score>90 )
)

insert into TopStudents (Id, FullName, Score)
select Id, FullName, Score
from Students
where Score > 90
