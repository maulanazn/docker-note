package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

func greet(w http.ResponseWriter, r *http.Request) {
	mode := os.Getenv("MODE")
	switch mode {
	case "dev":
		fmt.Fprintf(w, "Hello World! %s, running on local (developer only)", time.Now())
		break
	case "prod":
		fmt.Fprintf(w, "Hello World! %s, running on production, ready to action", time.Now())
	}
}

func checkcount(w http.ResponseWriter, r *http.Request) {
	var counter int
	counter += 1
	fmt.Fprintf(w, "Hello World! in %d", counter)
}

func hitme(w http.ResponseWriter, r *http.Request) {
	var counter int
	counter += 1
	if counter > 10 {
		w.WriteHeader(500)
		fmt.Fprint(w, "Hello World! in")
	} else {
		fmt.Fprint(w, "KO")
	}
}

func main() {
	port := os.Getenv("HOST_PORT")
	http.HandleFunc("/", greet)
	http.HandleFunc("/count", checkcount)
	http.HandleFunc("/hitme", hitme)
	http.ListenAndServe(":"+port, nil)
}
