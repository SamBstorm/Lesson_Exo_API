﻿CREATE TABLE [dbo].[Local]
(
	[LocalId] INT IDENTITY(1,1) NOT NULL,
	[LocalName] NVARCHAR(50) NOT NULL,
	[LocalFloor] INT NOT NULL DEFAULT 0,
	CONSTRAINT PK_Local PRIMARY KEY([LocalId]),
	CONSTRAINT UK_Local_LocalName UNIQUE ([LocalName])
)
