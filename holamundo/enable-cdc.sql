-- Habilitar CDC en la base de datos
USE [master]
GO
CREATE DATABASE [tickets]
GO
USE tickets;
GO
CREATE TABLE [dbo].[tickets](
	[id] [int] NULL,
	[name] [varchar](150) NULL
) ON [PRIMARY]
GO

USE tickets;
GO

EXEC sys.sp_cdc_enable_db;
GO

-- Habilitar CDC en la tabla
EXEC sys.sp_cdc_enable_table
   @source_schema = N'dbo',
   @source_name = N'tickets',
   @role_name = NULL;
GO