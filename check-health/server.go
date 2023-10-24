package main

import (
	"fmt"
	"net/http"
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
	http.HandleFunc("/", HelloServer)
	http.HandleFunc("/trigger", Counter)
	http.ListenAndServe(":3000", nil)
}
