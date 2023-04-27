\c my_bookshop

\echo '\n Here are the genres for Emma:\n'
SELECT id, title, genre FROM book_genres
JOIN books ON books.book_id = book_genres.book_id
JOIN genres 
ON genres.genre_id = book_genres.genre_id
WHERE title = 'Emma';

\echo '\n Here are all the dystopian books:\n'
SELECT id, title, genre FROM book_genres
JOIN books ON books.book_id = book_genres.book_id
JOIN genres 
ON genres.genre_id = book_genres.genre_id
WHERE genre = 'dystopian';