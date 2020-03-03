CREATE PROCEDURE [dbo].[SP_Local_GetAll]
AS
	SELECT LocalId, LocalName, LocalFloor FROM [Local]
