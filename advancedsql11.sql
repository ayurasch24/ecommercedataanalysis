-- Find out how many and what percentage of users spent more than the average --

SELECT COUNT(user_id) AS jumlah_pengguna,
       1.0 * 100 * COUNT(user_id) / (
SELECT COUNT(distinct sales_records.user_id)
FROM sales_records
) AS rate
FROM (
SELECT user_id,
       SUM(price) AS total_pengeluaran
FROM sales_records
JOIN items ON sales_records.item_id = items.id
GROUP BY user_id
HAVING total_pengeluaran >= (
  SELECT 1.0 * SUM(items.price)/COUNT(distinct sales_records.user_id) AS rata_pengeluaran
  FROM items
  JOIN sales_records ON items.id = item_id
)
);