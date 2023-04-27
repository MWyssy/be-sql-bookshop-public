\c my_bookshop

UPDATE books
SET author = 'Douglas Adams' WHERE title = 'The Hitchhiker''s Guide to the Galaxy';
UPDATE books
SET author = 'Antoine de Saint-Exupéry' WHERE title = 'The Little Prince';
UPDATE books
SET author = 'Beatrix Potter' WHERE title = 'The Tale of Peter Rabbit';
UPDATE books
SET author = 'Jane Austen' WHERE title = 'Emma' OR title = 'Pride and Prejudice';
UPDATE books
SET author = 'George Orwell' WHERE title = 'Nineteen Eighty-Four: A Novel';
UPDATE books
SET author = 'Margaret Atwood' WHERE title = 'The Handmaid''s Tale';
UPDATE books
SET author = 'H. G. Wells' WHERE title = 'The War of the Worlds';

SELECT title, author FROM books;