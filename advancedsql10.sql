-- Get the list of users who purchased more often than the average--

SELECT users.name, COUNT(*) AS number_of_purchases
FROM sales_records
JOIN users ON sales_records.user_id = users.id
GROUP BY users.name
HAVING number_of_purchases >= (
  SELECT 1.0 * COUNT(*)/COUNT(distinct sales_records.user_id) AS average_number_of_purchases
  FROM sales_records
)
ORDER BY number_of_purchases desc;