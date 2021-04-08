create table impressions (
    requestBeginTime string, 
	requestEndTime string, 
	hostname string
  )
  partitioned by (
    dt string
  )
  row format 
    serde 'com.amazon.elasticmapreduce.JsonSerde'
    with serdeproperties ( 
      'paths'='requestBeginTime, requestEndTime, hostname'
    )