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

SELECT books.title, ARRAY_AGG(reviews.review) AS average_review
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

