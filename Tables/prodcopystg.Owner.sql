CREATE TABLE [prodcopystg].[Owner]
(
[name] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ownerid] [uniqueidentifier] NOT NULL,
[owneridtype] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[versionnumber] [bigint] NULL,
[yominame] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CopyLoadDate] [datetime] NOT NULL CONSTRAINT [const_stgOwner_CopyLoadDate] DEFAULT (getdate())
)
GO
ALTER TABLE [prodcopystg].[Owner] ADD CONSTRAINT [PK__Owner__7E4A4D6484997F7A] PRIMARY KEY CLUSTERED  ([ownerid])
GO
