CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    customer_id INT,
    product_category VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name) VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie'),
    (4, 'David'),
    (5, 'Emma');
	
INSERT INTO Purchases (purchase_id, customer_id, product_category) VALUES
    (101, 1, 'Electronics'),
    (102, 1, 'Books'),
    (103, 1, 'Clothing'),
    (104, 1, 'Electronics'),
    (105, 2, 'Clothing'),
    (106, 1, 'Beauty'),
    (107, 3, 'Electronics'),
    (108, 3, 'Books'),
    (109, 4, 'Books'),
    (110, 4, 'Clothing'),
    (111, 4, 'Beauty'),
    (112, 5, 'Electronics'),
    (113, 5, 'Books');




SELECT * FROM CUSTOMERS
SELECT * FROM PURCHASES



-- SQL QUERY to find customers who have made purchases in all product categories
--output
--customer_id
--customer_name


SELECT c.customer_id,c.customer_name,
COUNT(DISTINCT(p.product_category))
FROM CUSTOMERS c 
JOIN PURCHASES p
on c.customer_id=p.customer_id
GROUP BY c.customer_id,c.customer_name
HAVING  COUNT(DISTINCT p.product_category) = 
(SELECT (COUNT(DISTINCT(product_category)))FROM PURCHASES)


--Write an SQL query to identify customers who have not made any purchases 
--in Electronics categories....

SELECT c.customer_id,c.customer_name
FROM customers c
LEFT JOIN purchases p
on c.customer_id=p.customer_id
AND p.product_category='Electronics'
WHERE p.purchase_id is NULL


-- IMPORTANCE OF LEFT JOIN 