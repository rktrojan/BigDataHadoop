
wget https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv


--STATIC PARTITIONING
-- go to hive and follow below steps
create table titanic_p (PassengerId string,Survived string,Name string,sex string,Age string,SibSp string,Parch string,Ticket string,Fare string,Cabin string,Embarked string
) 
partitioned by (pclass string)
row format delimited 
fields terminated by ","
location "/user/cloudera/titanic";


--run this on linux
--make sub directories inside titanic folder
hdfs dfs -mkdir /user/cloudera/titanic/pclass=1
hdfs dfs -mkdir /user/cloudera/titanic/pclass=2
hdfs dfs -mkdir /user/cloudera/titanic/pclass=3

--data loading in static manner
hdfs dfs -put titanic_p1.csv /user/cloudera/titanic/pclass=1
hdfs dfs -put titanic_p2.csv /user/cloudera/titanic/pclass=2
hdfs dfs -put titanic_p3.csv /user/cloudera/titanic/pclass=3


--run this on Hive console
show partitions titanic;

--see top 10 records
select * from titanic limit 10;



