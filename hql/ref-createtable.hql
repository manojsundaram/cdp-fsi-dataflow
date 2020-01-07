create database if not exists realtimebankref;
CREATE TABLE if not exists realtimebankref.age_gender_demographics
(
`id` int,
age int,
gender string,
prop double,
PRIMARY KEY (`id`)
)
PARTITION BY HASH PARTITIONS 10
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

CREATE TABLE if not exists realtimebankref.customer_master
(
ssn string,
cc_num string,
`first` string,
`last` string,
gender string,
street string,
city string,
state string,
zip string,
lat string,
`long` string,
city_pop string,
job string,
dob string,
acct_num string,
profile string,
PRIMARY KEY (`ssn`)
)
PARTITION BY HASH PARTITIONS 10
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');

CREATE TABLE if not exists realtimebankref.merchant_db
(
merchant_id string,
category string,
merchant_name string,
PRIMARY KEY (merchant_id)
)
PARTITION BY HASH PARTITIONS 10
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');
