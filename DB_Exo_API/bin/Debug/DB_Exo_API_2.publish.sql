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
PRINT N'Création de [dbo].[SP_Employee_GetAll]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_GetAll]
	
AS
	SELECT [EmployeeID], [FirstName], [LastName], [UserName], [Role] FROM [Employee]
GO
PRINT N'Création de [dbo].[SP_Employee_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_GetById]
	@empId INT
AS
	SELECT [EmployeeID], [FirstName], [LastName], [UserName], [Role] FROM [Employee] WHERE [EmployeeID] = @empId
GO
PRINT N'Mise à jour terminée.';


GO
