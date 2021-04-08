
wget https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv

--DYNAMIC PARTITIONING
--run below queries in Hive
create table titanic_p (PassengerId string,Survived string, pclass string,Name string,Age string,SibSp string,Parch string,Ticket string,Fare string,Cabin string,Embarked string
) 
partitioned by (sex string)
row format delimited 
fields terminated by ",";

--location clause is optional

load data local inpath "/home/cloudera/titanic.csv" into table titanic_p partition(sex);
--inpath is to be used if file is on linux, not when file is on HDFS


insert into titanic_p partition(pclass)
select * from titanic;
--make sure that last column of titanic table is pclass


show partitions titanic_p;
desc formatted titanic_p;

