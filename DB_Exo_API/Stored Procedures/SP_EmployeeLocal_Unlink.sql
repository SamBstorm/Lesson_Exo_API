CREATE PROCEDURE [dbo].[SP_EmployeeLocal_Unlink]
	@employeeId int,
	@localId int
AS
	DELETE FROM Employee_Local WHERE [EmployeeId] = @employeeId AND [LocalId] = @localId
