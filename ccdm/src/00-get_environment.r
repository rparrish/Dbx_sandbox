# Databricks notebook source
# where are we?
if(1 == 0 && !is.null(Sys.getenv("DB_HOME"))) { 
    r_lib_path <- "/dbfs/R/library"
    .libPaths(c(r_lib_path, .libPaths()))
    Sys.setenv(R_CONFIG_FILE = "/dbfs/config/sandbox/config.yml")

config <- config::get()
config

}

# COMMAND ----------

pacman::p_load(
  duckdb, 
  dplyr
)

# COMMAND ----------

getwd()


# COMMAND ----------

Sys.info()


# COMMAND ----------

Sys.getenv()
