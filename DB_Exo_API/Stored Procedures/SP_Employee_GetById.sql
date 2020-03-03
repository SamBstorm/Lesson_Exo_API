CREATE PROCEDURE [dbo].[SP_Employee_GetById]
	@empId INT
AS
	SELECT [EmployeeID], [FirstName], [LastName], [UserName], [Role] FROM [Employee] WHERE [EmployeeID] = @empId
