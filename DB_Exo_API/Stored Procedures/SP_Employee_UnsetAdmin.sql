CREATE PROCEDURE [dbo].[SP_Employee_UnsetAdmin]
	@empId int
AS
	UPDATE Employee SET [Role] = 'Visiteur' WHERE EmployeeId = @empId