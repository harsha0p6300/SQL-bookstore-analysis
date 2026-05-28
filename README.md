# Online Bookstore SQL Project
## Project Overview
This project is an end-to-end SQL data analysis project built using PostgreSQL.

The project analyzes an online bookstore database containing 500 Rows of information about books, customers, and orders.

The main objective of this project is to solve real-world business problems using SQL queries and extract meaningful insights from the data.

---

# Database Schema

The project consists of the following tables:

## 1. Books

Contains information about books available in the bookstore.

| Column Name    | Description                 |
| -------------- | --------------------------- |
| Book_ID        | Unique ID for each book     |
| Title          | Name of the book            |
| Author         | Author of the book          |
| Genre          | Category/genre of the book  |
| Published_Year | Year the book was published |
| Price          | Price of the book           |
| Stock          | Available stock quantity    |

---![image alt](https://github.com/harsha0p6300/SQL-bookstore-analysis/blob/main/Screenshot%20(89).png?raw=true)

## 2. Customers

Contains customer details.

| Column Name | Description        |
| ----------- | ------------------ |
| Customer_ID | Unique customer ID |
| Name        | Customer name      |
| City        | Customer city      |
| Country     | Customer country   |

---![image alt](https://github.com/harsha0p6300/SQL-bookstore-analysis/blob/main/Screenshot%20(90).png?raw=true)

## 3. Orders

Contains order transaction details.

| Column Name  | Description                   |
| ------------ | ----------------------------- |
| Order_ID     | Unique order ID               |
| Customer_ID  | Customer who placed the order |
| Book_ID      | Book purchased                |
| Quantity     | Number of books ordered       |
| Order_Date   | Date of order                 |
| Total_Amount | Total amount paid             |

---![image alt](https://github.com/harsha0p6300/SQL-bookstore-analysis/blob/main/Screenshot%20(91).png?raw=true)

# SQL Concepts Used

This project covers the following SQL concepts:

* SELECT Statements
* WHERE Clause
* ORDER BY
* GROUP BY
* HAVING
* Aggregate Functions
* INNER JOIN
* Subqueries
* LIMIT
* Data Filtering
* Business Data Analysis

---

# Business Problems Solved

The following business questions were solved in this project:

1. Retrieve all books in the Fiction genre
2. Find books published after 1950
3. List all customers from Canada
4. Show orders placed in November 2023
5. Retrieve total stock of books available
6. Find details of the most expensive book
7. Show customers who ordered more than one quantity
8. Retrieve orders where total amount exceeds $20
9. Retrieve total number of books sold for each genre
10. Find average price of books in the Fantasy genre
11. List customers who placed at least two orders
12. Find the most frequently ordered books
13. Show the top 3 most expensive Fantasy books
14. Retrieve total quantity of books sold by each author
15. List cities where customers spent over $30
16. Calculate remaining stock after fulfilling all orders

---

# Sample SQL Query

```sql
SELECT b.genre,
SUM(o.quantity) AS total_books_sold
FROM Orders o
JOIN Books b
ON o.book_id = b.book_id
GROUP BY b.genre;
```

---

# Key Insights

* Fiction and Fantasy genres showed high customer demand.
* Certain customers placed multiple orders, indicating repeat purchases.
* Popular books experienced significant stock reduction after sales.
* Sales analysis helped identify top-performing genres and authors.

---

# Project Structure

```text
Online-Bookstore-SQL-Project/
│
├── datasets/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_import_data.sql
│   └── 03_business_queries.sql
│
├── screenshots/
│
└── README.md
```

---

# Tools & Technologies

* PostgreSQL
* SQL
* CSV Datasets
* GitHub

---

# How to Run the Project

1. Create the database in PostgreSQL.
2. Run the table creation script.
3. Import CSV files into the tables.
4. Execute the SQL business queries.

---

# Future Improvements

* Add advanced SQL queries using Window Functions and CTEs
* Build an interactive dashboard using Power BI
* Add data visualizations and sales trend analysis
* Optimize complex queries

---

# Author

Harsha

---

# License

This project is licensed under the MIT License.
