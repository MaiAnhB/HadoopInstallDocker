# enter the master node
docker exec -it hadoop-master.1.$(docker service ps \
hadoop-master --no-trunc | tail -n 1 | awk '{print $1}' ) bash

# stop all Hadoop processes
sbin/stop-yarn.sh
sbin/stop-dfs.sh

# format namenode
bin/hadoop namenode -format

# start yarn and dfs nodes
sbin/start-dfs.sh
sbin/start-yarn.sh
start-yarn.sh


# prepare input files to hdfs:///user/root/test
bin/hdfs dfs -mkdir -p /user/root/test
bin/hdfs dfs -put etc/hadoop/* /user/root/test

# Run WordCount
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.4.jar \
wordcount test output
