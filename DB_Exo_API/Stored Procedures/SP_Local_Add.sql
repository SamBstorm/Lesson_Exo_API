CREATE PROCEDURE [dbo].[SP_Local_Add]
	@name NVARCHAR(50),
	@floor INT = 0
AS
	INSERT INTO [Local]([LocalName],[LocalFloor]) OUTPUT inserted.LocalId VALUES (@name, @floor)
