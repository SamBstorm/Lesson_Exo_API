SET IDENTITY_INSERT [Employee] ON;
GO

IF EXISTS(SELECT [EmployeeId] FROM [Employee] WHERE UserName = 'Admin' AND [Password] = dbo.SF_HashPassword('Admin'))
	BEGIN
		DELETE FROM [Employee] WHERE UserName = 'Admin' AND [Password] = dbo.SF_HashPassword('Admin');
	END
INSERT INTO Employee ([EmployeeID],[FirstName],[LastName],[UserName],[Password],[Role])
	VALUES(0,'Admin','Admin','Admin',dbo.SF_HashPassword('Admin'),'Admin');
GO

SET IDENTITY_INSERT [Employee] OFF;
GO
