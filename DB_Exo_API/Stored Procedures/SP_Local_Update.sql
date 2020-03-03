CREATE PROCEDURE [dbo].[SP_Local_Update]
	@id INT,
	@name NVARCHAR(50)
AS
	UPDATE [Local] SET LocalName = @name WHERE LocalId = @id