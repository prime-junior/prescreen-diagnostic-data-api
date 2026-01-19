-- Create a separate role for the prescreen database
CREATE ROLE prescreen_db WITH LOGIN PASSWORD 'fs1db';

-- Enable the prescreen db to create a table
ALTER ROLE prescreen_db CREATEDB;

-- Create a database to import the df_prescreen_cleaned.csv file
CREATE DATABASE prescreen_diag_data_api;

-- Create a table
CREATE TABLE prescreen_diag_data (
    ID SERIAL PRIMARY KEY, 
    created_time TEXT, 
    h_number TEXT, 
    entry_type TEXT, 
    technician TEXT, 
    source TEXT, 
    year INTEGER, 
    make TEXT, 
    model TEXT, 
    engine_size TEXT, 
    hdw_part_number TEXT, 
    part_number TEXT, 
    original_problems TEXT, 
    original_dtcs TEXT, 
    fs1_ecu_problems TEXT, 
    fs1_ecu_dtcs TEXT, 
    problems_related TEXT, 
    additional_notes TEXT, 
    resolution TEXT
);

-- Import the df_prescreen_cleaned.csv to the database
-- used \copy command because COPY is not authorized
\copy prescreen_diag_data (created_time, h_number, entry_type, technician, source, year, make, model, engine_size, hdw_part_number, part_number, original_problems, original_dtcs, fs1_ecu_problems, fs1_ecu_dtcs, problems_related, additional_notes, resolution) FROM 'C:\Language_Projects\Language_Projects\Python\Flagship_1\automotive_diagnostic_data_cleaning\data\data_cleaned\df_prescreen_cleaned.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- Grant admin privileges to the db. 
-- Command CAN BE executed through the user: prescreen_db
GRANT ALL PRIVILEGES ON DATABASE prescreen_diag_data_api TO prescreen_db;

-- Grant privileges under all tables from the schema public
-- Command MUST BE executed through the SUPERUSER: postgres
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO prescreen_db;

-- Grant all privileges on table prescreen_diag_data
GRANT ALL PRIVILEGES ON TABLE prescreen_diag_data TO prescreen_db