CREATE PROCEDURE [dbo].[SP_Employee_SetAdmin]
	@empId int
AS
	UPDATE Employee SET [Role] = 'Admin' WHERE EmployeeId = @empId