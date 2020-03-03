CREATE PROCEDURE [dbo].[SP_EmployeeLocal_Link]
	@employeeId int,
	@localId int
AS
	INSERT INTO [Employee_Local] ([EmployeeId],[LocalId]) VALUES (@employeeId,@localId)
