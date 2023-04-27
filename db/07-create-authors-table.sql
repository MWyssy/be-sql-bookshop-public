\c my_bookshop

CREATE TABLE authors (
    author_id SERIAL,
    author_name VARCHAR(40) PRIMARY KEY,
    fun_fact TEXT
);

\d authors;