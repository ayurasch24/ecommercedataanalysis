--  Dalam latihan ini, kita akan mendapatkan 5 item teratas yang
berkontribusi pada pendapatan--

SELECT items.name,
       COUNT(*) AS jumlah_penjualan,
       items.price,
       COUNT(*) *  items.price  AS total_pendapatan
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.name, items.price
ORDER BY COUNT(*) * items.price DESC
LIMIT 5;