-- Cari tahu 5 item yang memberikan
penghasilan laba teratas--

SELECT items.name,
       (items.price - items.cost) AS laba,
       1.0 * (items.price - items.cost) / (items.price) * 100 AS persentase_laba,
       COUNT(*) * (items.price - items.cost)  AS total_laba
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.name, laba, persentase_laba
ORDER BY COUNT(*) * laba DESC
LIMIT 5;