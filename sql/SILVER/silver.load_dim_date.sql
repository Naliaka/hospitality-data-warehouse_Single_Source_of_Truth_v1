
CREATE OR ALTER PROCEDURE silver.load_dim_date
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

        PRINT '>> Truncating Table: silver.dim_date';
        TRUNCATE TABLE silver.dim_date;

        PRINT '>> Inserting Data Into: silver.dim_date';

        INSERT INTO silver.dim_date(
        date_id,
        full_date,
        day,
        month,
        year,
        week_day,
        create_date
    )
    SELECT DISTINCT
        date_id,
        full_date,
        day,
        month,
        year,
        week_day,
        create_date
    FROM bronze.date_raw;
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




