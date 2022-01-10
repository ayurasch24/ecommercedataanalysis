-- Cari tahu keuntungan total dan tingkat keuntungan item tergantung pada gender --

SELECT gender,
       SUM(items.price - items.cost) AS total_laba,
       1.0 * SUM(items.price - items.cost) / SUM(items.price) * 100 AS persentase_laba
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP by Gender;