CREATE PROCEDURE [dbo].[SP_Employee_GetAll]
	
AS
	SELECT [EmployeeID], [FirstName], [LastName], [UserName], [Role] FROM [Employee]
