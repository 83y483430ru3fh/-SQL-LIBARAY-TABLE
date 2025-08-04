Create database Library ;
CREATE DATABASE IF NOT EXISTS Library;
 -- USE Library ;
-- 2. Authors (one author can write many books)
CREATE TABLE Author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NULL
);

-- 3. Categories/Genres (a book can belong to one category here for simplicity)
CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- 4. Books
CREATE TABLE Book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NULL,
    isbn VARCHAR(20) UNIQUE,
    published_year YEAR,
    copies_total INT DEFAULT 1 CHECK (copies_total >= 0),
    FOREIGN KEY (author_id) REFERENCES Author(author_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- 5. Members (people who borrow books)
CREATE TABLE Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    join_date DATE DEFAULT (CURRENT_DATE)
);

-- 6. Loans (which member has borrowed which book)
-- A book can be loaned multiple times over time; a member can have multiple loans.
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    due_date DATE NOT NULL,
    return_date DATE NULL,
    CONSTRAINT uq_active_loan UNIQUE (book_id, member_id, loan_date),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);
