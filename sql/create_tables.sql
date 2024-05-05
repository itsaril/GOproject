SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

-- Создание последовательностей
CREATE SEQUENCE IF NOT EXISTS public.genres_id_seq START WITH 15;
CREATE SEQUENCE IF NOT EXISTS public.books_id_seq START WITH 4;
CREATE SEQUENCE IF NOT EXISTS public.comments_id_seq START WITH 3;
CREATE SEQUENCE IF NOT EXISTS public.purchase_id_seq START WITH 3;
CREATE SEQUENCE IF NOT EXISTS public.books_genres_id_seq START WITH 12;
CREATE SEQUENCE IF NOT EXISTS public.users_id_seq START WITH 4;


-- Создание таблицы жанров, если она не существует
CREATE TABLE IF NOT EXISTS public.genres (
    id integer NOT NULL DEFAULT nextval('public.genres_id_seq'::regclass),
    genre character varying(255),
    CONSTRAINT genres_pkey PRIMARY KEY (id)
);

-- Вставка данных в таблицу жанров
INSERT INTO public.genres (genre) VALUES
('Comedy'),
('Sci-Fi'),
('Horror'),
('Romance'),
('Action'),
('Thriller'),
('Drama'),
('Mystery'),
('Crime'),
('Animation'),
('Adventure'),
('Fantasy'),
('Superhero'),
('War');

-- Создание таблицы книг, если она не существует
CREATE TABLE IF NOT EXISTS public.books (
    id integer NOT NULL DEFAULT nextval('public.books_id_seq'::regclass),
    title character varying(512),
    release_date date,
    pages integer DEFAULT 0,
    rating REAL DEFAULT 0.0,
    price REAL DEFAULT 0.0,
    description text,
    image character varying(255),
    CONSTRAINT books_pkey PRIMARY KEY (id)
);

-- Вставка данных в таблицу книг
INSERT INTO public.books (id, title, release_date, pages, rating, price, description, image)
OVERRIDING SYSTEM VALUE VALUES
(1, 'Demon Slayer', '2016-02-1', 192, 9.8, 40, 'Tanjiro Kamado, joined with Inosuke Hashibira, a boy raised by boars who wears a boar''s head, and Zenitsu Agatsuma, a scared boy who reveals his true power when he sleeps, boards the Infinity Train on a new mission with the Fire Hashira, Kyojuro Rengoku, to defeat a demon who has been tormenting the people and killing the demon slayers who oppose it!', '/jq4TVchWAWac6zGmCuriFhfBSzo.jpg'),
(2, 'Interstellar', '2014-11-7', 336, 9, 30, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanitys survival. Earths future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind is survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.', '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg'),
(3, 'All Quiet on the Western Front', '1928-11-10', 304, 9, 30.5, 'Set during World War I, it follows the life of an idealistic young German soldier named Paul Bäumer. After enlisting in the German Army with his friends, Bäumer finds himself exposed to the realities of war, shattering his early hopes of becoming a hero as he does his best to survive.', '/2IRjbi9cADuDMKmHdLK7LaqQDKA.jpg');


-- Создание таблицы комментариев, если она не существует
CREATE TABLE IF NOT EXISTS public.comments (
    id integer NOT NULL DEFAULT nextval('public.comments_id_seq'::regclass),
    book_id integer,
    user_id integer,
    comment text,
    created_at timestamp without time zone,
    CONSTRAINT comments_pkey PRIMARY KEY (id),
    CONSTRAINT comments_unique_key UNIQUE (book_id, user_id, comment, created_at),
    CONSTRAINT comments_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Вставка данных в таблицу комментариев
INSERT INTO public.comments (id, book_id, user_id, comment, created_at) VALUES
(1, 1, 1, 'This is amazing Manga!', '2022-04-15 09:30:00'),
(2, 2, 2, 'I didnt even expect that kind of ending', '2022-04-16 14:45:00');


-- Создание таблицы покупок, если она не существует
CREATE TABLE IF NOT EXISTS public.purchase (
    id integer NOT NULL DEFAULT nextval('public.purchase_id_seq'::regclass),
    user_id integer,
    book_id integer,
    address text,
    created_at timestamp without time zone,
    CONSTRAINT purchase_pkey PRIMARY KEY (id),
    CONSTRAINT purchase_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT purchase_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Вставка данных в таблицу покупок
INSERT INTO public.purchase (id, user_id, book_id, address, created_at) VALUES
(1, 2, 3, 'KBTU Abylay hana 444', '2023-04-15 09:30:00'),
(2, 3, 2, 'Almaty 5 mkr', '2023-04-15 19:30:00');


-- Создание таблицы пользователей, если она не существует
CREATE TABLE IF NOT EXISTS public.users (
    id integer NOT NULL DEFAULT nextval('public.users_id_seq'::regclass),
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    password character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

-- Вставка данных в таблицу пользователей
INSERT INTO public.users (id, first_name, last_name, email, password, created_at, updated_at) VALUES
(1, 'Admin', 'User', 'admin@gmail.com', '$2a$14$wVsaPvJnJJsomWArouWCtusem6S/.Gauq/GjOIEHpyh2DAMmso1wy', '2023-03-30 00:00:00', '2023-03-30 00:00:00'),
(2, 'Consumer', 'User', 'consumer@gmail.com', '$2a$14$wVsaPvJnJJsomWArouWCtusem6S/.Gauq/GjOIEHpyh2DAMmso1wy', '2023-03-30 00:00:00', '2023-03-30 00:00:00'),
(3, 'Consumer2', 'User', 'consumer2@gmail.com', '$2a$14$wVsaPvJnJJsomWArouWCtusem6S/.Gauq/GjOIEHpyh2DAMmso1wy', '2023-03-30 00:00:00', '2023-03-30 00:00:00');


-- Создание таблицы жанров книг, если она не существует
CREATE TABLE IF NOT EXISTS public.books_genres (
    id integer NOT NULL DEFAULT nextval('public.books_genres_id_seq'::regclass),
    book_id integer,
    genre_id integer,
    CONSTRAINT books_genres_pkey PRIMARY KEY (id),
    CONSTRAINT books_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT books_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Вставка данных в таблицу жанров книг
INSERT INTO public.books_genres (id, book_id, genre_id) VALUES
(1, 1, 5),
(2, 1, 6),
(3, 1, 10),
(4, 1, 11),
(5, 1, 12),
(6, 2, 2),
(7, 2, 11),
(8, 2, 7),
(9, 3, 5),
(10, 3, 7),
(11, 3, 14);

SELECT * FROM public.genres;
SELECT * FROM public.books;
SELECT * FROM public.comments;
SELECT * FROM public.purchase;
SELECT * FROM public.users;
SELECT * FROM public.books_genres;

-- Установка счетчиков для последовательностей
SELECT setval('public.genres_id_seq', 15, true);
SELECT setval('public.books_id_seq', 4, true);
SELECT setval('public.comments_id_seq', 3, true);
SELECT setval('public.purchase_id_seq', 3, true);
SELECT setval('public.books_genres_id_seq', 12, true);
SELECT setval('public.users_id_seq', 4, true);
SELECT * FROM information_schema.sequences WHERE sequence_name = 'genres_id_seq';

