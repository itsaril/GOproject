package tests

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/itsaril/gobot/internal/handlers"
)

func TestQuestionHandler(t *testing.T) {
	t.Parallel()

	testCases := []struct {
		name     string
		question string
	}{
		{
			name:     "Valid Question",
			question: "What is Golang?",
		},
		{
			name:     "Empty Question",
			question: "",
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			reqBody := map[string]string{"question": tc.question}
			reqJSON, _ := json.Marshal(reqBody)

			req, err := http.NewRequest("POST", "/questions", bytes.NewBuffer(reqJSON))
			if err != nil {
				t.Fatalf("could not create request: %v", err)
			}

			rr := httptest.NewRecorder()
			handler := http.HandlerFunc(handlers.QuestionHandler)

			handler.ServeHTTP(rr, req)

			if status := rr.Code; status != http.StatusOK {
				t.Errorf("handler returned wrong status code: got %v want %v", status, http.StatusOK)
			}

			expectedResponse := `{"response":"Это тестовый ответ на ваш вопрос: ` + tc.question + `"}`
			if rr.Body.String() != expectedResponse {
				t.Errorf("handler returned unexpected body: got %v want %v", rr.Body.String(), expectedResponse)
			}
		})
	}
}
