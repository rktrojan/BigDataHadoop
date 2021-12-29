--HQL-July2021

--hive tab;e with below columns/fields
--PassengerId,Survived,Pclass,Name,Sex,Age,SibSp,Parch,Ticket,Fare,Cabin,Embarked


drop table if exists titanic;

create table if not exists titanic(
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
 row format delimited 
 fields terminated by ',';
 --SERDE -- LAZYSIMPLESERDE
 
 
 
 
 
 
 
================================================================================================


beeline -u jdbc:hive2://localhost:10000/default -n hive -p hive


select passengerid 
,survived    
,pclass      
,name        
,sex         
,age 
,sibsp       
,parch        
 from titanic_new

--additional fields       
,ticket      
,fare        
,cabin       
,embarked    
==================

--sample data from file
PassengerId,Survived,Pclass,Name,Sex,Age,SibSp,Parch,Ticket,Fare,Cabin,Embarked
1,0,3,"Braund, Mr. Owen Harris",male,22,1,0,A/5 21171,7.25,,S
2,1,1,"Cumings, Mrs. John Bradley",female,38,1,0,PC 17599,71.2833,C85,C
3,1,3,"Heikkinen, Miss. Laina",female,26,0,0,STON/O2. 3101282,7.925,,S
4,1,1,"Futrelle, Mrs. Jacques Heath (Lily May Peel)",female,35,1,0,113803,53.1,C123,S


--useing OPENCSV serde
create table if not exists titanic_new(
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
 
 
--analytics questions solving:: 
select 
count(*),sex  
from titanic_new  
where survived=1 
group by sex;



 select 
 count(*),sex 
 from 
 (select *  from titanic_new  where survived=1) temp 
 group by sex;


select * from 
( select count(*),sex,survived  from titanic_new  group by sex,survived) temp
where survived=1;

-----------------------------------------------------------------------------------------


create table titanic1 like titanic; --ONLY copy schema/metadata of table


--CTAS command/sql

create table titanic2 as select * from  titanic_new; #-- also copies the data of table

--create tables across databases in hive
create table imarticus.titanic as select * from default.titanic;

--setting hive properties or system settings
set hive.execution.engine=mr; --other values are tez and spark






