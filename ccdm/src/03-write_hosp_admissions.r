# Databricks notebook source
#install.packages("pacman")

pacman::p_load(
 sparklyr, 
 arrow,
 dplyr,
 DBI,
 dbplyr
)

# COMMAND ----------

  sc <- spark_connect(method = "databricks")
  

# COMMAND ----------

dbExecute(sc, "USE hive_metastore.mimic_iv_demo")

adm <- spark_read_table(sc, "hosp_admissions")
pat <- spark_read_table(sc, "hosp_patients")




# COMMAND ----------


pat |>
inner_join(adm, join_by(subject_id)) |>
head() |>
spark_write_delta(
  "file:/dbfs/Data/ccdm/patient_admissions", 
  overwrite = TRUE,
options = c())

# COMMAND ----------

# MAGIC %fs ls /Data/ccdm/patient_admissions
