--SQL Query to obtain third transaction of every user--
--Output the user id, spend, and transaction date.

CREATE TABLE transactions (
    user_id INTEGER,
    spend DECIMAL(10, 2),
    transaction_date TIMESTAMP
);

INSERT INTO transactions (user_id, spend, transaction_date) VALUES
(111, 100.50, '2022-01-08 12:00:00'),
(111, 55.00, '2022-01-10 12:00:00'),
(121, 36.00, '2022-01-18 12:00:00'),
(145, 24.99, '2022-01-26 12:00:00'),
(111, 89.60, '2022-02-05 12:00:00');

SELECT * FROM transactions

--ONE APPROACH--

SELECT USER_ID,SPEND,TRANSACTION_DATE
FROM TRANSACTIONS
GROUP BY USER_ID,SPEND,TRANSACTION_DATE
ORDER BY USER_ID,TRANSACTION_DATE DESC
LIMIT 1

--SECOND APPROACH--

WITH CTE AS
(
SELECT *,
ROW_NUMBER()OVER(PARTITION BY USER_ID ORDER BY TRANSACTION_DATE)AS RN
FROM TRANSACTIONS
)SELECT USER_ID,SPEND,TRANSACTION_DATE
FROM CTE
WHERE RN=3



--SECOND APPROACH IS MOST SUITABLE--