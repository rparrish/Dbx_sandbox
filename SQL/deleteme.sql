
USE hive_metastore; 

CREATE SCHEMA IF NOT EXISTS mimic_iv_demo;

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_admissions as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_d_hcpcs as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_d_icd_diagnoses as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_d_icd_procedures as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_d_labitems as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_diagnoses_icd as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_drgcodes as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_emar as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_emar_detail as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_hcpcsevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_labevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_microbiologyevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_omr as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_patients as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_pharmacy as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_poe as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_poe_detail as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_prescriptions as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_procedures_icd as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_provider as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_services as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.hosp_transfers as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_caregiver as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_chartevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_d_items as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_datetimeevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_icustays as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_ingredientevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_inputevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_outputevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

CREATE OR REPLACE VIEW mimic_iv_demo.icu_procedureevents as 
SELECT * 
FROM read_files(
  's3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz', 
  format => 'csv',
  header => TRUE
  );

