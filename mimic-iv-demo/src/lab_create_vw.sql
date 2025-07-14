-- Databricks notebook source
CREATE OR REPLACE VIEW metastore.ccdm.v_lab AS 
(
SELECT
  labevent_id,
  hadm_id,
  subject_id,
  specimen_id,
  hlab.itemid AS itemid,
  label AS lab_name,
  fluid,
  category,
  storetime,
  "value",
  valuenum AS value_nbr,
  valueuom AS value_uom,
  ref_range_lower,
  ref_range_upper,
  flag,
  priority,
  "comments"
FROM metastore.mimic_iv_demo.hosp_labevents hlab
INNER JOIN metastore.mimic_iv_demo.hosp_d_labitems hdlab
  ON hdlab.itemid = hlab.itemid

)
