package main

import (
	"fmt"
	"net/http"
	"os"
	"runtime"
)

var echoText = os.Getenv("ECHO_TEXT")
var info = fmt.Sprintf("OS: %s\nArchitecture: %s\n", runtime.GOOS, runtime.GOARCH)

func main() {
	http.HandleFunc("/echo", httpEcho)
	http.ListenAndServe(":8080", nil)
}

func httpEcho(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(info + echoText))
}
