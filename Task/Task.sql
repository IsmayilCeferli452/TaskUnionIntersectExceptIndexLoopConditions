create database CourseDb

use CourseDb

create table Countries(
[Id] int primary key identity,
[Name] nvarchar(50)
)

create table Cities(
[Id] int primary key identity,
[Name] nvarchar(50),
[CountryId] int references Countries([Id])
)

create table Departments(
[Id] int primary key identity,
[Name] nvarchar(50),
)

create table StaffMembers(
[Id] int primary key identity,
[FullName] nvarchar(50),
[Age] int,
[Salary] float,
[CityId] int references Cities([Id])
)

create table Roles(
[Id] int primary key identity,
[Name] nvarchar(50),
[DepartmentId] int references Departments([Id])
)

create table RoleStaffMembers(
[Id] int primary key identity,
[RoleId] int references Roles([Id]),
[StaffMembersId] int references StaffMembers([Id])
)

create table Students(
[Id] int primary key identity,
[Name] nvarchar(50),
[Surname] nvarchar(50),
[Address] nvarchar(100),
[Age] int,
[Email] nvarchar(100),
[CityId] int references Cities([Id])
)

create table Rooms(
[Id] int primary key identity,
[Name] nvarchar(50),
[Capacity] int
)

create table Educations(
[Id] int primary key identity,
[Name] nvarchar(100),
)

create table Groups(
[Id] int primary key identity,
[Name] nvarchar(50),
[Capacity] int,
[RoomId] int references Rooms([Id]),
[EducationId] int references Educations([Id])
)

create table StudentGroups(
[Id] int primary key identity,
[StudentId] int references Students([Id]),
[GroupId] int references Groups([Id])
)

create table Teachers(
[Id] int primary key identity,
[FullName] nvarchar(100),
[Salary] float,
[Address] nvarchar(100),
[Email] nvarchar(100),
)

create table GroupTeachers(
[Id] int primary key identity,
[GroupId] int references Groups([Id]),
[TeacherId] int references Teachers([Id])
)

insert into Countries([Name])
values('Azerbaijan'),
      ('Turkey'),
	  ('Russia'),
	  ('Georgia'),
	  ('Ukraine'),
	  ('Belgium'),
	  ('China')

select * from Countries

insert into Cities([Name],[CountryId])
values('Baku',1),
      ('Moscow',3),
	  ('Izmir',2),
	  ('Tbilisi',4),
	  ('Beijing',7),
	  ('Kiyev',5),
	  ('Lipetsk',3),
	  ('Kursk',3),
	  ('Sumgait',1),
	  ('Ankara',2),
	  ('Batumi',4)

insert into Cities([Name])
values ('Amsterdam')

select * from Cities

insert into Departments([Name])
values ('Administration Department'),
       ('Finance Department'),
	   ('IT Support Department'),
	   ('Engineering Department'),
	   ('Advertising Department'),
	   ('Accounting Department'),
	   ('Reception Department'),
	   ('Testing and Inspection Department')

select * from Departments

insert into Roles([Name],[DepartmentId])
values ('Systems Administrator',3),
       ('Software Developer',3),
	   ('Electrical Engineer',4),
	   ('Mechanical Engineer',4),
	   ('Office Manager',1),
	   ('Administrative Assistant',1),
	   ('Finance Manager',2),
	   ('Financial Analyst',2),
	   ('Advertising Manager',5),
	   ('Marketing Analyst',5),
	   ('Accounting Director',6),
	   ('Receptionist',7),
	   ('Customer Service Representative',7),
	   ('Quality Control Inspector',8),
	   ('Testing Technician',8)

select * from Roles

insert into StaffMembers([FullName],[Age],[Salary],[CityId])
values ('Artem Popov',32,5500,3),
       ('Irina Banina',22,1000,8),
	   ('Dimitri Vladimirovic',47,800,9),
	   ('Sema Eliyeva',30,1800,2),
	   ('Elcan Esgerov',25,2900,10),
	   ('Hasan Durmaz',36,1700,4),
	   ('Kvicha Kvaratskhelia',24,1000,5),
	   ('Gabriel Battiashvilli',31,4000,12),
	   ('Zhongguo',34,2300,6),
	   ('Andrey Shevchenko',41,3000,5),
	   ('Anastasia Sergeevna',29,3200,9),
	   ('Samir Seferov',24,2000,2),
	   ('Elcin Imanov',37,2500,2),
	   ('Kaan Turkoglu',32,2200,11),
	   ('Irina Sergeevna',31,3500,5)

select * from StaffMembers

