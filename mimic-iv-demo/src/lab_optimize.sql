-- Databricks notebook source
OPTIMIZE metastore.ccdm.lab
ZORDER BY subject_id, hadm_id, labevent_id


-- COMMAND ----------

VACUUM metastore.ccdm.lab