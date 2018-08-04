SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





 CREATE VIEW [prodcopy].[vw_Account] AS 
						---- CREATED BY PROCESS ON Oct  3 2016  7:50PM
						SELECT * FROM ProdCopy.Account WHERE 1=1 AND statecode = 0 AND merged = 0





GO
