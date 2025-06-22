

cp -R /dbfs/R/library /databricks/spark/R/lib/

# System dependencies 

# Sparklyr
apt install libssl-dev

# DuckDB
ln -s /root/.duckdb/cli/1.3.1/duckdb /usr/bin/duckdb

echo INIT_SCRIPT_TEST=Success >> /etc/environment

