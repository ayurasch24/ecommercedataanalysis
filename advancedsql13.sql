-- Retrieve purchases data based the gender 
of users --

SELECT users.gender,
       COUNT(distinct sales_records.user_id) AS jumlah_pengguna,
       SUM(items.price) AS total_pengeluaran,
       COUNT(*) AS jumlah_pembelian,
       1.0 * SUM(items.price) /  COUNT(distinct sales_records.user_id) AS rata_pembelian_per_pengguna,
       1.0 * SUM(items.price) /  COUNT(*) AS rata_pembelian
FROM items
JOIN sales_records ON sales_records.item_id = items.id
JOIN users ON users.id = sales_records.user_id
GROUP BY users.gender