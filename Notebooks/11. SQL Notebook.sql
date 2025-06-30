-- Databricks notebook source
USE hive_metastore.mimic_iv_demo;

select * FROM hosp_admissions limit 10; 


-- COMMAND ----------

select * from icu_icustays limit 10;

-- COMMAND ----------

show views; 


-- COMMAND ----------


with patients as (
  select 
  subject_id, 
  anchor_age
  from hosp_patients
),
stays as (
  select 
  subject_id, 
  hadm_id,
  stay_id
  from icu_icustays
)

select 
stays.subject_id
, stays.hadm_id
, stays.stay_id
, anchor_age as age

from patients pat
INNER JOIN stays
ON stays.subject_id = pat.subject_id



-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC display(_sqldf)