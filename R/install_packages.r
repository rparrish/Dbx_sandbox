# Databricks notebook source
#config <- config::get()
os_version <- Sys.info()['version']

options(repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/focal/latest"))
if(grepl("20.04", os_version)) {
options(repos = c(CRAN = "https://packagemanager.posit.co/cran/__linux__/jammy/latest"))
}

options()$repos
#.libPaths()
start_time <- Sys.time()

# COMMAND ----------

#Sys.getenv()

# COMMAND ----------

## Add current working directory to library paths
wd <- getwd()

temp_r_library <- file.path("/tmp/R/library")
r_library <- file.path("/dbfs/R/library")

if(!dir.exists(temp_r_library)) { dir.create(temp_r_library, recursive = TRUE) }
if(!dir.exists(r_library)) { dir.create(r_library, recursive = TRUE) }

.libPaths(c(temp_r_library, .libPaths()))

.libPaths()



# COMMAND ----------

dir("/dbfs/")

# COMMAND ----------

# MAGIC %sh
# MAGIC
# MAGIC cat /etc/os-release

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
  "glue", 
  "prettyunits"
)

#pak::pkg_install("pacman")
pak::pak(my_packages)


# COMMAND ----------

#fs::dir_copy(temp_r_library, r_library, overwrite = TRUE)

fs::dir_tree(r_library, recursive = FALSE)


# COMMAND ----------

end_time <- Sys.time()

installed_packages <- length(my_packages)
elapsed_time <- difftime(end_time, start_time, units = 'sec')

glue::glue("{installed_packages} Packages installed in {prettyunits::pretty_sec(as.numeric(elapsed_time))}")
