package models

type Response struct {
	ID        int    `json:"id"`
	Question  string `json:"question"`
	Response  string `json:"response"`
	CreatedAt string `json:"created_at"`
}