insert into RoleStaffMembers([RoleId],[StaffMembersId])
values (1,14),
       (12,15),
	   (3,16),
	   (6,17),
	   (8,18),
	   (13,19),
	   (4,20),
	   (2,21),
	   (9,22),
	   (14,23),
	   (5,24),
	   (7,25),
	   (10,26),
	   (15,27),
	   (11,28)

select * from RoleStaffMembers

insert into Students ([Name], [Surname], [Address], [Age], [Email], [CityId])
values 
('Ismayil', 'Ceferli', 'Hezi Aslanov', 24, 'ismayil@gmail.com', 2),
('Petr', 'Yan', 'Buyonnovski', 27, 'petr@gmail.com', 3),
('Anna', 'Ivanova', 'Mihail Naqibin', 21, 'anna@gmail.com', 8),
('Elena', 'Bakhilova', 'Serevina', 23, 'elena@gmail.com', 9),
('Aylin', 'Altinel', 'Kadikoy', 27, 'aylin@gmail.com', 4),
('Emirhan', 'Durmaz', 'Kapali Carsi', 24, 'emirhan@gmail.com', 11),
('Zhang', 'Whang', 'Zhao', 19, 'zhangw@gmail.com', 6),
('Vladimir', 'Petric', 'Derebina', 31, 'vladimirp@gmail.com', 7),
('Vahtang', 'Gorgasali', 'Sovetski', 41, 'vahtang@gmail.com', 5),
('Giorgi', 'Mazniashvili', 'Sovetski', 18, 'giorgi@gmail.com', 12),
('Fatime', 'Qaykanova', '28 May', 24, 'fatime@gmail.com', 2),
('Nurlan', 'Umudov', 'Hovsan', 22, 'nurlan@gmail.com', 10)

select * from Students

insert into Rooms([Name],[Capacity])
values ('Sun',40),
       ('Earth',15),
	   ('Moon',10),
	   ('Neptun',20)

select * from Rooms

insert into Educations([Name])
values ('English Language'),
       ('Russsian Language'),
	   ('Full-Stack BackEnd'),
	   ('Full-Stack FrontEnd'),
	   ('Design'),
	   ('Mobile App Development'),
	   ('Web Development'),
	   ('Machine Learning'),
	   ('Game Development')

select * from Educations

insert into Groups([Name],[Capacity],[RoomId],[EducationId])
values ('PB100',14,2,1),
       ('PB101',18,4,3),
	   ('PB102',9,3,2),
	   ('PB103',27,1,5),
	   ('PB104',30,1,4),
	   ('PB105',18,4,6),
	   ('PB106',15,4,7),
	   ('PB107',10,3,8),
	   ('PB108',15,2,9)

select * from Groups

insert into StudentGroups([StudentId],[GroupId])
values (4,2),
       (5,1),
	   (6,1),
	   (7,3),
	   (8,9),
	   (9,4),
	   (10,5),
	   (11,6),
	   (12,7),
	   (13,8),
	   (14,2),
	   (15,2)

select * from StudentGroups

insert into Teachers([FullName],[Salary],[Address],[Email])
values ('Cavid Bashirov',3000,'Hezi Aslanov','cavid123@gmai.com'),
       ('Ayxan Dadasov',2500,'28 May','ayxan123@gmai.com'),
	   ('Eldar Huseynli',4000,'Iceriseher','eldar123@gmai.com'),
	   ('Amin Seferov',5000,'Xalqlar Dostlugu','amin123@gmai.com')

select * from Teachers

insert into GroupTeachers([GroupId],[TeacherId])
values (2,1),
       (9,1),
	   (1,2),
	   (3,2),
	   (4,3),
	   (5,3),
	   (6,4),
	   (7,4),
	   (8,4)

select * from GroupTeachers

--Join(All)(Elave)

select g.[Name] as 'Group Name',g.Capacity as 'Group Capacity', t.FullName as 'Group Teacher', t.Email as 'Teacher Email',
r.[Name] as 'Group Room',e.[Name] as 'Education', s.[Name] as 'Student Name', s.Surname as 'Student Surname'
,s.Email as 'Student Email', c.[Name] as 'City', sm.FullName as 'Staff Member', ro.[Name] as 'Staff Member Role',
de.[Name] as 'Department' from GroupTeachers gt
join Groups g on g.Id = gt.GroupId 
join Teachers t on t.Id = gt.TeacherId
join Rooms r on r.Id = g.RoomId
join Educations e on e.Id = g.EducationId
join StudentGroups sg on sg.GroupId = g.Id
join Students s on s.Id = sg.StudentId
join Cities c on c.Id = s.CityId
join StaffMembers sm on sm.CityId = c.Id
join RoleStaffMembers rsm on rsm.StaffMembersId = sm.Id
join Roles ro on ro.Id = rsm.RoleId
join Departments de on de.Id = ro.DepartmentId


