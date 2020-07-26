select t.app_id, features.gender from
(select * from model where month(m_date)=7 and 
year(m_date)=2020
) t
outer join features 
on t.appid=features.app_id


left outer join
right outer join
full outer join


hive> select month(m_date),year(m_date) from model;

select * from model where app_id = ${hiveconf:id1};

select * from model where score = .5;

create table emp(id int);

select count(*) from emp;