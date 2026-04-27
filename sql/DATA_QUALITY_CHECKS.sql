
-- =========================
-- CHECK NULL KEYS
-- ========================

SELECT * 
FROM bronze.bookings_raw
WHERE customer_id IS NULL
   OR hotel_id IS NULL;


-- =========================
-- CHECK DUPLICATES
-- ========================

SELECT booking_id, COUNT(*)
FROM bronze.bookings_raw
GROUP BY booking_id
HAVING COUNT(*) > 1;