# Databricks notebook source
pacman::p_load(
"DBI",
"duckdb",
"purrr",
"dplyr",
"sparklyr",
"aws.s3",
"stringr",
"glue"
)


# COMMAND ----------

# MAGIC %run "./R/functions.r"

# COMMAND ----------

sc <- spark_connect(method = "databricks")

# COMMAND ----------




file_list <- get_bucket_df(
    "s3://physionet-open/mimic-iv-demo", 
    prefix = "mimic-iv-demo/2.2") |> 
    filter(stringr::str_ends(Key, ".csv.gz")) |>
    pull(Key)

dbExecute(sc, "CREATE SCHEMA IF NOT EXISTS mimic_iv_demo;")

# build the mimic-iv-demo views  
walk(file_list, ~ build_mimic_iv_views(.), .progress = TRUE)




# COMMAND ----------

dbGetQuery(sc, "SHOW VIEWS IN mimic_iv_demo") |>
display()


# COMMAND ----------

spark_disconnect(sc)