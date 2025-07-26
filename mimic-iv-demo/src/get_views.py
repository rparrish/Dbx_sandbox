# Databricks notebook source
# MAGIC %sql
# MAGIC SELECT 
# MAGIC table_name
# MAGIC
# MAGIC FROM metastore.information_schema.views
# MAGIC WHERE 1=1
# MAGIC AND table_name LIKE 'v\_%'
# MAGIC

# COMMAND ----------


df = spark.sql("""
SELECT 
table_name 
FROM metastore.information_schema.views 
WHERE 1=1 
AND table_name LIKE 'v\_%'
""")


#dbutils.jobs.taskValues.set(key = "my_views", value = df.toPandas()['table_name'])

# COMMAND ----------

import pandas 

table_names = list(df.toPandas()['table_name'])
dbutils.jobs.taskValues.set(key = "table_names", value = table_names)