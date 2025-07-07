-- Databricks notebook source
OPTIMIZE metastore.ccdm.encounter
ZORDER BY subject_id, hadm_id


-- COMMAND ----------

VACUUM metastore.ccdm.encounter