CREATE PROCEDURE [dbo].[SP_Employee_IsAdmin]
	@empId INT,
	@isAdmin BIT OUTPUT
AS
	SET @isAdmin = 0
	SELECT @isAdmin = IIF([Role] = 'Admin', 1, 0) FROM Employee WHERE EmployeeID = @empId
