CREATE OR ALTER VIEW gold.vw_business_logic AS
SELECT 
    *,

    -- stay cost (same for each row of same booking)
    days_stayed * day_rate AS stay_cost,

    -- service cost (varies per service row)
    units * service_rate AS service_cost

FROM gold.vw_booking_base;