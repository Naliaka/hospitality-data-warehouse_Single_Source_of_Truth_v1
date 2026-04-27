CREATE OR ALTER PROCEDURE bronze.load_bookings_raw
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
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.bookings_raw';
        TRUNCATE TABLE bronze.bookings_raw;

        PRINT '>> Inserting Data Into: bronze.bookings_raw';

        BULK INSERT bronze.bookings_raw
        FROM 'C:\Users\MILKA\Documents\Hospitality-data-warehouse\data\fact_bookings.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );

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