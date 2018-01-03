package Cassandra

import (
	"fmt"

	"github.com/gocql/gocql"
)

// Session holds our connection to Cassandra
var Session *gocql.Session

func init() {
	var err error

	//cluster := gocql.NewCluster("172.30.80.208")
	//env := os.Getenv("")
	cluster := gocql.NewCluster("cassandra")
	cluster.Keyspace = "streamdemoapi"
	Session, err = cluster.CreateSession()
	if err != nil {
		panic(err)
	}
	fmt.Println("cassandra init done")
}
