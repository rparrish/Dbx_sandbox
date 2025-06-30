
# brickster

library(brickster)
library(dplyr)
library(tidyr)
library(purrr)
library(tibble)

options(use_databrickscfg = TRUE)
options(db_profile = "Dev")


## Cluster management 

clusters <- db_cluster_list() |> g()
    enframe() |>
    unnest_wider(col = value) |> 
    unnest_wider(col = default_tags) |> 
    unnest_wider(col = custom_tags)

g(clusters)

cluster_id <- 
    clusters |>
    filter(cluster_name == "single-node") |> 
    pull(cluster_id)


## Cluster node types 

db_cluster_list_node_types() |>
    enframe() |>
    #unnest_wider(col = value, names_sep = "_") |> 
    g()


db_cluster_pin(cluster_id = cluster_id)


db_cluster_start(cluster_id = cluster_id)


## Queries 
# requires SQL Warehouse/UC

# db_sql_query(cluster_id, "SELECT * FROM mimiv_iv_demo.hosp_patients")

# Databricks REPL

db_repl(cluster_id = cluster_id)

## Secrets 

db_secrets_scope_list_all() |>  
    enframe()   |> 
    unnest_longer(value) |>
    hoist(value, scope = 1, backend = 2) |> 
    select(-name)

db_secrets_scope_create("deleteme")

db_secrets_list(scope = "deleteme")
db_secrets_put(
    scope = "deleteme", 
    key = "my_secret_key", 
    value = "shhh....this is the secret")
    
db_secrets_list(scope = "deleteme") |>
    enframe()   |> 
    unnest_longer(value) |> 
    hoist(value, key_name = 1, last_updated_timestamp = 2) |>
    #mutate(last_updated_timestamp = anytime::anytime(last_updated_timestamp)) |>
    select(-name) 

## Workspace 
db_workspace_list("/Users/rparrish@flightweb.com/Dbx_sandbox") |>
    enframe() |>
    unnest_wider(value) #|> 

