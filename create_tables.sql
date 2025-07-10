-- Création des tables

CREATE TABLE theme (
    theme_id INT PRIMARY KEY,
    theme_name VARCHAR(100) NOT NULL
);

CREATE TABLE author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year YEAR
);

CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_date DATE NOT NULL,
    theme INT UNIQUE NOT NULL,
    stock INT NOT NULL,
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    join_date DATE
);

CREATE TABLE customer_order (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

CREATE TABLE review (
    review_id INT PRIMARY KEY,
    customer INT NOT NULL,
    book INT NOT NULL,
    note INT,
    notice VARCHAR (255),
    notice_date DATE,
);
