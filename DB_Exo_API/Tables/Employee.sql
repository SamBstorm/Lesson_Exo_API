CREATE TABLE [dbo].[Employee]
(
	[EmployeeID] INT IDENTITY(1,1),
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[UserName] NVARCHAR(50) NOT NULL,
	[Password] VARBINARY(32) NOT NULL,
	[Role] NVARCHAR(50) NOT NULL DEFAULT 'Visiteur',
	CONSTRAINT PK_Employee PRIMARY KEY([EmployeeID]),
	CONSTRAINT CK_Employee_Role CHECK ([Role] = 'Visiteur' OR [Role] = 'Admin'),
	CONSTRAINT UK_Employee_UserName UNIQUE ([UserName])
)
