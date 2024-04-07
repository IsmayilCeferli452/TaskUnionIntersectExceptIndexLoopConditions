create database UnionPractice

use UnionPractice

create table Users(
[Id] int primary key identity,
[Name] nvarchar(50),
[Age] int
)

create table Persons(
[Id] int primary key identity,
[Name] nvarchar(50),
[Age] int
)

insert into Users([Name],[Age])
values 
('Ismayil',24),
('Behruz',37),
('Afide',38)

insert into Persons([Name],[Age])
values 
('Ismayil',24),
('Behruz',37),
('Nurlan',22),
('Reshad',21)

insert into Users([Name],[Age])
values 
('Fatime',22)

select * from Users
union --tekrarsiz
select * from Persons

select * from Users
union all --hamisini
select * from Persons

select [Name] from Users
union
select [Name] from Persons

select [Name],[Age] from Users
union
select [Name],[Age] from Persons

select [Age],[Name] from Users
union all
select [Age],[Name] from Persons
union all
select [Age],[Name] from Persons

select Age from Users
union
select Age from Persons

select * from Users
intersect --ortaq
select * from Persons

select * from Users
except --ortaq olmayan
select * from Persons

select COUNT(*) as 'Count',[Age] from Users group by [Age]

select COUNT(*),[Age] from Users group by [Age]
intersect
select COUNT(*),[Age] from Persons group by [Age]

select COUNT(*),[Age] from Persons group by [Age]
except
select COUNT(*),[Age] from Users group by [Age]

select COUNT(*),[Age] from Users group by [Age]
except
select COUNT(*),[Age] from Persons group by [Age]



declare @num1 int = 50
declare @num2 int = 51
if @num1 > @num2
print 'Greater'
else
print 'Smaller'


select * from Users
select * from Persons

create function dbo.getUsersAvgAge()
returns int
as
begin
	return (select AVG([Age]) from Users) 
end

create function dbo.getPersonsAvgAge()
returns int
as
begin
	return (select AVG([Age]) from Persons) 
end


select dbo_getUsersAvgAge()


create procedure usp_checkUsersAndPersonsAvgAges
@userAge int,
@personAge int
as
begin
	if @userAge > @personAge
	print 'User Bigger'
	else
	print 'Person Bigger'
end

declare @userAvgAge int = (select dbo.getUsersAvgAge())
declare @personsAvgAge int = (select dbo.getPersonsAvgAge())

exec usp_checkUsersAndPersonsAvgAges @userAvgAge , @personsAvgAge


declare @counter int
set @counter = 1
while ( @counter <= 10 )
begin
	print 'The counter value is = ' + Convert(varchar,@counter)
	set @counter = @counter + 1
end



 
begin try
  select
    1 / 0 as Error;
end try
begin catch
  select
    ERROR_NUMBER() as ErrorNumber,
    ERROR_STATE() as ErrorState,
    ERROR_SEVERITY() as ErrorSeverity,
    ERROR_PROCEDURE() as ErrorProcedure,
    ERROR_LINE() as ErrorLine,
    ERROR_MESSAGE() as ErrorMessage;
end catch
