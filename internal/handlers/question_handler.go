package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/itsaril/gobot/internal/utils"
)

// QuestionHandler обрабатывает запросы о вопросах пользователей
func QuestionHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		utils.SendJSONResponse(w, http.StatusMethodNotAllowed, map[string]string{"error": "Method not allowed"})
		return
	}

	type questionRequest struct {
		Question string `json:"question"`
	}

	var req questionRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		utils.SendJSONResponse(w, http.StatusBadRequest, map[string]string{"error": "Bad request"})
		return
	}

	// Пока что просто возвращаем тестовый ответ
	response := "Это тестовый ответ на ваш вопрос: " + req.Question

	utils.SendJSONResponse(w, http.StatusOK, map[string]string{"response": response})
}

func MyHandler(w http.ResponseWriter, r *http.Request) {
	// Используем функцию из пакета utils
	utils.SendJSONResponse(w, http.StatusOK, map[string]string{"message": "Hello, world!"})
}
