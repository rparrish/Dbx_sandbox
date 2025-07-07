

CREATE OR REPLACE VIEW metastore.ccdm.encounter AS (

WITH pdx AS (
SELECT
	subject_id,
	hadm_id,
	--seq_num,
	di.icd_code,
	--di.icd_version
	hdid.long_title
FROM
	metastore.mimic_iv_demo.hosp_diagnoses_icd di
INNER JOIN metastore.mimic_iv_demo.hosp_d_icd_diagnoses hdid  
	ON
	hdid.icd_code = di.icd_code
	AND hdid.icd_version = di.icd_version
WHERE
	1 = 1
	AND seq_num = 1
	AND hdid.icd_version = 10
),

aprdrg AS (
SELECT
	subject_id,
	hadm_id,
	--drg_type,
	drg_code as aprdrg_cd,
	description as aprdrg,
	drg_severity as aprdrg_soi,
	drg_mortality as aprdrg_rom
FROM
	metastore.mimic_iv_demo.hosp_drgcodes
WHERE
	1 = 1
	AND drg_type = 'APR'
	AND drg_severity IS NOT NULL
)


SELECT 
	hoad.subject_id,
	hoad.hadm_id,
	hoad. admittime as admit_dttm, 
	hoad.dischtime as disch_dttm, 
	admission_type,
	--admit_provider_id,
	admission_location,
	discharge_location,
	hospital_expire_flag,
	aprdrg_cd,
	aprdrg,
	aprdrg_soi,
	aprdrg_rom,
	pdx.icd_code,
	pdx.long_title
	
FROM metastore.mimic_iv_demo.hosp_admissions hoad
INNER JOIN metastore.mimic_iv_demo.hosp_patients hopa 
	ON hopa.subject_id = hoad.subject_id
LEFT JOIN aprdrg
	ON aprdrg.subject_id = hopa.subject_id
	AND aprdrg.hadm_id = hoad.hadm_id
LEFT JOIN pdx 
	ON pdx.subject_id = hopa.subject_id
	AND pdx.hadm_id = hoad.hadm_id

	
)
