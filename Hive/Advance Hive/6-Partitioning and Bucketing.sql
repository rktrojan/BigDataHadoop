-- =====================================================================
-- Partitioning and Bucketing in Hive - Example Scenarios (Aug 2021)
-- =====================================================================

-- Drop the airlines table if it exists
drop table airlines;

-- Create a basic airlines table (no partitioning or bucketing)
create table airlines (
    Year int,
    Quarter int,
    Averagerevenue float,
    totalseats int
) row format delimited 
fields terminated by ",";

-- ===================== Partitioning Example ==========================
-- Create a partitioned table: partitions on Year and Quarter
CREATE TABLE airlines_p (
    Averagerevenue float,
    totalseats int
) PARTITIONED BY (Year int, Quarter int)
row format delimited 
fields terminated by ",";

-- This insert will fail: partition columns must be handled explicitly
INSERT INTO airlines_P SELECT * FROM airlines_new;   -- will throw error

-- Correct insert: specify partition column at the end and in PARTITION clause
INSERT INTO airlines_P PARTITION(year) 
select Quarter, Averagerevenue, totalseats, year    -- year must be last column here
from airlines_new;

-- Example for nested partitioning (uncomment to use)
-- INSERT INTO airlines_P PARTITION(year, quarter)
-- SELECT Averagerevenue, totalseats, year, Quarter FROM airlines_new;

-- Example queries for partitioned table
-- SELECT * FROM airlines_P WHERE year=2017 AND quarter=1;
-- SELECT * FROM airlines_P WHERE year=2017 AND quarter=2;

-- Notes:
-- Partitioning is best for columns with low cardinality (few unique values)
-- Bucketing is best for columns with high cardinality (many unique values)

======================================================================

-- ===================== Static Partitioning Example ===================
-- Create tables for static partitioning demo
create table xyz_2017 (
    totalseats int,
    Quarter int,
    Averagerevenue float,
    ROI int
);

CREATE TABLE xyz_2018 (
    Quarter int,
    Averagerevenue float,
    totalseats int
);

-- Insert data into a specific partition (static partitioning)
INSERT INTO airlines_P PARTITION(year=2017) 
SELECT Quarter, Averagerevenue, totalseats  
FROM xyz_2017;

INSERT INTO airlines_P PARTITION(year=2018) 
SELECT Quarter, Averagerevenue, totalseats  
FROM xyz_2018;

======================================================================

-- ===================== Bucketing Example ===========================
-- Create a table with bucketing on pres_id
CREATE TABLE us_presidents(
    pres_id tinyint,
    pres_name string,
    pres_dob date,
    pres_state string,
    pres_in date,
    pres_out date
) CLUSTERED BY (pres_id) INTO 5 BUCKETS;

-- Create a partitioned table for comparison
CREATE TABLE us_presidents_2(
    pres_id tinyint,
    pres_name string,
    pres_dob date,
    pres_in date,
    pres_out date
) PARTITIONED BY (pres_state string);

-- Airlines table with bucketing on totalseats
CREATE TABLE airlines_b (
    Year int,
    Quarter int,
    Averagerevenue float,
    totalseats int
) CLUSTERED BY (totalseats) INTO 4 BUCKETS
ROW FORMAT delimited 
fields terminated by ",";

-- Insert data into bucketed airlines table
INSERT INTO airlines_b 
SELECT Year, Quarter, Averagerevenue, totalseats FROM airlines_new;