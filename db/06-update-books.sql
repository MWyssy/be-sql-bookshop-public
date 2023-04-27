\c my_bookshop

SELECT title, price_in_pence FROM books;

\echo '\n These books have been put on sale, due to excess stock:\n'
UPDATE books
SET 
    price_in_pence = price_in_pence * 0.90
WHERE quantity_in_stock > 10;

SELECT title, price_in_pence FROM books;