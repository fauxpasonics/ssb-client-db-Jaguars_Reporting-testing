IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SSBINFO\SSB Rpt Sec')
CREATE LOGIN [SSBINFO\SSB Rpt Sec] FROM WINDOWS
GO
CREATE USER [SSBINFO\SSB Rpt Sec] FOR LOGIN [SSBINFO\SSB Rpt Sec]
GO
