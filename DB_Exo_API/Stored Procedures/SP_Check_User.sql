CREATE PROCEDURE [dbo].[SP_Check_User]
	@userName NVARCHAR(50),
	@password NVARCHAR(50),
	@userId INT OUTPUT
AS
	SET @userId = 0;
	IF EXISTS (SELECT EmployeeId FROM Employee WHERE UserName = @userName AND [Password] = dbo.SF_HashPassword(@password))
		SELECT @userId = EmployeeId FROM Employee WHERE UserName = @userName 
RETURN 0
