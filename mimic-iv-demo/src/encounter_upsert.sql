-- Databricks notebook source
--CREATE OR REPLACE TABLE metastore.ccdm.encounter AS 
--(
  MERGE INTO metastore.mimic_iv_demo.ccdm_encounter target
  USING (
  SELECT
    source.* --EXCEPT(created_dttm) -- Exclude the specific column
  FROM
    metastore.mimic_iv_demo.ccdm_stg_encounter AS source
    LIMIT 25
) AS source_data
  
  ON source_data.hadm_id = target.hadm_id

WHEN MATCHED THEN UPDATE SET * EXCEPT(created_dttm)
--WHEN NOT MATCHED THEN INSERT (created_dttm) VALUES (source.modified_dttm)
WHEN NOT MATCHED THEN INSERT *


--)

-- COMMAND ----------

SELECT * FROM metastore.mimic_iv_demo.ccdm_encounter
WHERE created_dttm <> modified_dttm; 
