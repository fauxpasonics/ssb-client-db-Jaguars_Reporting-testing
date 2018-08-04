CREATE TABLE [prodcopystg].[IDs]
(
[ID] [uniqueidentifier] NULL,
[Entity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CopyLoadDate] [datetime] NULL CONSTRAINT [DF__IDs__CopyLoadDat__02FC7413] DEFAULT (getdate()),
[statecode] [bit] NULL
)
GO
