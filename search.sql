USE library1;
SELECT 
	book_id,
    title,
    author,
    isbn,
    genre,
    available
FROM
	Books
WHERE
	title LIKE '%search_keyword%'
    OR author LIKE '%search_keyword%';