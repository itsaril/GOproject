# SD_Name: Myrzakhankyzy Arailym
# SD_ID: 22B030408

# GoBot project

Welcome to GoBot - your ultimate chatbot for all things Golang!

## Description

GoBot is a simple chatbot built using Golang that answers questions related to the Golang programming language. It provides information, tips, and resources to help users learn and develop their skills in Golang.

# REST API structure for Gobot:

1. Endpoint to add a new Go-related question:
   - `POST /questions`: Adds a new question about the Go programming language.
   - `Request Body (JSON)`:
     ```json
     {
       "question": "Go question",
       "answer": "Answer to the Go question"
     }
     ```
   - `Response` : Returns the added question with a unique identifier.

2. Endpoint to get a list of all Go-related questions:
   - `GET /questions/: id`: Returns a list of all questions about the Go programming language.
   - `Response`: Returns an array of question objects.

3. Endpoint to get information about a specific question by its ID:
   - `GET /questions/:id` : Returns information about a specific question by its unique identifier.
   - `Path Parameters:id`: - unique question identifier.
   - `Response`: Returns information about the requested question.

4. Endpoint to update information about a question by its ID:
   - `PUT /questions/:id` : Updates information about a question by its unique identifier.
   - `Path Parameters: :id` - unique question identifier.
   - `Request Body (JSON)`: Updated question data.
   - `Response`: Returns the updated question.

5. Endpoint to delete a question by its ID:
   -` DELETE /questions/:id` : Deletes a question from the database by its unique identifier.
   - `Path Parameters:id`: - unique question identifier.
   - `Response`: Empty response with status code 204 (No Content) upon successful deletion.

   

# DB STRUCTURE 
```
TABLE questions (
    id SERIAL PRIMARY KEY,
    question_text TEXT ,
    answer_text TEXT 
);

TABLEresponses (
    id SERIAL PRIMARY KEY,
    question_id INT,
    response TEXT ,
    created_at TIMESTAMP ,
);
```

# Installation
Make sure you have the Go programming language installed on your computer. If not, you can download it from the official Go website.

# Clone the Gobot repository from GitHub:

```bash
git clone https://github.com/your-username/gobot.git
```

# Navigate to the project directory:

```bash
cd gobot
```

# Install project dependencies:

```bash
go mod tidy
```

# Usage
# Run the project:

```bash
go run main.go
```

Connect to the chatbot via the command-line interface.

Ask questions about the Go programming language, and the chatbot will respond to them.

```bash
git clone https://github.com/itsaril/gobot.git
