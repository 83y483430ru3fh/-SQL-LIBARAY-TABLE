# 📚 Library Management Database (MySQL)

A relational database schema for managing a library's books, authors, categories, members, and loans.  
This project is designed for MySQL and includes constraints, relationships, and example queries for availability tracking.

## Features
- **Authors**: Store author details.
- **Categories**: Classify books by genre/category.
- **Books**: Track title, author, category, copies, and publication details.
- **Members**: Register and manage library members.
- **Loans**: Record book loans with due dates, returns, and status.
- **Data Integrity**: Foreign keys, unique constraints, and checks for consistency.
- **Availability Queries**: Easily find how many copies are available.

## Schema Overview
![ER Diagram](docs/library_schema.png) <!-- Optional if you make an ERD -->

**Tables:**
1. **Author** – One author can write many books.
2. **Category** – Each book belongs to one category.
3. **Book** – Information about each book (copies, year, ISBN).
4. **Member** – Library members' personal details.
5. **Loan** – Records which member borrowed which book and when.
