package main

import (
	"fmt"
	"net/http"
	"os"
)

func HelloServer(writer http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(writer, "Hello world, as %s", req.URL.Path[1:])

	dataString := "Hello " + req.URL.Path[1:]
	dataBytes := []byte(dataString)

	destination := os.Getenv("APP_DATA")
	file := destination + "/" + req.URL.Path[1:] + ".txt"
	err := os.WriteFile(file, dataBytes, 0755)
	if err != nil {
		panic(err)
	}

	fmt.Println("Writed file as " + file)
}

func main() {
	port := os.Getenv("HOST_PORT")
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(":"+port, nil)
}
