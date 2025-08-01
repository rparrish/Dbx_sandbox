-- Databricks notebook source

--CREATE SCHEMA metastore.ccdm_stg;

CREATE OR REPLACE TABLE metastore.mimic_iv_demo.ccdm_stg_encounter AS 
(
SELECT * FROM metastore.mimic_iv_demo.ccdm_v_encounter 
WHERE admit_min BETWEEN DATE_PART('MINUTE', current_timestamp()) - INT(:lookback_mins) AND DATE_PART('MINUTE', current_timestamp())
)

