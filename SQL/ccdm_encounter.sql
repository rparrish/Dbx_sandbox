SELECT
    subject_id,
    hadm_id,
    admit_dttm,
    disch_dttm,
    admission_type,
    admission_location,
    discharge_location,
    hospital_expire_flag,
    aprdrg_cd,
    aprdrg,
    aprdrg_soi,
    aprdrg_rom,
    icd_code,
    long_title
FROM
    metastore.ccdm.encounter 
    
ORDER BY subject_id, hadm_id 