

cp -R /dbfs/R/library /databricks/spark/R/lib/

# System dependencies 

# Sparklyr
apt install libssl-dev

# DuckDB
ln -s /root/.duckdb/cli/1.3.1/duckdb /usr/bin/duckdb

echo R_CONFIG_ACTIVE=Dbx_community >> /etc/environment
echo R_LIB_PATH_MOUNTED=/dbfs/R/library >> /etc/environment
echo INIT_SCRIPT_TEST=Success >> /etc/environment
echo DATABRICKS_DEFAULT_R_REPOS=https://packagemanager.posit.co/cran/__linux__/manylinux_2_28/latest >> /etc/environment

```
R_CONFIG_ACTIVE=Dbx_community
R_LIB_PATH_MOUNTED=/dbfs/R/library
INIT_SCRIPT_TEST=Success
DATABRICKS_DEFAULT_R_REPOS=https://packagemanager.posit.co/cran/__linux__/manylinux_2_28/latest 

```

