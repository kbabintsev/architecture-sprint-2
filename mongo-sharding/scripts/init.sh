docker compose exec -T configSrv mongosh --port 27016 --quiet <<EOF
rs.initiate(
  {
    _id : "config_server",
       configsvr: true,
    members: [
      { _id : 0, host : "configSrv:27016" }
    ]
  }
);
exit();
EOF

docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
rs.initiate({_id: "shard1", members: [
{_id: 0, host: "shard1:27018"}
]});
exit();
EOF

docker compose exec -T shard2 mongosh --port 27021 --quiet <<EOF
rs.initiate({_id: "shard2", members: [
{_id: 0, host: "shard2:27021"}
]});
exit();
EOF

docker compose exec -T mongos_router mongosh --port 27017 --quiet <<EOF
sh.addShard("shard1/shard1:27018");
sh.addShard("shard2/shard2:27021");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb
if (0 == db.helloDoc.countDocuments()) {
  for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})
}
exit();
EOF