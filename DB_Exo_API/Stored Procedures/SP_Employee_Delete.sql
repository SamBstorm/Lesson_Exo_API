CREATE PROCEDURE [dbo].[SP_Employee_Delete]
	@empId INT
AS
	DELETE FROM [Employee]
	WHERE [EmployeeID] = @empId
