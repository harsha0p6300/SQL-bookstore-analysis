--create the DataBase
CREATE DATABASE OnlineBookStore;

--create tables 
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
); 

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);


SELECT *FROM Books;
SELECT *FROM Customers;
SELECT *FROM orders;

--IMPORT DATA INTO BOOKS TABLE
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\CSV_FILES\books.csv'
CSV HEADER;

--IMPORT DATA INTO CUSTOMERS TABLE
COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:\CSV_FILES\Customers.csv'
CSV HEADER;

--IMPORT DATA INTO ORDERS TABLE
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'D:\CSV_FILES\Orders.csv'
CSV HEADER;


--1)Retrive all books in the 'Fiction' Genre:
SELECT *FROM Books
WHERE genre='Fiction';

--2)Find the books published after the year 1950:
SELECT *FROM Books
WHERE published_year>1950;

--3) List all customers from the canada:
SELECT *FROM Customers
WHERE country='Canada';

--4) Show orders placed in November 2023:
SELECT *FROM orders;
SELECT *FROM orders
WHERE order_date BETWEEN'2023-11-01' AND '2023-11-30';

--5)Retrive the total stock od Books available:
SELECT SUM(stock) AS total_stock
FROM Books;

--6) Find the details of the most expensive book:
SELECT *FROM Books 
ORDER BY price DESC
LIMIT 1;

--7) show all customers who ordered more than 1 quantity of a book:
SELECT *FROM Orders
WHERE quantity>1;

--8) Retrive all orders where the total amount exceeds $20:
SELECT *FROM Orders
WHERE total_amount>20;

--9) List all genres avalible in the Books table:
SELECT DISTINCT genre
FROM Books;

--10) Find the book with the lowest stock:
SELECT *FROM Books
ORDER BY stock ASC
LIMIT 5;

--11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS REVENUE 
FROM orders;

--ADVANCE
--1)Retrive the total number of books sold for each genre:
SELECT *FROM orders;

SELECT b.Genre,SUM(o.quantity) AS Total_books_sold
FROM orders o
JOIN Books b ON o.book_id=b.book_id
GROUP BY b.Genre;

SELECT *FROM Books
--2) FInd the average price of books in the 'Fantasy' genre:
SELECT AVG(price) AS avg_price
FROM Books
WHERE genre='Fantasy';

--3)List customers who have placed at least 2 orders:
SELECT *FROM orders;

SELECT o.customer_id,c.name,COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id,c.name
HAVING COUNT(order_id) >2;

--4)Find the most frequently ordered books:
SELECT o.Book_id, b.title,COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b  ON o.book_id=b.book_id
GROUP BY o.book_id,b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

--5) Show the Top 3 most expensive books of 'Fantasy' Genre:
SELECT *FROM Books
WHERE genre='Fantasy'
ORDER BY PRICE DESC
LIMIT 3;

--6) Retrive the total quantity of books sold by each author:
SELECT *FROM orders;
SELECT b.author,SUM(o.quantity) AS Total_solid
FROM orders o
JOIN Books b ON o.book_id=b.book_id
GROUP BY b.author;

--7)List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city,o.total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount>30;

--8)Find the customer who spent the most on  orders:
SELECT *FROM customers
SELECT c.customer_id,c.name,SUM(o.total_amount) AS Total_spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id,c.name 
ORDER BY Total_spent DESC
LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS order_quantity,
b.stock-COALESCE(SUM(o.quantity),0) AS remaining_quantity
FROM Books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;






