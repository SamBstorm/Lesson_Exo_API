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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de [dbo].[Employee]...';


GO
CREATE TABLE [dbo].[Employee] (
    [EmployeeID] INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50)  NOT NULL,
    [LastName]   NVARCHAR (50)  NOT NULL,
    [UserName]   NVARCHAR (50)  NOT NULL,
    [Password]   VARBINARY (32) NOT NULL,
    [Role]       NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeID] ASC),
    CONSTRAINT [UK_Employee_UserName] UNIQUE NONCLUSTERED ([UserName] ASC)
);


GO
PRINT N'Création de [dbo].[Employee_Local]...';


GO
CREATE TABLE [dbo].[Employee_Local] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [EmployeeId] INT NOT NULL,
    [LocalId]    INT NOT NULL,
    CONSTRAINT [PK_Employee_Local] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UK_Employee_Local] UNIQUE NONCLUSTERED ([EmployeeId] ASC, [LocalId] ASC)
);


GO
PRINT N'Création de [dbo].[Local]...';


GO
CREATE TABLE [dbo].[Local] (
    [LocalId]    INT           IDENTITY (1, 1) NOT NULL,
    [LocalName]  NVARCHAR (50) NOT NULL,
    [LocalFloor] INT           NOT NULL,
    CONSTRAINT [PK_Local] PRIMARY KEY CLUSTERED ([LocalId] ASC),
    CONSTRAINT [UK_Local_LocalName] UNIQUE NONCLUSTERED ([LocalName] ASC)
);


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Employee]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD DEFAULT 'Visiteur' FOR [Role];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Local]...';


GO
ALTER TABLE [dbo].[Local]
    ADD DEFAULT 0 FOR [LocalFloor];


GO
PRINT N'Création de [dbo].[FK_Employee_Local_Employee]...';


GO
ALTER TABLE [dbo].[Employee_Local]
    ADD CONSTRAINT [FK_Employee_Local_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeID]) ON DELETE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Employee_Local_Local]...';


GO
ALTER TABLE [dbo].[Employee_Local]
    ADD CONSTRAINT [FK_Employee_Local_Local] FOREIGN KEY ([LocalId]) REFERENCES [dbo].[Local] ([LocalId]) ON DELETE CASCADE;


GO
PRINT N'Création de [dbo].[CK_Employee_Role]...';


GO
ALTER TABLE [dbo].[Employee]
    ADD CONSTRAINT [CK_Employee_Role] CHECK ([Role] = 'Visiteur' OR [Role] = 'Admin');


GO
PRINT N'Création de [dbo].[SF_HashPassword]...';


GO
CREATE FUNCTION [dbo].[SF_HashPassword]
(
	@password NVARCHAR(50)
)
RETURNS VARBINARY(32)
AS
BEGIN
	DECLARE @passPlusNoise NVARCHAR(MAX)
	SET @passPlusNoise = 'toto' + @password + 'tata'
	RETURN HASHBYTES(N'SHA2_256',@passPlusNoise)
END
GO
PRINT N'Création de [dbo].[SP_Check_User]...';


GO
CREATE PROCEDURE [dbo].[SP_Check_User]
	@userName NVARCHAR(50),
	@password NVARCHAR(50),
	@userId INT OUTPUT
AS
	SET @userId = 0;
	IF EXISTS (SELECT EmployeeId FROM Employee WHERE UserName = @userName AND [Password] = dbo.SF_HashPassword(@password))
		SELECT @userId = EmployeeId FROM Employee WHERE UserName = @userName 
RETURN 0
GO
PRINT N'Création de [dbo].[SP_Employee_Add]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_Add]
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(50),
	@userName NVARCHAR(50),
	@password NVARCHAR(50),
	@role NVARCHAR(50) = 'Visiteur'
AS
	INSERT INTO Employee([FirstName],[LastName],[UserName],[Password],[Role])
	OUTPUT inserted.EmployeeID
	VALUES (@firstName,@lastName,@userName,[dbo].SF_HashPassword(@password),@role)
GO
PRINT N'Création de [dbo].[SP_Employee_ChangePassword]...';


GO
CREATE PROCEDURE [dbo].[SP_Employee_ChangePassword]
	@empId INT,
	@password NVARCHAR(50)
AS
	UPDATE Employee
		SET [Password] = @password
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
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
