CREATE PROCEDURE [dbo].[SP_Employee_Update]
	@empId INT,
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50)
AS
	UPDATE Employee
	SET [FirstName] = @firstName,
		[LastName] = @lastName
	WHERE EmployeeID = @empId
