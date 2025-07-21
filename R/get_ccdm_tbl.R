

#' CoreCDM from DuckDB to Dbx SQL Serverless 
#' 

pacman::p_load(install = FALSE,
               "duckdb", 
               "dplyr", 
               "DBI",
               "odbc"
               )


config <- config::get(config = "local")
#config <- config::get(config = "dbx")


conn <- duckdb::dbConnect(
    drv = duckdb(
        "~/Projects/ccdm/Data/mimic4_demo.db",
        #"Data/mimic_iv_demo.db", 
        read_only = TRUE)) 


get_ccdm_tbl <- function(
        .conn = conn,
        table_name = NULL,
        ...
        ) {
        
    if(!class(table_name) == "AsIs") {
            cli_abort(c(
                "Must use I() to specific the table as a three-part name:",
                "x" = 'Please use I("{table_name}") instead.')
        )
    }
        
               
    #catalog = "CoreCDM"
    #schema  = "mimiciv_hosp"
    #table   = table_name
    
    if(class(.conn) == "duckdb_connection") {
        catalog = "mimic_iv_demo"
    }

    three_part_name <- glue::glue("{catalog}.{schema}.{table}", .con = .conn)
    result <- list() 
    result$conn <- class(.conn)
    result$name <- three_part_name
    result$rs <- tbl(.conn, table_name)
    
    result$rs
}

ccdm_list_tables <- function(.conn, schema = "mimiciv_hosp") {
    
    #dbListTables(.conn)
    dbGetQuery(.conn, "SHOW ALL TABLES ") |> 
        select(database, schema, name) |> 
        as_tibble()
}

ccdm_list_tables(conn) 


admissions      <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_hosp.admissions"))
patients        <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_hosp.patients"))
icustays        <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_icu.icustays"))

labevents       <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_hosp.labevents"))
d_labitems      <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_hosp.d_labitems"))

#poe
#poe_detail


chart_events    <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_icu.chartevents"))
datetime_events <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_icu.datetimeevents"))
dt_events       <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_icu.datetimeevents"))
items           <- get_ccdm_tbl(conn, I("mimic4_demo.mimiciv_icu.d_items"))


ccdm_tbl <- list()

# ICU stays 

icu_total_los <- icustays |> 
    group_by(hadm_id, subject_id) |> 
    summarise(
        los_icu = sum(los, na.rm = TRUE),
        .groups = "drop"
    ) |>
    mutate(icu_stay_flag = 1) |> 
    select(
        hadm_id, 
        subject_id,
        icu_stay_flag,
        los_icu
    ) |> 
    distinct()

# Encounters 
encounters <- 
    admissions |> 
    inner_join(patients, join_by(subject_id)) |> 
    left_join(icu_total_los, join_by(hadm_id, subject_id)) |>
    mutate(
        age = as.integer(anchor_age),
        admit_min = datepart('minute', admittime),
        ed_flag = as.integer(if_else(is.na(edregtime), 0, 1)),
        icu_stay_flag = as.integer(coalesce(icu_stay_flag, 0)),
        hospital_expire_flag = as.integer(hospital_expire_flag),
        #icu_los_days = los, 
        los_ed_hrs = as.integer(date_diff('minute', edregtime, edouttime))/60,
        los_hosp = as.integer(date_diff('hour', admittime, dischtime))/24
        #hosp_los_days = DATEDIFF(dischtime, admittime)
    ) |> 
    #filter(icu_stay_flag == 0) |> 
    select(
        hadm_id, 
        subject_id,
        registration_dttm = edregtime,
        ed_out_dttm = edouttime,
        admit_dttm = admittime,
        disch_dttm = dischtime,
        death_dttm = deathtime,
        admission_type, 
        admission_location, 
        discharge_location,
        age,
        gender,
        ends_with("_flag"),
        los_ed_hrs,
        los_icu,
        los_hosp, 
        admit_min
        
        #everything(), 
    ) 
    


# lab events

lab <- 
    labevents |> 
    inner_join(d_labitems, join_by(itemid), suffix = c("", ".dim")) |>
    select(
        labevent_id,
        hadm_id,
        subject_id, 
        specimen_id, 
        itemid,
        label, 
        fluid,
        category,
        storetime,
        value,
        value_nbr = valuenum,
        value_uom = valueuom,
        ref_range_lower,
        ref_range_upper,
        flag,
        priority,
        comments
    ) |>
    g()

# vital signs
vital_items <- items |> 
    filter(itemid %in% c(
        225309,
        227242,
        220180,
        223761,
        227243,
        220051,
        223762,
        220181,
        220045,
        225310,
        224643,
        220179,
        220050,
        224167,
        223851,
        220210
    )) |>
    select(
        itemid,
        label,
        unitname
    )

vital_signs <- 
    chart_events |> 
    inner_join(vital_items, join_by(itemid)) |> 
    select(
        hadm_id,
        subject_id,
        stay_id,
        charttime,
        label,
        value,
        value_nbr = valuenum,
        uom = valueuom
    ) 




# line events
ccdm_tbl$line_events <- dt_events |> 
    inner_join(items, join_by(itemid)) |> 
    filter(
        linksto == 'datetimeevents', 
        category == "Access Lines - Invasive"
        )


