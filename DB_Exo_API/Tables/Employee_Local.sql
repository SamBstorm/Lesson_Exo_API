CREATE TABLE [dbo].[Employee_Local]
(
	[Id] INT NOT NULL IDENTITY(1,1),
	[EmployeeId] INT NOT NULL,
	[LocalId] INT NOT NULL,
	CONSTRAINT PK_Employee_Local PRIMARY KEY (Id),
	CONSTRAINT FK_Employee_Local_Employee FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId]) ON DELETE CASCADE,
	CONSTRAINT FK_Employee_Local_Local FOREIGN KEY ([LocalId]) REFERENCES [Local]([LocalId]) ON DELETE CASCADE,
	CONSTRAINT UK_Employee_Local UNIQUE ([EmployeeId],[LocalId])
)
