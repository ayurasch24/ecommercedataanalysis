-- informasi tentang pembelian
pengguna aktif--

SELECT rata_jumlah_penjualan,
       rata_pengeluaran,
       1.0 *  rata_pengeluaran / rata_jumlah_penjualan AS rata_pengeluaran_per_belanjaan
FROM (
     SELECT 1.0 * COUNT(*) / COUNT(distinct sales_records.user_id) AS rata_jumlah_penjualan,
     1.0 * SUM(items.price)/COUNT(distinct sales_records.user_id) AS rata_pengeluaran
FROM sales_records
JOIN items ON sales_records.item_id = items.id
);