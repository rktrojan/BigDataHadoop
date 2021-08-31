----------------------
----------------------
CRICKET DATA ANALYSIS
----------------------
----------------------

============================================================

--GITHUB LINK for data file

https://raw.githubusercontent.com/outside-edge/get-cricket-data/master/data/final_output.csv


use wget command on linux to download this data

============================================================
 
--HIVE QUERIES

CREATE TABLE cricket(
url string ,  team1 string ,  team2 string ,  win_toss string , 
 bat_or_bowl string ,  outcome string ,  win_game string , 
 dt string ,  day_n_night string ,  ground string ,  
 rain string ,  duckworth_lewis string ,  match_id string ,  
 type_of_match string) 
 row format  SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH 
 SERDEPROPERTIES 
 ( "separatorChar" = ",", "quoteChar" = "\"", "escapeChar" = "\\" ) 
 STORED AS TEXTFILE ; 
 
 
 




select win_game,count(*) as cnt
from cricket 
where trim(ground)="M Chinnaswamy Stadium, Bangalore"
and type_of_match="ODI" 
and (trim(outcome) !="Match tied")
group by win_game 
order by cnt desc 
limit 5;
 
 
 Select sum(outcome_value) from  
(
select 
bat_or_bowl, outcome, ground , 
case 
when outcome like "%win%" then 1 
when outcome like "%loose%" then 0 
end 
as outcome_value 
from cricket
 ) temp 
	where ground = 'Victoria' and outcome =1
	group by ground ,bat_or_bowl ;
	
	

create table sports(
url string, team1 string, team2 string, win_toss string, bat_or_bowl string, outcome string, win_game string, 
match_date string, day_n_night string, ground string, rain string, duckworth_lewis string, match_id string, type_of_match string) 
 row format  SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH 
 SERDEPROPERTIES 
 ( "separatorChar" = ",", "quoteChar" = "\"", "escapeChar" = "\\" ) 
 STORED AS TEXTFILE ; 
 
 

select win_game,count(*)  as cnt from sports
where type_of_match="T20"
group by win_game
order by cnt desc
limit 5 ;
=================================================





--MYSQL table create command

create table cricket(
url  varchar(100) ,  team1  varchar(100) ,  team2  varchar(100) ,  win_toss  varchar(100) , 
 bat_or_bowl  varchar(100) ,  outcome  varchar(100) ,  win_game  varchar(100) , 
 dt  varchar(100) ,  day_n_night  varchar(100) ,  ground  varchar(100) ,  
 rain  varchar(100) ,  duckworth_lewis  varchar(100) ,  match_id  varchar(100) ,  
 type_of_match  varchar(100));


--sqoop export statement


sqoop export \
--connect jdbc:mysql://ip-172-31-35-63:3306/hive \
--username <mysql-username> \
--password <mysql-password> \
--table cricket \
--input-optionally-enclosed-by '\"' \
--export-dir /user/hadoop/cricket 


