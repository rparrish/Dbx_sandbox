-- Databricks notebook source

CREATE OR REPLACE VIEW metastore.ccdm.v_encounter AS 
(
WITH q01 AS (
  SELECT hadm_id, subject_id, SUM(los) AS los_icu
  FROM (FROM metastore.mimic_iv_demo.icu_icustays) q01
  GROUP BY hadm_id, subject_id
),
q02 AS (
  SELECT DISTINCT hadm_id, subject_id, 1.0 AS icu_stay_flag, los_icu
  FROM q01
),
q03 AS (
  SELECT
    q1.*,
    gender,
    anchor_age,
    anchor_year,
    anchor_year_group,
    dod,
    icu_stay_flag,
    los_icu
  FROM (FROM metastore.mimic_iv_demo.hosp_admissions) q1
  INNER JOIN (FROM metastore.mimic_iv_demo.hosp_patients) q2
    ON (q1.subject_id = q2.subject_id)
  LEFT JOIN q02 q3
    ON (
      q1.hadm_id = q3.hadm_id AND
      q1.subject_id = q3.subject_id
    )
)
SELECT
  hadm_id,
  subject_id,
  edregtime AS registration_dttm,
  edouttime AS ed_out_dttm,
  admittime AS admit_dttm,
  dischtime AS disch_dttm,
  deathtime AS death_dttm,
  admission_type,
  admission_location,
  discharge_location,
  CAST(anchor_age AS INTEGER) AS age,
  gender,
  CAST(hospital_expire_flag AS INTEGER) AS hospital_expire_flag,
  CAST(COALESCE(icu_stay_flag, 0.0) AS INTEGER) AS icu_stay_flag,
  CAST(CASE WHEN ((edregtime IS NULL)) THEN 0.0 WHEN NOT ((edregtime IS NULL)) THEN 1.0 END AS INTEGER) AS ed_flag,
  CAST(datediff(MINUTE, edregtime, edouttime) AS INTEGER) / 60.0 AS los_ed_hrs,
  los_icu,
  CAST(datediff(HOUR, admittime, dischtime) AS INTEGER) / 24.0 AS los_hosp,
  date_part('MINUTE', admittime) AS admit_min
FROM q03 q01

)