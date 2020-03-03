CREATE PROCEDURE [dbo].[SP_Local_GetByFloor]
	@floor int
AS
	SELECT LocalId, LocalName, LocalFloor FROM [Local] WHERE [LocalFloor] = @floor
