-- Selects app_id and gender for July 2020 applications by joining model and features tables
select t.app_id, features.gender from
(select * from model where month(m_date)=7 and 
year(m_date)=2020
) t
outer join features 
on t.appid=features.app_id


-- Examples of different types of joins in SQL
left outer join
right outer join
full outer join


-- Example: Extract month and year from m_date column in model table
hive> select month(m_date),year(m_date) from model;

-- Example: Parameterized query using hiveconf variable for app_id
select * from model where app_id = ${hiveconf:id1};

-- Example: Select all records where score is exactly 0.5
select * from model where score = .5;

-- Example: Create a simple employee table with id column
create table emp(id int);

-- Example: Count the number of records in emp table
select count(*) from emp;