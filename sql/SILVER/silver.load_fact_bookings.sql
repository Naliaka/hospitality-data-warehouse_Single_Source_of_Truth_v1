
CREATE OR ALTER PROCEDURE silver.load_fact_bookings
AS
BEGIN
    DECLARE 
        @start_time DATETIME, 
        @end_time DATETIME, 
        @batch_start_time DATETIME, 
        @batch_end_time DATETIME; 

    BEGIN TRY
        SET @batch_start_time = GETDATE();

        PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: silver.fact_bookings';
        TRUNCATE TABLE silver.fact_bookings;

        PRINT '>> Inserting Data Into: silver.fact_bookings';

        INSERT INTO silver.fact_bookings(
        booking_id,
        customer_id,
        hotel_id,
        room_id,
        booking_date_id, 
        check_in_date,
        check_out_date,
        channel,
        create_date
    )
    SELECT DISTINCT
        booking_id,
        customer_id,
        hotel_id,
        room_id,
        booking_date_id, 
        check_in_date,
        check_out_date,
        channel,
        create_date
        FROM bronze.bookings_raw;
        SET @end_time = GETDATE();

        PRINT '>> Load Duration: ' 
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) 
            + ' seconds';

        PRINT '>> -------------';

        SET @batch_end_time = GETDATE();

        PRINT 'Total Batch Duration: ' 
            + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) 
            + ' seconds';

    END TRY

    BEGIN CATCH
        PRINT '❌ ERROR OCCURRED';

        PRINT ERROR_MESSAGE();
    END CATCH
END;




