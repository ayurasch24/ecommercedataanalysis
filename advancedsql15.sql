-- Let’s get the total spending 
and percentages of each age like the following 
image--

SELECT (users.age / 10) * 10 AS usia,
       SUM(items.price) as total_pengeluaran,
       1.0 * 100 * SUM(items.price) / (
         SELECT SUM(items.price)
         FROM items
         JOIN sales_records ON items.id = sales_records.item_id
       ) AS rate
FROM users
JOIN sales_records ON users.id = sales_records.user_id
JOIN items ON items.id = sales_records.item_id
GROUP BY (age / 10) * 10;