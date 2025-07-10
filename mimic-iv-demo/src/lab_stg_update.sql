-- Databricks notebook source

--CREATE SCHEMA metastore.ccdm_stg;

CREATE OR REPLACE TABLE metastore.ccdm_stg.lab AS 
(
SELECT * FROM metastore.ccdm.v_lab
SEMI JOIN metastore.ccdm_stg.encounter enc
  ON enc.subject_id = v_lab.subject_id
  AND enc.hadm_id = v_lab.hadm_id 
)