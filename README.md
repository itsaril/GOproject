# SD_Name: Myrzakhankyzy Arailym
# SD_ID: 22B030408

# 📚 Library Management System

## Description

Library Management System is a web application that allows users to manage books, comments, users, and purchases. It provides a RESTful API for performing various operations such as adding, updating, and deleting books, adding comments, managing users, and handling purchases.

## 🚀 REST API Structure

- Get a list of all books: `GET /api/books`
- Add a new book: `POST /api/books`
- Get a book by ID: `GET /api/books/{id}`
- Update a book: `PUT /api/books/{id}`
- Delete a book: `DELETE /api/books/{id}`
- Get a list of comments for a book: `GET /api/books/{id}/comments`
- Add a new comment to a book: `POST /api/books/{id}/comments`
- Get a list of all users: `GET /api/users`
- Get a user by ID: `GET /api/users/{id}`
- Add a new user: `POST /api/users`
- User authentication: `POST /api/login`
- Get a list of all purchases: `GET /api/purchases`
- Get a purchase by ID: `GET /api/purchases/{id}`
- Create a new purchase: `POST /api/purchases`

## 🛠️ Database Structure

```sql
TABLE public.genres (
    id integer NOT NULL DEFAULT,
    genre character varying(255),
    CONSTRAINT genres_pkey PRIMARY KEY (id)
);

TABLE public.books (
    id integer NOT NULL DEFAULT,
    title character varying(512),
    release_date date,
    pages integer DEFAULT 0,
    rating REAL DEFAULT 0.0,
    price REAL DEFAULT 0.0,
    description text,
    image character varying(255),
    CONSTRAINT books_pkey PRIMARY KEY (id)
);

TABLE public.comments (
    id integer NOT NULL DEFAULT,
    book_id integer,
    user_id integer,
    comment text,
    created_at timestamp without time zone,
    CONSTRAINT comments_pkey PRIMARY KEY (id),
    CONSTRAINT comments_unique_key UNIQUE (book_id, user_id, comment, created_at),
    CONSTRAINT comments_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

TABLE public.purchase (
    id integer NOT NULL DEFAULT,
    user_id integer,
    book_id integer,
    address text,
    created_at timestamp without time zone,
    CONSTRAINT purchase_pkey PRIMARY KEY (id),
    CONSTRAINT purchase_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT purchase_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE
);

TABLE public.users (
    id integer NOT NULL DEFAULT,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    password character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

TABLE public.books_genres (
    id integer NOT NULL DEFAULT,
    book_id integer,
    genre_id integer,
    CONSTRAINT books_genres_pkey PRIMARY KEY (id),
    CONSTRAINT books_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT books_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE
);

```

# File and Directory Descriptions
- api/main.go: Main application file containing settings and starting the web server.
- controller/controller.go: File containing API request handlers.
- internal/graph/graph.go: GraphQL object definition for books.
- internal/models/*.go: Models for books, users, comments, and purchases.
- internal/repository/repository.go: Interface for the database repository.
- internal/repository/dbrepo/postgres_dbrepo.go: Implementation of the database repository for PostgreSQL.
- sql/create_tables.sql: SQL script for creating database tables.
- docker-compose.yml: Docker Compose file for deploying the application.
- dockerfile: Dockerfile for building the application image.
- go.mod and go.sum: Go module files.

# Running the Project
1. Make sure you have Docker and Docker Compose installed.
2. Clone the repository: git clone <repository_url>.
3. Navigate to the project directory: cd library.
4. Run the project: docker-compose up --build.

# Installation
1. Install Go and Docker.
2. Clone the repository: git clone <repository_url>.
3. Navigate to the project directory: cd library.
4. Run the project: docker-compose up --build.

# Dependencies
Go 1.16
Docker
PostgreSQL

# Author
https://github.com/itsaril
