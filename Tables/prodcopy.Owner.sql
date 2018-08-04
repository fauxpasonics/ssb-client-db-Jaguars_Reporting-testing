CREATE TABLE [prodcopy].[Owner]
(
[name] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ownerid] [uniqueidentifier] NOT NULL,
[owneridtype] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[versionnumber] [bigint] NULL,
[yominame] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CopyLoadDate] [datetime] NOT NULL CONSTRAINT [const_Owner_CopyLoadDate] DEFAULT (getdate())
)
GO
CREATE NONCLUSTERED INDEX [idx_ownerid] ON [prodcopy].[Owner] ([ownerid])
GO
