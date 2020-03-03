CREATE PROCEDURE [dbo].[SP_Local_GetById]
	@id int
AS
	SELECT LocalId, LocalName, LocalFloor FROM [Local] WHERE [LocalId] = @id
