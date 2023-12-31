\c my_bookshop

-- Deleting a book:
-- Modify the books_genres table in section 14 first

-- Delete a book here:
\echo '\n Here is the book and book-generes table BEFORE deletion:\n'

SELECT title, genre, book_genres.* FROM book_genres
JOIN books ON books.book_id = book_genres.book_id
JOIN genres 
ON genres.genre_id = book_genres.genre_id
WHERE title = 'Pride and Prejudice';

SELECT * FROM book_genres;

DELETE FROM books WHERE title = 'Pride and Prejudice';

\echo '\n Here is the book and book-generes table AFTER deletion:\n'

SELECT id, title, genre FROM book_genres
JOIN books ON books.book_id = book_genres.book_id
JOIN genres 
ON genres.genre_id = book_genres.genre_id
WHERE title = 'Pride and Prejudice';

SELECT * FROM book_genres;

-- Deleting an author:
-- Modify the books table in section 09 first

-- Modify the books_genres table in section 14 first

-- Delete an author here:
\echo '\n Here is the author and book-generes table BEFORE deletion:\n'

SELECT author, title, book_genres.* FROM books
JOIN authors ON authors.author_name = books.author
JOIN book_genres ON book_genres.book_id = books.book_id
WHERE author = 'Jane Austen';

SELECT * FROM book_genres;

DELETE FROM authors WHERE author_name = 'Jane Austen';

\echo '\n Here is the book and book-generes table AFTER deletion:\n'

SELECT author, title, book_genres.* FROM books
JOIN authors ON authors.author_name = books.author
JOIN book_genres ON book_genres.book_id = books.book_id
WHERE author = 'Jane Austen';

SELECT * FROM book_genres;