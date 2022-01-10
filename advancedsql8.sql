-- Dalam latihan ini, kita akan mengetahui berapa banyak pengguna aktif yang ada di situs belanja
tersebut.--

SELECT COUNT(distinct sales_records.user_id) AS pengguna_aktif,
       1.0 * 100 * COUNT(distinct sales_records.user_id) /(
       SELECT COUNT(*)
       FROM users
       ) AS persentase_aktif
FROM sales_records;