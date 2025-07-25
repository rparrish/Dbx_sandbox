
library(DBI)
library(duckdb)
library(purrr)
library(aws.s3)
library(stringr)
library(glue)
library(dm)


#s3a://physionet-open/mimic-iv-demo/2.2/hosp/admissions.csv.gz

#drv <- duckdb("Data/mimic_iv_demo.db", read_only = TRUE)
drv <- duckdb("Data/mimic_iv_demo.db")

conn <- dbConnect(drv)

dbExecute(conn, "CREATE OR REPLACE SCHEMA hosp")
dbExecute(conn, "CREATE OR REPLACE SCHEMA icu")

#dbExecute(conn, "DROP SCHEMA hosp CASCADE")
#dbExecute(conn, "DROP SCHEMA icu CASCADE")

bucket_name <- "s3://physionet-open/mimic-iv-demo"

file_list <- get_bucket_df(bucket_name, prefix = "mimic-iv-demo/2.2") |> 
    filter(stringr::str_ends(Key, ".csv.gz")) |>
    pull(Key)

s3_file_path <- paste0("s3a://physionet-open/", file_list)

build_dbx_views <- function(file_path) {

   schema <- str_extract(file_path, "(^.*?)/", group = 1) 
   schema <- str_replace_all(schema, "-", "_")
   
   table <- str_extract(file_path, "2.2/(.*)/*.csv.gz", group = 1) 
   table <- str_replace(table, "/", "_")
   
   
   dbx_sql <- glue_sql("
CREATE OR REPLACE VIEW mimic_iv_demo.{`table`} as 
SELECT * 
FROM read_files(
  {s3_file_path}, 
  format => 'csv',
  header => TRUE
  );

", 
   .con = conn)
   
   results <- list()
   
   results$file_path <- file_path
   results$s3_file_path <- s3_file_path
   results$schema <- schema
   results$table <- table 
   results$sql <- dbx_sql
   results$rs <- rs
   
   results$sql
}



build_duckdb_views <- function(file_path) {

   # schema <- str_extract(file_path, ".*/2.2/(.*?)/.*", group = 1) 
   # #schema <- str_replace_all(schema, "-", "_")
   # 
   # #table <- str_replace(table, "/", "_")
   # 
   
   if(duckdb::dbIsValid(conn)) { 
        
   schema <- str_extract(file_path, "^.*/2.2/(.*?)/", group = 1) 
   #schema <- str_replace_all(schema, "-", "_")
    
   table <- str_extract(file_path, regex("^.*/(.*).csv.gz"), group = 1) 
   #table <- str_replace(table, "/", "_")
         
       #s3_path <- paste0("s3a://physionet-open/", file_path)
        
    duckdb_sql <- 
       glue_sql("
       CREATE OR REPLACE VIEW {`schema`}.{`table`} as 
       FROM read_csv({`file_path`})
       ", 
       .con = conn) 
        
       rs <- dbExecute(conn, duckdb_sql)
   }
   
   results <- list()
   
   results$file_path <- file_path
   results$s3_file_path <- s3_file_path
   results$schema <- schema
   results$table <- table 
   results$sql <- duckdb_sql
   results$rs <- rs
   
   results$sql
}

my_sql_file <- 
    s3_file_path |> 
    map( ~ build_duckdb_views(.), .progress = TRUE) 


dbExecute(sc, "CREATE SCHEMA IF NOT EXISTS mimic_iv_demo;")

# single view
#build_views(file_list[1])

admissions <- tbl(conn, I("mimic_iv_demo.hosp.admissions"))
patients <- tbl(conn, I("mimic_iv_demo.hosp.patients"))
items <- tbl(conn, I("mimic_iv_demo.icu.d_items"))


## Data Model

dm <- dm_from_con(conn)



duckdb::duckdb_shutdown(drv)
duckdb::dbDisconnect(conn)

