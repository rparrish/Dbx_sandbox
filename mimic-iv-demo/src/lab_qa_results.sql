-- Databricks notebook source
SELECT 
lab_name,
count(*) 

FROM metastore.ccdm_stg.lab

GROUP BY lab_name
ORDER BY count(*) DESC 

-- COMMAND ----------

