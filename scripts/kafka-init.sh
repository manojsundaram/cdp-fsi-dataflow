#!/bin/bash
kafka-topics --zookeeper `hostname`:2181 --list
kafka-topics --create --zookeeper `hostname`:2181 --replication-factor 1 --partitions 1 --topic realtimetxn
#kafka-console-consumer --bootstrap-server localhost:9092 --topic realtimebank --from-beginning
