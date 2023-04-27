\c my_bookshop

ALTER TABLE books
ADD author VARCHAR(40) REFERENCES authors(author_name) ON DELETE CASCADE;

\d books;