-- Dapatkan total pendapatan, laba dan persentase laba
untuk seluruh website pembelanjaan.--

SELECT SUM(items.price) AS total_pendapatan,
       SUM(items.price - items.cost) AS total_laba,
1.0 * SUM(items.price - items.cost) / SUM(items.price) * 100 AS presentase_laba
FROM sales_records
JOIN items ON sales_records.item_id = items.id;