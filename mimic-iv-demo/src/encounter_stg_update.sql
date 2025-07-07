-- Databricks notebook source

--CREATE SCHEMA metastore.ccdm_stg;

CREATE OR REPLACE TABLE metastore.ccdm_stg.encounter AS 
(
SELECT * FROM metastore.ccdm.v_encounter 
WHERE admit_min BETWEEN DATE_PART('MINUTE', current_timestamp()) - 15 AND DATE_PART('MINUTE', current_timestamp())
)