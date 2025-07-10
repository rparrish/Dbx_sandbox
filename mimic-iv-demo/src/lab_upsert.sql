-- Databricks notebook source
--CREATE OR REPLACE TABLE metastore.ccdm.lab AS 
--SELECT * FROM metastore.ccdm_stg.lab LIMIT 0; 

  MERGE INTO metastore.ccdm.lab target
  USING metastore.ccdm_stg.lab source
  ON source.labevent_id = target.labevent_id

  --WHEN MATCHED THEN 

  WHEN NOT MATCHED THEN INSERT *
