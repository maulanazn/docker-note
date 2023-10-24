package main

import (
	"fmt"
	"net/http"
	"os"
)

func HelloServer(writer http.ResponseWriter, req *http.Request) {
	fmt.Fprint(writer, "Hello world")
}

func main() {
	port := os.Getenv("HOST_PORT")
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(":"+port, nil)
}
