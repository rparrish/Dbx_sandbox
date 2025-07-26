# Databricks notebook source
table_name = dbutils.widgets.get("table_names")

print(table_name)


# COMMAND ----------

# MAGIC %sql 
# MAGIC
# MAGIC SELECT * FROM metastore.ccdm.:table_names