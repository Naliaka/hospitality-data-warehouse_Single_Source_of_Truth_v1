
CREATE OR ALTER PROCEDURE silver.load_dim_service
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

        PRINT '>> Truncating Table: silver.dim_service';
        TRUNCATE TABLE silver.dim_service;

        PRINT '>> Inserting Data Into: silver.dim_service';

        INSERT INTO silver.dim_service(
        service_id,
        service_type,
        service_rate,
        create_date
    )
    SELECT DISTINCT
        service_id,
        service_type,
        service_rate,
        create_date
        FROM bronze.service_raw;
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




