
drop table airlines;

create table airlines (
Year int,Quarter int ,Averagerevenue float ,totalseats int) 
row format delimited 
fields terminated by ",";


--Hive partitioning example
CREATE TABLE airlines_p (
Averagerevenue float ,totalseats int) 
PARTITIONED BY (Year int, Quarter int )
row format delimited 
fields terminated by ",";


 INSERT INTO airlines_P  SELECT * FROM airlines_new;   -- will throw error


 INSERT INTO 
 airlines_P PARTITION(year) 
 select Quarter, Averagerevenue ,totalseats, year    -- year must be last column here
 from airlines_new;

--NESTED PARTITIONING EXAMPLE
 --insert into airlines_P PARTITION(year, quarter) 
 --select Averagerevenue ,totalseats, year Quarter from airlines_new;

--
--select * from 
--airlines_P
--where year=2017 
--and quarter=1;



--select * from 
--airlines_P
--where year=2017 
--and quarter=2;




-- Partioning  -- low cardinality
-- Bucketing   -- high cardinality

=================

--STATIC PARTITIONING example

create table xyz_2017 (
totalseats  int,Quarter int, Averagerevenue float, ROI int ) ;


CREATE TABLE xyz_2018 
(
Quarter int, Averagerevenue float ,totalseats  int
);



 INSERT INTO airlines_P PARTITION(year=2017) 
 SELECT Quarter, Averagerevenue ,totalseats  
 FROM xyz_2017;

 INSERT INTO airlines_P PARTITION(year=2018) 
 SELECT Quarter, Averagerevenue ,totalseats  
 FROM xyz_2018;

================================================================================

--HIVE BUCKETING EXAMPLE
CREATE TABLE us_presidents(
 pres_id tinyint,
 pres_name string,
 pres_dob date,
 pres_state string,
 pres_in date,
 pres_out date)
 CLUSTERED BY (pres_id) INTO 5 BUCKETS;


--HIVE PARTITIONING EXAMPLE
CREATE TABLE us_presidents_2(
 pres_id tinyint,
 pres_name string,
 pres_dob date,
 pres_in date,
 pres_out date)
 PARTITIONED BY (pres_state string);


CREATE TABLE airlines_b 
(Year int,Quarter int ,Averagerevenue float ,totalseats int) 
 CLUSTERED BY (totalseats) INTO 4 BUCKETS
ROW FORMAT delimited 
fields terminated by ",";


INSERT INTO airlines_b 
SELECT Year ,Quarter  ,Averagerevenue  ,totalseats  FROM airlines_new;






