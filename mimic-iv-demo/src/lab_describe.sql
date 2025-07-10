-- Databricks notebook source
DESCRIBE DETAIL metastore.ccdm.lab

-- COMMAND ----------


SELECT 
name, 
description,
numFiles,
ROUND(sizeinBytes/1024, 2) as sizeinKb,
partitionColumns,
clusteringColumns

FROM _sqldf 
