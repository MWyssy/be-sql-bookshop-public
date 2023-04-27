\c my_bookshop

-- Use the ARRAY_AGG() function to get a list of each book in a single row, with all genres that the book belongs to.

\echo '\n Here is each book with a list of all it''s genres:\n'

SELECT books.title, ARRAY_AGG(genre) AS array_of_books 
FROM book_genres
JOIN books ON books.book_id = book_genres.book_id
JOIN genres 
ON genres.genre_id = book_genres.genre_id
GROUP BY books.book_id;


CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INTEGER REFERENCES books(book_id) ON DELETE CASCADE,
    review FLOAT
);

\d reviews;

INSERT INTO reviews 
    (book_id, review)
VALUES
    (1, 10),
    (1, 7),
    (1, 8),
    (1, 9),
    (2, 4),
    (2, 5),
    (2, 8),
    (3, 6),
    (3, 8),
    (3, 9),
    (5, 4),
    (5, 3),
    (5, 2),
    (6, 10),
    (6, 9),
    (6, 10),
    (6, 7),
    (7, 8),
    (7, 8),
    (7, 8);

\echo '\n\n\n Here is all the reviews for The Hitchhiker''s Guide to the Galaxy:\n'

SELECT books.title, ARRAY_AGG(reviews.review) AS all_reviews
FROM reviews
JOIN books ON books.book_id = reviews.book_id
WHERE title = 'The Hitchhiker''s Guide to the Galaxy'
GROUP BY title;

\echo '\n\n\n Here is the review for The Hitchhiker''s Guide to the Galaxy:\n'

SELECT books.title, AVG(reviews.review) AS average_review
FROM reviews
JOIN books ON books.book_id = reviews.book_id
WHERE title = 'The Hitchhiker''s Guide to the Galaxy'
GROUP BY title;

\echo '\n\n\n Here are the most favourable, and the least favourable reviews for The Hitchhiker''s Guide to the Galaxy:\n'

SELECT
    low.title,
    low.review lowest_review,
    high.review highest_review
FROM (
    SELECT title, review
    FROM reviews
    JOIN books ON books.book_id = reviews.book_id
    WHERE title = 'The Hitchhiker''s Guide to the Galaxy'
    ORDER BY review ASC LIMIT 1) low
JOIN (
    SELECT title, review
    FROM reviews
    JOIN books ON books.book_id = reviews.book_id
    WHERE title = 'The Hitchhiker''s Guide to the Galaxy'
    ORDER BY review DESC LIMIT 1) high
ON low.title = high.title
ORDER BY 1;

\echo '\n\n\n Here is a list of all the books with an average rating over 8:\n'

SELECT title, average_review
FROM (
    SELECT books.title, AVG(reviews.review) AS average_review
    FROM reviews
    JOIN books ON books.book_id = reviews.book_id
    GROUP BY title) average_review
WHERE average_review >= 8;

\echo '\n\n'

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(40)
);

INSERT INTO users
    (user_name)
VALUES
    ('Mike'),
    ('Eliza'),
    ('Frank'),
    ('Rosy'),
    ('Ruth');

ALTER TABLE reviews
ADD user_id INTEGER REFERENCES users(user_id);

UPDATE reviews
SET user_id = 1
WHERE review_id = 1;
UPDATE reviews
SET user_id = 2
WHERE review_id = 2;
UPDATE reviews
SET user_id = 5
WHERE review_id = 3;
UPDATE reviews
SET user_id = 4
WHERE review_id = 4;
UPDATE reviews
SET user_id = 4
WHERE review_id = 5;
UPDATE reviews
SET user_id = 3
WHERE review_id = 6;
UPDATE reviews
SET user_id = 1
WHERE review_id = 7;
UPDATE reviews
SET user_id = 2
WHERE review_id = 8;
UPDATE reviews
SET user_id = 1
WHERE review_id = 9;
UPDATE reviews
SET user_id = 5
WHERE review_id = 10;
UPDATE reviews
SET user_id = 3
WHERE review_id = 11;
UPDATE reviews
SET user_id = 4
WHERE review_id = 12;
UPDATE reviews
SET user_id = 2
WHERE review_id = 13;
UPDATE reviews
SET user_id = 1
WHERE review_id = 14;
UPDATE reviews
SET user_id = 5
WHERE review_id = 15;
UPDATE reviews
SET user_id = 2
WHERE review_id = 16;
UPDATE reviews
SET user_id = 3
WHERE review_id = 17;
UPDATE reviews
SET user_id = 5
WHERE review_id = 18;
UPDATE reviews
SET user_id = 1
WHERE review_id = 19;
UPDATE reviews
SET user_id = 2
WHERE review_id = 20;

\echo '\n\n These are all of the reviews from Mike:\n'

SELECT user_name, title, review 
FROM reviews
JOIN users ON users.user_id = reviews.user_id
JOIN books ON books.book_id = reviews.book_id
WHERE user_name = 'Mike';

\echo '\n\n This is the average review score from Mike:\n'

SELECT users.user_name, AVG(reviews.review) AS average_review
FROM reviews
JOIN users ON users.user_id = reviews.user_id
WHERE user_name = 'Mike'
GROUP BY user_name;

\echo '\n\n Here are the books that Rosy has not yet reviewed:\n'

SELECT title 
FROM books
WHERE books.book_id NOT IN (
    SELECT reviews.book_id
    FROM reviews
    JOIN users ON users.user_id = reviews.user_id
    WHERE user_name = 'Rosy'
);


