Create database EmployeeDB
go
use EmployeeDB
go
use master
drop database EmployeeDB
--Create table
CREATE TABLE [Department] (
	DepartId integer NOT NULL,
	DepartName varchar(50) NOT NULL,
	Description varchar(100) NOT NULL,
  CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED
  (
  [DepartId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Employee] (
	EmpCode varchar(6) NOT NULL,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Birthday datetime NOT NULL,
	Gender binary NOT NULL,
	Address varchar(100) NOT NULL,
	DepartID integer NOT NULL,
	Salary integer NOT NULL,
  CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED
  (
  [EmpCode] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Employee] WITH CHECK ADD CONSTRAINT [Employee_fk0] FOREIGN KEY ([DepartID]) REFERENCES [Department]([DepartId])
ON UPDATE CASCADE
GO
ALTER TABLE [Employee] CHECK CONSTRAINT [Employee_fk0]
GO

--Insert
Insert into Department values(1, 'HaNoi', 'Vietnam'),
(2, 'SaiGon', 'HoChiMinh'),
(3, 'Hue', 'HaNoi');

Select * From Department;

Insert into Employee values(1, 'Luong', 'Huy', '2001', 1, 'HaNoi', 1, 10),
(2, 'Luong', 'Khoi', '2001', 1, 'HaNoi', 1, 10),
(3, 'Luong', 'Thang', '2001', 1, 'HaNoi', 1, 10);

Select * From Employee;

Update Employee
Set salary = salary * 1.1;

Alter table Employee 
	add constraint salary check (salary > 0);

create view ViewEM
 as
 select e.EmpCode,
        e.LastName + e.FirstName as FullName,
		d.DepartName
 from Employee as e
 inner join Department as d on d.DepartId = e.DepartId;

CREATE PROCEDURE sp_getAllEmp @EmpCode int
As 
Select * From Employee;

Create PROCEDURE sp_delDept @EmpCode int
As
drop @EmpCode;


