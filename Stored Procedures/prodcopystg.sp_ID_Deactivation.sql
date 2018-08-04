SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [prodcopystg].[sp_ID_Deactivation]
     @Target VARCHAR(256),
	 @Target_Object varchar(256),
     @Target_Key VARCHAR(256),
	 @Target_Statecode VARCHAR(50),
	 @Target_Statecodename varchar(256)

AS

--DECLARE @target VARCHAR(256) SET @Target = 'prodcopy.str_salesorderdetail'
--DECLARE @target_object VARCHAR(256) SET @Target_object = 'str_salesorderdetail'
--DECLARE @target_key VARCHAR(256) SET @Target_key = 'str_salesorderdetailID'
--DECLARE @target_statecode varchar(50) SET @Target_Statecode = '1'
--DECLARE @target_statecodename varchar(265) SET @target_statecodename = 'Inactive'
--Job Steps:
--1. TRUNCATE ContactIDs TABLE (done by SSIS Package)
--2. Pull ALL Contactids FROM client's CRM (done by SSIS Package)
--3. Throw the ContactIDs that are in Prodcopy but not in the ContactID table into a deactivatedlog table (Sproc Below)
--4. Update prodcopy to statecode = 1 (deactivated) and the copyloaddate (to ensure this gets picked up in next masterload) for those records that are no longer found in the client's CRM (Sproc Below)
--5. Update the deactivated log for those records that were processed. (Sproc Below)
--Assumptions: 
--1. The view for the masterload is not the vw_contact, so that it contains deactivated records. 
--2. Isdeleted in masterload view = statecode
--3. Client doesn't also want them hard-deleted from prodcopy
--4. Remember that some clients are throwing things straight to Azure
declare @SQL nvarchar(max) =
'CREATE TABLE #tempdeactivate ([ID] [NVARCHAR](50) NULL,[Entity] [NVARCHAR](100) NULL,[DeactivatedDate] [DATETIME] NULL,[Completed] [BIT] NULL)
--Those to be deactivated
INSERT INTO #tempdeactivate
SELECT pc.' + @Target_Key + ' AS ID, ''' + @Target_Object + ''' AS Entity, NULL AS deactivateddate, 0 AS Completed--, pc.statecode, c.statecode, c.id
FROM '+ @Target + ' pc
left JOIN prodcopystg.IDs c ON CAST(pc.'+ @Target_Key + ' AS NVARCHAR(36)) = c.iD AND c.Entity = ''' + @Target_Object + '''
WHERE (pc.statecode != ' + @Target_Statecode + ' AND c.statecode = '+ @Target_Statecode + ')
or (c.ID IS NULL and pc.statecode != '  + @Target_Statecode + ')
MERGE INTO prodcopystg.IDs_DeactivatedLogs AS target
USING #tempdeactivate as source
ON source.ID = target.ID AND source.Entity = target.Entity
WHEN MATCHED THEN 
UPDATE SET target.deactivateddate = NULL, target.Completed = 0
WHEN NOT MATCHED BY TARGET THEN
INSERT (id, Entity, DeactivatedDate, Completed) VALUES (source.ID, source.Entity, source.deactivateddate, source.Completed);
--Act of Deactivating
UPDATE pc
SET statecode = ' + @Target_Statecode + ', copyloaddate = (SELECT MAX(copyloaddate) FROM prodcopy.contact), statecodename = ''' + @Target_Statecodename +'''
FROM ' + @Target + ' pc
INNER JOIN prodcopystg.IDs_DeactivatedLogs dl
ON CAST(pc.' + @Target_Key + ' AS NVARCHAR(36)) = dl.ID AND dl.Completed = 0 AND dl.Entity = ''' + @Target_Object + '''
--Logging the deactivation
UPDATE prodcopystg.IDs_DeactivatedLogs
SET Completed = 1, DeactivatedDate = GETDATE()
FROM  prodcopystg.IDs_DeactivatedLogs dl
INNER JOIN ' + @Target + ' pc
ON CAST(pc.' + @Target_Key + ' AS NVARCHAR(36)) = dl.ID AND dl.Entity = ''' + @Target_Object + '''
WHERE dl.Completed = 0
AND pc.statecode = ' + @Target_Statecode

exec (@SQL)






GO
