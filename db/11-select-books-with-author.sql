\c my_bookshop

\echo '\n Here is a list of book titles with the corresponding author:\n'
SELECT book_id, title, author_name, author_id, fun_fact FROM books
JOIN authors
ON books.author = authors.author_name;


\echo '\n Here is a list of authors without an associated book:\n'
SELECT author_id, author_name FROM authors
FULL OUTER JOIN books
ON authors.author_name = books.author
WHERE books.author IS NULL
