\c my_bookshop

\echo '\n Here is the total number of books we have by each author:\n'
SELECT books.author, SUM(quantity_in_stock) AS total_books_by_author
FROM book_genres
JOIN books ON books.book_id = book_genres.book_id
JOIN genres 
ON genres.genre_id = book_genres.genre_id
GROUP BY author;

\echo '\n Here is the average price for dystopian books:\n'

SELECT genres.genre, AVG(price_in_pence) AS average_price_per_genre
FROM book_genres
JOIN books ON books.book_id = book_genres.book_id
JOIN genres ON genres.genre_id = book_genres.genre_id
WHERE genre = 'dystopian'
GROUP BY genre;