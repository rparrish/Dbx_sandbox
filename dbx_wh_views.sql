CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_admissions as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_admissions.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_d_hcpcs as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_d_hcpcs.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_d_icd_diagnoses as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_d_icd_diagnoses.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_d_icd_procedures as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_d_icd_procedures.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_d_labitems as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_d_labitems.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_diagnoses_icd as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_diagnoses_icd.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_drgcodes as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_drgcodes.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_emar as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_emar.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_emar_detail as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_emar_detail.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_hcpcsevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_hcpcsevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_labevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_labevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_microbiologyevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_microbiologyevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_omr as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_omr.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_patients as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_patients.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_pharmacy as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_pharmacy.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_poe as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_poe.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_poe_detail as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_poe_detail.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_prescriptions as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_prescriptions.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_procedures_icd as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_procedures_icd.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_provider as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_provider.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_services as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_services.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.hosp_transfers as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/hosp/hosp_transfers.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_caregiver as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_caregiver.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_chartevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_chartevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_d_items as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_d_items.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_datetimeevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_datetimeevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_icustays as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_icustays.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_ingredientevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_ingredientevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_inputevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_inputevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_outputevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_outputevents.parquet');
CREATE OR REPLACE VIEW metastore.mimic_iv_demo.icu_procedureevents as 
select * from  read_files('/Volumes/metastore/mimic_iv_demo/icu/icu_procedureevents.parquet');
