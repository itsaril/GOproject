package postgres

import (
	"context"
	"database/sql"
	"log"
	"os"

	_ "github.com/lib/pq"
)
var db *sql.DB

func init() {
	connStr := "host=" + os.Getenv("DB_HOST") + " port=" + os.Getenv("DB_PORT") + " user=" + os.Getenv("DB_USER") + " password=" + os.Getenv("DB_PASSWORD") + " dbname=" + os.Getenv("DB_NAME") + " sslmode=disable"

	var err error
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal("Error connecting to database:", err)
	}

	if err := db.PingContext(context.Background()); err != nil {
		log.Fatal("Error pinging database:", err)
	}

	log.Println("Connected to PostgreSQL database")
}
