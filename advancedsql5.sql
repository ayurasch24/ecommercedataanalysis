-- Sekarang tim Anda sudah tau item-item
mana saja yang paling berpengaruh. Agar
dapat mengalokasikan biaya marketing
secara efektif, Cari tahu 5 item penghasil
pendapatan terburuk --

SELECT items.name,
       COUNT(*) AS jumlah_penjualan,
       items.price,
        COUNT(*) *  items.price  AS total_pendapatan
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.name, items.price
ORDER BY COUNT(*) * items.price ASC
LIMIT 5;