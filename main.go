package main

import (
	"net/http"
	"os"
)

var echoText = os.Getenv("ECHO_TEXT")

func main() {
	http.HandleFunc("/echo", httpEcho)
	http.ListenAndServe(":8080", nil)
}

func httpEcho(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(echoText))
}
