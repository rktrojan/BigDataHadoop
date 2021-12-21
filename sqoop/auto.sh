
echo $1

c=DBS"_"$1


sqoop import \
--connect jdbc:mysql://localhost:3306/retail_db \
--username root \
--password cloudera \
--table orders \
--target-dir /user/hadoop/$c \
-m 6


