USE library1;
SELECT
	Borrowing.borrow_id,
    Users.name AS borrower_name,
    Books.title AS book_title,
    Borrowing.borrow_date,
    Borrowing.due_date
FROM
	Borrowing
INNER JOIN
	Users ON Borrowing.user_id = Users.user_id
INNER JOIN
	Books ON Borrowing.book_id = Books.book_id
WHERE
	Borrowing.due_date < CURDATE()
    AND Borrowing.return_date IS NULL;