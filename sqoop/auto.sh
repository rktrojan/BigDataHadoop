
echo $1

c=DBS"_"$1

# Print the first argument passed to the script
# Construct the target directory name by appending the argument to 'DBS_'
# Run Sqoop import to fetch data from MySQL 'orders' table into HDFS
sqoop import \
--connect jdbc:mysql://localhost:3306/retail_db \
--username root \
--password cloudera \
--table orders \
--target-dir /user/cloudera/$c \
-m 6


