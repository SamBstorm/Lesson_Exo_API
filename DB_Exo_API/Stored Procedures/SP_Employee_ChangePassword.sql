CREATE PROCEDURE [dbo].[SP_Employee_ChangePassword]
	@empId INT,
	@password NVARCHAR(50)
AS
	UPDATE Employee
		SET [Password] = [dbo].SF_HashPassword(@password)
	WHERE EmployeeID = @empId
