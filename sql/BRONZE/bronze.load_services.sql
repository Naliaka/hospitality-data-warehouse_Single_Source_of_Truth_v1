
-- NOTE:
-- All customer data used in this project is fictional and generated 
-- for demonstration purposes only. No real customer data is used.


CREATE OR ALTER PROCEDURE bronze.load_services_raw
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

        PRINT '>> Truncating Table: services_raw';
        TRUNCATE TABLE bronze.services_raw;

        PRINT '>> Inserting Data Into: services_raw';

        BULK INSERT bronze.services_raw
        FROM 'C:\Users\MILKA\Documents\Hospitality-data-warehouse\data\services_raw.csv'
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
