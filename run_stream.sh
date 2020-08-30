#the hadoop streaming
hadoop fs -rmr /tmp/natasha.che/tq_ea584/

hadoop jar /opt/hadoop/hadoop-0.20.2/contrib/hadoop-streaming-0.20.2.jar \
  -D mapred.task.timeout=3600000 \
  -D mapred.job.priority=NORMAL \
  -D mapred.reduce.tasks=1 \
  -D stream.non.zero.exit.is.failure=true \
  -D stream.num.map.output.key.fields=12 \
  -D mapred.text.key.partitioner.options="-k1,1" \
  -D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
  -D mapred.text.key.comparator.options="-k1,1" \
  -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
  -input /user/hive/warehouse/tq_ea644_ad_unit_list20131006/ \
  -output /tmp/natasha.che/tq_ea584/ \
  -mapper " relabeling2.pl " \
  -reducer "reducer2.pl" \
  -verbose \
  -file reducer2.pl \
  -file relabeling2.pl