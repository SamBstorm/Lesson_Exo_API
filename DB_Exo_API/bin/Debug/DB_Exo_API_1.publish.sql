/*
Script de déploiement pour Exo_API

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Exo_API"
:setvar DefaultFilePrefix "Exo_API"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Création de [dbo].[SP_Employee_ChangePassword]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_ChangePassword]
	@empId INT,
	@password NVARCHAR(50)
AS
	UPDATE Employee
		SET [Password] = [dbo].SF_HashPassword(@password)
	WHERE EmployeeID = @empId
GO
PRINT N'Création de [dbo].[SP_Employee_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_Delete]
	@empId INT
AS
	DELETE FROM [Employee]
	WHERE [EmployeeID] = @empId
GO
PRINT N'Création de [dbo].[SP_Employee_IsAdmin]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_IsAdmin]
	@empId INT,
	@isAdmin BIT OUTPUT
AS
	SET @isAdmin = 0
	SELECT @isAdmin = IIF([Role] = 'Admin', 1, 0) FROM Employee WHERE EmployeeID = @empId
GO
PRINT N'Création de [dbo].[SP_Employee_SetAdmin]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_SetAdmin]
	@empId int
AS
	UPDATE Employee SET [Role] = 'Admin' WHERE EmployeeId = @empId
GO
PRINT N'Création de [dbo].[SP_Employee_UnsetAdmin]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_UnsetAdmin]
	@empId int
AS
	UPDATE Employee SET [Role] = 'Visiteur' WHERE EmployeeId = @empId
GO
PRINT N'Création de [dbo].[SP_Employee_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_Update]
	@empId INT,
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50)
AS
	UPDATE Employee
	SET [FirstName] = @firstName,
		[LastName] = @lastName
	WHERE EmployeeID = @empId
GO
PRINT N'Création de [dbo].[SP_EmployeeLocal_Link]...';


GO
CREATE PROCEDURE [dbo].[SP_EmployeeLocal_Link]
	@employeeId int,
	@localId int
AS
	INSERT INTO [Employee_Local] ([EmployeeId],[LocalId]) VALUES (@employeeId,@localId)
GO
PRINT N'Création de [dbo].[SP_EmployeeLocal_Unlink]...';


GO
CREATE PROCEDURE [dbo].[SP_EmployeeLocal_Unlink]
	@employeeId int,
	@localId int
AS
	DELETE FROM Employee_Local WHERE [EmployeeId] = @employeeId AND [LocalId] = @localId
GO
PRINT N'Création de [dbo].[SP_Local_Add]...';


GO
CREATE PROCEDURE [dbo].[SP_Local_Add]
	@name NVARCHAR(50),
	@floor INT = 0
AS
	INSERT INTO [Local]([LocalName],[LocalFloor]) OUTPUT inserted.LocalId VALUES (@name, @floor)
GO
PRINT N'Création de [dbo].[SP_Local_Delete]...';


GO
CREATE PROCEDURE [dbo].[SP_Local_Delete]
	@id int
AS
	DELETE FROM [Local] WHERE LocalId = @id
GO
PRINT N'Création de [dbo].[SP_Local_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Local_GetAll]
	@id int
AS
	SELECT LocalId, LocalName, LocalFloor FROM [Local]
GO
PRINT N'Création de [dbo].[SP_Local_GetByFloor]...';


GO
CREATE PROCEDURE [dbo].[SP_Local_GetByFloor]
	@floor int
AS
	SELECT LocalId, LocalName, LocalFloor FROM [Local] WHERE [LocalFloor] = @floor
GO
PRINT N'Création de [dbo].[SP_Local_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Local_GetById]
	@id int
AS
	SELECT LocalId, LocalName, LocalFloor FROM [Local] WHERE [LocalId] = @id
GO
PRINT N'Création de [dbo].[SP_Local_Update]...';


GO
CREATE PROCEDURE [dbo].[SP_Local_Update]
	@id INT,
	@name NVARCHAR(50)
AS
	UPDATE [Local] SET LocalName = @name WHERE LocalId = @id
GO
PRINT N'Mise à jour terminée.';


GO
