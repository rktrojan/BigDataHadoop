--CTAS 

create table temp2 as 
select sum(price) as sm,pid
(select * from R where pid in 
(select pid from L where pcat="jeans")
) temp1 group by pid
-----------------
sm,pid
2600,1
9000,3

------------------
select temp2.pid,temp2.sm/L.price as QTY from 
temp2 
 join 
 L 
 on temp2.pid = L.pid

----------------
sm,pid,
2600,1,1,100,jeans
9000,3,3,1000,jeans





