
CREATE OR ALTER PROCEDURE silver.load_dim_rooms
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

        PRINT '>> Truncating Table: silver.dim_rooms';
        TRUNCATE TABLE silver.dim_hotels;

        PRINT '>> Inserting Data Into: silver.dim_rooms';

        INSERT INTO silver.dim_hotels(
        room_id,
        room_type,
        capacity,
        day_rate,
        create_date
    )
    SELECT DISTINCT
        room_id VARCHAR(10),
        room_type VARCHAR(50),
        capacity INT,
        day_rate DECIMAL(10,2),
        create_date     DATE,
        dwh_create_date datetime2 default GETDATE()
        FROM bronze.hotels_raw;
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




