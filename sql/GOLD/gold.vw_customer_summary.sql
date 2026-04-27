CREATE OR ALTER VIEW gold.vw_customer_summary AS 
SELECT      customer_id,
			customer_name,
			SUM(total_stay_cost) AS total_stay_cost, 
			SUM(total_service_cost) AS total_service_cost,
			SUM(discount) AS total_discount,
			SUM(final_total) AS total_revenue
FROM gold.vw_booking_agg
GROUP BY customer_id, 
	     customer_name