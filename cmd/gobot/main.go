package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/itsaril/gobot/internal/handlers"
)

func main() {
	http.HandleFunc("/questions", handlers.QuestionHandler)
	fmt.Println("Server is running on port 8080...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
