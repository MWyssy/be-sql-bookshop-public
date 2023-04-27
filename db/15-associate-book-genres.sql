\c my_bookshop
INSERT INTO book_genres
    (book_id, genre_id)
VALUES
    (1, 1),
    (1, 7),
    (2, 2),
    (3, 2),
    (3, 8),
    (3, 4),
    (4, 3),
    (4, 8),
    (5, 1),
    (5, 5),
    (6, 5),
    (7, 1),
    (7, 8),
    (10, 3),
    (10, 8);

SELECT * FROM book_genres;