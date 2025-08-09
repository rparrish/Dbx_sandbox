-- Databricks notebook source
--CREATE SCHEMA metastore.ccdm_stg;

CREATE OR REPLACE TABLE metastore.mimic_iv_demo.ccdm_stg_encounter AS 
(
SELECT * FROM metastore.mimic_iv_demo.ccdm_v_encounter 
WHERE admit_min BETWEEN DATE_PART('MINUTE', current_timestamp()) - INT(:lookback_mins) AND DATE_PART('MINUTE', current_timestamp())
);

ALTER TABLE metastore.mimic_iv_demo.ccdm_stg_encounter
ADD COLUMNS 
  created_dttm TIMESTAMP, -- DEFAULT CURRENT_TIMESTAMP(), 
  modified_dttm TIMESTAMP; -- DEFAULT CURRENT_TIMESTAMP();

UPDATE metastore.mimic_iv_demo.ccdm_stg_encounter
SET 
  created_dttm = CURRENT_TIMESTAMP(),
  modified_dttm = CURRENT_TIMESTAMP();


-- COMMAND ----------

CREATE TABLE IF NOT EXISTS metastore.mimic_iv_demo.ccdm_encounter AS 
SELECT * FROM metastore.mimic_iv_demo.ccdm_stg_encounter LIMIT 0;
