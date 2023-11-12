package main

import (
	"context"
	"fmt"
	"time"

	"github.com/redis/go-redis/v9"
)

func main() {
	db := redis.NewClient(&redis.Options{
		Addr:     "localhost:6379",
		Username: "maulanazn",
		Password: "maulanazn123",
	})

	err := db.Set(context.TODO(), "name", "maulana", 10*time.Second)
	if err != nil {
		panic(err)
	}

	valname, valnameerr := db.Get(context.Background(), "name").Result()
	if valnameerr == redis.Nil {
		fmt.Println("Key does not exist")
	} else if valnameerr != nil {
		panic(valnameerr)
	} else {
		fmt.Println("Key name has value ", valname)
	}
}
