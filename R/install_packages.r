# Databricks notebook source
start_time <- Sys.time()

#.libPaths()


# COMMAND ----------

#Sys.getenv()

# COMMAND ----------

## Add current working directory to library paths
wd <- getwd()

temp_r_library <- file.path("/tmp/R/library")
r_library <- file.path("/dbfs/R/library")
spark_r_library <- file.path("/databricks/spark/R/lib")


if(!dir.exists(temp_r_library)) { dir.create(temp_r_library, recursive = TRUE) }
if(!dir.exists(r_library)) { dir.create(r_library, recursive = TRUE) }

.libPaths(c(temp_r_library, .libPaths()))

#.libPaths()



# COMMAND ----------

install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))


# COMMAND ----------

my_packages <- c(
  "pacman",
  "rlang",
  "tidyverse",
  "sparklyr",
  "config",
  "duckdb",
  "REDCapR",
  "nanoparquet", 
  "arrow",
  "logger", 
  "aws.s3",
  "glue", 
  "prettyunits"
)

#pak::pkg_install("pacman")
pak::pak(my_packages)


# COMMAND ----------

fs::dir_copy(temp_r_library, r_library, overwrite = TRUE)

fs::dir_tree(r_library, recurse = FALSE)


# COMMAND ----------

#pak::pkg_install("aws.s3")
#pak::pkg_install("pacman")

# COMMAND ----------

#%fs cp file:/dbfs/R/library/aws.s3 /databricks/spark/R/lib -r

# COMMAND ----------

#%fs cp file:/dbfs/R/library/'aws.signature' /databricks/spark/R/lib -r


# COMMAND ----------

fs::dir_tree(r_library, recurse = FALSE)

# COMMAND ----------

fs::dir_copy(r_library, spark_r_library, overwrite = TRUE)

fs::dir_tree(spark_r_library, recurse = FALSE)

# COMMAND ----------

end_time <- Sys.time()

installed_packages <- length(my_packages)
elapsed_time <- difftime(end_time, start_time, units = 'sec')

glue::glue("{installed_packages} Packages installed in {prettyunits::pretty_sec(as.numeric(elapsed_time))}")
