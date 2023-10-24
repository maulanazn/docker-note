package main

import (
	"fmt"
	"net/http"
	"os"
)

var counter int

func HelloServer(writer http.ResponseWriter, req *http.Request) {
	fmt.Fprint(writer, "Hello world")
}

func Counter(writer http.ResponseWriter, req *http.Request) {
	counter++

	if counter > 5 {
		writer.WriteHeader(500)
		fmt.Fprint(writer, "KO")
	} else {
		fmt.Fprint(writer, "Hello world")
	}
}

func main() {
	port := os.Getenv("HOST_PORT")
	http.HandleFunc("/", HelloServer)
	http.HandleFunc("/trigger", Counter)
	http.ListenAndServe(":"+port, nil)
}
