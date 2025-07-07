-- Databricks notebook source
--CREATE OR REPLACE TABLE metastore.ccdm.encounter AS 
--(
  MERGE INTO metastore.ccdm.encounter target
  USING metastore.ccdm_stg.encounter source
  ON source.hadm_id = target.hadm_id

  --WHEN MATCHED THEN 

  WHEN NOT MATCHED THEN INSERT *
--)