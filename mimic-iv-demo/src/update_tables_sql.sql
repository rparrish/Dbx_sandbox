-- Databricks notebook source

--CREATE WIDGET TEXT table_name_widget DEFAULT 'ccdm_v_encounter';

SELECT * FROM IDENTIFIER("metastore.mimic_iv_demo.ccdm_v_" || :table_name)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC table_name = dbutils.widgets.get("table_name")
-- MAGIC lookback_mins = dbutils.widgets.get("lookback_mins")
-- MAGIC
-- MAGIC
-- MAGIC spark.sql(f"DESCRIBE DETAIL metastore.mimic_iv_demo.{table_name}")
-- MAGIC 
-- MAGIC print(f"Lookback: {lookback}")
-- MAGIC

