-- Databricks notebook source

CREATE WIDGET TEXT lookback_mins DEFAULT "5";

CREATE OR REPLACE TABLE IDENTIFIER("metastore.mimic_iv_demo.ccdm_stg_" || :table_name) AS 

SELECT * FROM 
IDENTIFIER("metastore.mimic_iv_demo.ccdm_v_" || :table_name)
LIMIT 100;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC table_name = dbutils.widgets.get("table_name")
-- MAGIC lookback_mins = dbutils.widgets.get("lookback_mins")
-- MAGIC
-- MAGIC
-- MAGIC spark.sql(f"DESCRIBE DETAIL metastore.mimic_iv_demo.ccdm_stg_{table_name}")
-- MAGIC 
-- MAGIC print(f"Lookback: {lookback_mins}")
-- MAGIC

