CREATE PROCEDURE [dbo].[SP_Employee_Add]
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50),
	@userName NVARCHAR(50),
	@password NVARCHAR(50),
	@role NVARCHAR(50) = 'Visiteur'
AS
	INSERT INTO Employee([FirstName],[LastName],[UserName],[Password],[Role])
	OUTPUT inserted.EmployeeID
	VALUES (@firstName,@lastName,@userName,[dbo].SF_HashPassword(@password),@role)
