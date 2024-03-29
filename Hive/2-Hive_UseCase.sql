
hive>  

create table titanic_new(
PassengerId string
,Survive string 
,Pclass string 
,Name string 
,Sex string
,Age string
,SibSp string 
,Parch string 
,Ticket string 
,Fare  string 
,Cabin string 
,Embarked string );


hive> desc formatted titanic_new

--capture the LOCATION path for hive tables' FOLDER

=========================

linux> wget https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv

linux> hdfs dfs -put titanic.csv hdfs://ip-172-31-43-135.ec2.internal:8020/user/hive/warehouse/titanic_new
===========================================

hive> run the select query here to verify if data is loaded or NOT

========================================


select count(*) 
FROM titanic_new1 
where 
embarked in 
	(
	select embarked.station from embarked 
	where embarked.stationid=1 
	);




+---------------------+-------------------+
| embarked.stationid  | embarked.station  |
+---------------------+-------------------+
| 1                   | S                 |
| 2                   | C                 |
| 3                   | DELHI             |
| 4                   | Q                 |
| 5                   | MUMBAI            |
+---------------------+-------------------+


============================================
ADDITIONAL DDLs
============================================


CREATE TABLE IF NOT EXISTS titanic_new(
PassengerId int,
Survived int,
Pclass int, 
Name string,
Sex string,	
Age int,	
SibSp int ,
Parch int,	
Ticket string,
Fare float,
Cabin string,
Embarked string
) 
 row format  SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
 WITH 
 SERDEPROPERTIES 
 ( "separatorChar" = ",", "quoteChar" = "\"", "escapeChar" = "\\" ) 
 STORED AS TEXTFILE ;




create table policy_claims(
policyID string ,statecode string ,county string ,
eq_site_limit string ,hu_site_limit string ,
fl_site_limit string ,fr_site_limit string ,
tiv_2011 string ,tiv_2012 string ,eq_site_deductible string ,
hu_site_deductible string ,fl_site_deductible string ,
fr_site_deductible string ,
point_latitude string ,
point_longitude string ,line string ,
construction string ,point_granularity string
);

================================

select 
sum(temp.counter) as total_passengers,
temp.stid from 
( select 
s.*,
t.passengerid,
t.embarked,
1 as cnt,
nvl(passengerid,0) as zero,

case when passengerid is not null
then 1
else 0
end 
as counter

from 
stations s
left join
titanic_new t
on 
s.name=t.embarked) temp
group by temp.stid
========================================
drop table titanic111;

create table titanic111

as
select  

case 
when sex="male" then 0 
else 1 
end as gender_e ,


case 
when embarked="C" then 0 
when embarked="S" then 1 
when embarked="Q" then 2 
end as embarked_e 

 
from titanic_new;
