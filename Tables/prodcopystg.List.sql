CREATE TABLE [prodcopystg].[List]
(
[checkfordonotsendmmonlistmembersname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cost] [money] NULL,
[cost_base] [money] NULL,
[createdby] [uniqueidentifier] NULL,
[createdbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdfromcode] [int] NULL,
[createdfromcodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdon] [datetime] NULL,
[createdonbehalfby] [uniqueidentifier] NULL,
[createdonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[createdonbehalfbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[donotsendonoptout] [bit] NULL,
[exchangerate] [decimal] (28, 0) NULL,
[ignoreinactivelistmembers] [bit] NULL,
[ignoreinactivelistmembersname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[importsequencenumber] [int] NULL,
[lastusedon] [datetime] NULL,
[listid] [uniqueidentifier] NOT NULL,
[listname] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lockstatus] [bit] NULL,
[lockstatusname] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[membercount] [int] NULL,
[membertype] [int] NULL,
[modifiedby] [uniqueidentifier] NULL,
[modifiedbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedon] [datetime] NULL,
[modifiedonbehalfby] [uniqueidentifier] NULL,
[modifiedonbehalfbyname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[modifiedonbehalfbyyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[overriddencreatedon] [datetime] NULL,
[ownerid] [uniqueidentifier] NULL,
[owneridname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owneridtype] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owneridyominame] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[owningbusinessunit] [uniqueidentifier] NULL,
[owningteam] [uniqueidentifier] NULL,
[owninguser] [uniqueidentifier] NULL,
[processid] [uniqueidentifier] NULL,
[purpose] [nvarchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[query] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stageid] [uniqueidentifier] NULL,
[statecode] [int] NULL,
[statecodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[statuscode] [int] NULL,
[statuscodename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[timezoneruleversionnumber] [int] NULL,
[transactioncurrencyid] [uniqueidentifier] NULL,
[transactioncurrencyidname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[traversedpath] [nvarchar] (1250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [bit] NULL,
[typename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[utcconversiontimezonecode] [int] NULL,
[versionnumber] [bigint] NULL,
[CopyLoadDate] [datetime] NOT NULL CONSTRAINT [const_stgList_CopyLoadDate] DEFAULT (getdate())
)
GO
ALTER TABLE [prodcopystg].[List] ADD CONSTRAINT [PK__List__7D4781530E800694] PRIMARY KEY CLUSTERED  ([listid])
GO
