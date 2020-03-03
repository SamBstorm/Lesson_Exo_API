CREATE PROCEDURE [dbo].[SP_Local_Delete]
	@id int
AS
	DELETE FROM [Local] WHERE LocalId = @id