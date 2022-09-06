image:
	docker build -t mowijo/cpp-cassandra-pistache-release:v2 .

push:
	docker push mowijo/cpp-cassandra-pistache-release:v2
