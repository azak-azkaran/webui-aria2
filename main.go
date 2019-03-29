package main

import (
	"io"
	"log"
	"net/http"
	"os"
)

var (
	Info    *log.Logger
	Warning *log.Logger
	Error   *log.Logger
)

func Init(
	infoHandle io.Writer,
	warningHandle io.Writer,
	errorHandle io.Writer) {

	Info = log.New(infoHandle,
		"INFO: ",
		log.Ldate|log.Ltime|log.Lshortfile)

	Warning = log.New(warningHandle,
		"WARNING: ",
		log.Ldate|log.Ltime|log.Lshortfile)

	Error = log.New(errorHandle,
		"ERROR: ",
		log.Ldate|log.Ltime|log.Lshortfile)
}

func main() {
	Init(os.Stdout, os.Stdout, os.Stderr)
	Info.Println("Starting HTTTP Server")

	for {
		fs := http.FileServer(http.Dir("/webui-aria2/"))
		http.Handle("/", fs)

		if err := http.ListenAndServe(":8080", nil); err != nil {
			Error.Println(err)
		}
	}
	Info.Println("Stoping HTTP Server")

}
