docker service create \
	--name hadoop-master \
	--network swarm-net \
	--hostname hadoop-master \
	--constraint node.role==manager \
	--replicas 1 \
	--endpoint-mode dnsrr \
	daphnemaianh/hadoop:2.7.4
