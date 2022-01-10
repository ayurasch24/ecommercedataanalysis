-- Find out the items which have higher prices than the average spending per purchase --

SELECT name, price
FROM items
WHERE price >= (
  SELECT 1.0 * rata_pengeluaran / rata_jumlah_penjualan AS rata_pengeluaran_per_belanjaan
FROM (
     SELECT 1.0 * COUNT(*) / COUNT(distinct sales_records.user_id) AS rata_jumlah_penjualan,
     1.0 * SUM(items.price)/COUNT(distinct sales_records.user_id) AS rata_pengeluaran
FROM items
JOIN sales_records ON items.id = sales_records.item_id
)
)
ORDER BY price DESC;