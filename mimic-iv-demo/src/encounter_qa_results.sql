-- Databricks notebook source
SELECT 
admit_min,
count(*) 

FROM metastore.ccdm.encounter

GROUP BY admit_min
ORDER BY admit_min DESC 

-- COMMAND ----------

