
CREATE OR ALTER PROCEDURE silver.load_fact_services
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

        PRINT '>> Truncating Table: silver.fact_services';
        TRUNCATE TABLE silver.fact_services;

        PRINT '>> Inserting Data Into: silver.fact_services';

        INSERT INTO silver.fact_services(
        service_txn_id,
        booking_id,
        service_id,
        units,
        create_date
    )
    SELECT DISTINCT
        service_txn_id,
        booking_id,
        service_id,
        units,
        create_date
    FROM bronze.services_raw;
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




