CREATE OR ALTER VIEW gold.vw_booking_base AS
SELECT 
    b.booking_id,
    b.customer_id,
    c.customer_name,
    c.customer_type,
    c.country,
    c.gender,
    c.loyalty_tier,

    h.hotel_name,
    r.room_type,

    b.check_in_date,
    b.check_out_date,

    DATEDIFF(DAY, b.check_in_date, b.check_out_date) AS days_stayed,
    r.day_rate,

    fs.service_id,
    s.service_type,
    ISNULL(fs.units, 0) AS units,
    ISNULL(s.service_rate, 0) AS service_rate

FROM silver.fact_bookings b
LEFT JOIN silver.dim_customers c ON b.customer_id = c.customer_id
LEFT JOIN silver.dim_hotels h ON b.hotel_id = h.hotel_id
LEFT JOIN silver.dim_rooms r ON b.room_id = r.room_id
LEFT JOIN silver.fact_services fs ON b.booking_id = fs.booking_id
LEFT JOIN silver.dim_service s ON fs.service_id = s.service_id;