
library(odbc)


# Free
#Sys.setenv(DATABRICKS_HOST = "dbc-779868ff-f2af.cloud.databricks.com")

# S4 method for class 'DatabricksOdbcDriver'
conn <- dbConnect(
    drv = odbc::databricks(),
    httpPath = "/sql/1.0/warehouses/9f70acd8ebe5803f",
    uid = "token", 
    pwd = "new_PAT"
    )


# Legacy
Sys.setenv(DATABRICKS_HOST = "community.cloud.databricks.com")

oath_url <- "https://community.cloud.databricks.com/oidc"

# S4 method for class 'DatabricksOdbcDriver'
conn <- dbConnect(
    drv = odbc::databricks(),
    httpPath = "sql/protocolv1/o/3475590573577960/0712-181604-33ghp049",
    AuthMech = 11,
    Auth_Flow = 2,
    PWD = "my_password"
)
    
     #$pwd = "<my token>"
    )


    httpPath = "sql/protocolv1/o/1984252242175148/0609-005641-szjm4zq7",
    workspace = Sys.getenv("DATABRICKS_HOST"),
    useNativeQuery = TRUE,
    driver = "Simba Driver",
    uid = "token", 
    pwd = "<my token>",
)




library(sparklyr)
library(dplyr)
library(dbplyr)

sc <- sparklyr::spark_connect(
    master     = Sys.getenv("DATABRICKS_HOST"),
    cluster_id = "0608-161050-5rkxidtd",#Sys.getenv("DATABRICKS_CLUSTER_ID"),
    token      = Sys.getenv("DATABRICKS_TOKEN"),
    method     = "databricks_connect",
    envname    = "r-reticulate"
)

trips <- dplyr::tbl(
    sc,
    dbplyr::in_catalog("samples", "nyctaxi", "trips")
)

print(trips, n = 5)
