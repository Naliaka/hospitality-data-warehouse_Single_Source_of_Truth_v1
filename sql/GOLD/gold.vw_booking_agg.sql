CREATE OR ALTER VIEW gold.vw_booking_agg AS
SELECT 
    booking_id,
    customer_id,
    customer_name,
    service_type,
    hotel_name,
    loyalty_tier,
    room_type,
    check_in_date,
    check_out_date,

    MAX(days_stayed) AS days_stayed,
    MAX(day_rate) AS day_rate,

    -- stay cost should NOT be summed (duplicate risk)
    MAX(stay_cost) AS total_stay_cost,

    -- service cost should be summed
    SUM(service_cost) AS total_service_cost,

    -- total
    MAX(stay_cost) + SUM(service_cost) AS total_before_discount,

    -- discount
    CASE 
        WHEN MAX(stay_cost) + SUM(service_cost) > 50000
        THEN (MAX(stay_cost) + SUM(service_cost)) * 0.2
        ELSE 0
    END AS discount,

    -- final
    CASE 
        WHEN MAX(stay_cost) + SUM(service_cost) > 50000
        THEN (MAX(stay_cost) + SUM(service_cost)) * 0.8
        ELSE (MAX(stay_cost) + SUM(service_cost))
    END AS final_total

FROM gold.vw_business_logic
GROUP BY 
    booking_id,
    customer_id,
    customer_name,
    hotel_name,
    room_type,
    service_type,
    loyalty_tier,
    check_in_date,
    check_out_date;