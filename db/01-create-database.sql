-- create your database here

DROP DATABASE IF EXISTS my_bookshop;
CREATE DATABASE my_bookshop;

\c my_bookshop;

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    price_in_pence INT,
    quantity_in_stock INT,
    release_date DATE,
    is_fiction BOOLEAN
);

INSERT INTO books
(title, price_in_pence, quantity_in_stock, release_date, is_fiction)
VALUES
('The Hitchhiker''s Guide to the Galaxy', 899, 560, '1997-10-12', true),
('The Little Prince', 699, 1020, '1943-04-06', true),
('The Tale of Peter Rabbit', 599, 1000,	'1902-10-01', true),
('Emma', 522, 390, '1815-12-23', true),
('Nineteen Eighty-Four: A Novel', 799, 420, '1949-06-08', true),
('The Handmaid''s Tale',	899, 10, '1985-08-01', true),
('The War of the Worlds', 250, 17, '1897-04-01', true),
('Captain Corelli''s Mandolin', 999, 0, '1995-08-29', true),
('A Brief History of Time',	825, 0,	'1988-04-01',	false),
('Pride and Prejudice',	699, 4,	'1813-01-28',	true);

SELECT * FROM books;
SELECT * FROM books WHERE quantity_in_stock > 0;
SELECT * FROM books WHERE is_fiction = false;
SELECT * FROM books WHERE release_date BETWEEN '1899-12-31' AND '2000-01-01';
SELECT * FROM books WHERE title LIKE '%the%' OR title LIKE '%The%';
SELECT * FROM books ORDER BY title ASC;
SELECT * FROM books ORDER BY price_in_pence DESC LIMIT 1;

DELETE FROM books WHERE quantity_in_stock = 0;

SELECT * FROM books ORDER BY title ASC;

UPDATE books
SET 
    price_in_pence = price_in_pence * 0.90
WHERE quantity_in_stock > 10;

SELECT title, price_in_pence, quantity_in_stock FROM books ORDER BY title ASC;