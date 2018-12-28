# MongoDB Replicaset

This is a three node MongoDB [Replica Set](https://docs.mongodb.com/manual/replication/#replication-in-mongodb) implemented as a docker-compose app.
This is a useful tool for developing against MongoDB features only available on Replica Sets, such as [Change Streams](https://docs.mongodb.com/manual/changeStreams/).
The three nodes share the same dockerfile, and are started in replica set mode. There are an additional three steps to activate the replicaset once
you have built and spun up this app. Here are the commands:

1. Start a mongo shell:

        `docker exec -it -t <container id of mongo_node_0> mongo`

2. Run the init command in the shell:
        
        `rs.initiate({
                _id : "rs0",
                members: [
                    { _id: 0, host: "mongo_node_0:27017" },
                    { _id: 1, host: "mongo_node_1:27017" },
                    { _id: 2, host: "mongo_node_2:27017" }
                    ]
                })`

3. Check the status of the replicaset:

        `rs.status()`

[Additional info on deploying replicasets](https://docs.mongodb.com/manual/tutorial/deploy-replica-set/)
