package main

import (
	"fmt"
	"log"
	"net/http"
)

const webPort = "80"

type Config struct{}

func main() {

	app := Config{}

	log.Printf("Starting broker service on port %s", webPort)

	// define http server

	server := &http.Server{
		Addr:    fmt.Sprintf(":%s", webPort),
		Handler: app.routes(),
	}

	// starte the server

	err := server.ListenAndServe()

	if err != nil {
		log.Panic(err)
	}
}
