
CREATE OR ALTER PROCEDURE silver.load_dim_customers
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

        PRINT '>> Truncating Table: silver.dim_customers';
        TRUNCATE TABLE silver.dim_customers;

        PRINT '>> Inserting Data Into: silver.dim_customers';

        INSERT INTO silver.dim_customers(
        customer_id,
        customer_name,
        customer_type,
        country,
        gender ,
        loyalty_tier ,
        create_date
    )
    SELECT DISTINCT
        customer_id,
        customer_name,
        customer_type,
        country,
        gender ,
        loyalty_tier ,
        create_date
    FROM bronze.customers_raw;
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

EXECUTE silver.load_dim_customers;


