-- Cari tahu persentase laba dan laba dari 5
item penghasil pendapatan teratas--

SELECT items.name,
       (items.price - items.cost) AS laba,
       1.0 * (items.price - items.cost) / (items.price) * 100 AS persentase_laba,
       COUNT(*) * (items.price - items.cost)  AS total_profit
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
WHERE items.id = 23 OR items.id = 30 OR items.id = 3 OR items.id = 17 OR items.id = 1
GROUP BY items.name, laba, persentase_laba
ORDER BY COUNT(*) * items.price DESC;