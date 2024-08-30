CREATE DATABASE library1;
USE library1;
CREATE TABLE Users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    role ENUM('borrower', 'librarian') NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    CHECK (phone_number REGEXP '^[0-9]{10,15}$'),
    CHECK (email LIKE '%_@__%.__%')
    );
CREATE TABLE Books(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    genre VARCHAR(50),
    available BOOLEAN DEFAULT TRUE,
    CHECK(isbn REGEXP '^[0-9]{10,13}$')
);

CREATE TABLE Borrowing(
	borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);



