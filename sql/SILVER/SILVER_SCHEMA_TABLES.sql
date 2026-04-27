-- =========================
-- SILVER SCHEMA TABLES
-- ========================


IF OBJECT_ID('silver.fact_services', 'U') IS NOT NULL
    DROP TABLE silver.fact_services;
GO

CREATE TABLE silver.fact_services (
    service_txn_id VARCHAR(10),
    booking_id VARCHAR(10),
    service_id VARCHAR(10),
    units INT,
    create_date     DATE,
    dwh_create_date datetime2 default GETDATE()
);
GO

IF OBJECT_ID('silver.dim_customers', 'U') IS NOT NULL
    DROP TABLE silver.dim_customers;
GO
CREATE TABLE silver.dim_customers (
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    customer_type VARCHAR(50),
    country VARCHAR(50),
    gender VARCHAR(10),
    loyalty_tier VARCHAR(20),
    create_date     DATE,
    dwh_create_date datetime2 default GETDATE()
);
GO

IF OBJECT_ID('silver.dim_hotels', 'U') IS NOT NULL
    DROP TABLE silver.dim_hotels;
GO

CREATE TABLE silver.dim_hotels (
    hotel_id VARCHAR(10),
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    create_date     DATE,
    dwh_create_date datetime2 default GETDATE()
);
GO

IF OBJECT_ID('silver.dim_rooms', 'U') IS NOT NULL
    DROP TABLE silver.dim_rooms;
GO
CREATE TABLE silver.dim_rooms (
    room_id VARCHAR(10),
    room_type VARCHAR(50),
    capacity INT,
    day_rate DECIMAL(10,2),
    create_date     DATE,
    dwh_create_date datetime2 default GETDATE()
);
GO

IF OBJECT_ID('silver.dim_service', 'U') IS NOT NULL
    DROP TABLE silver.dim_service;
GO
CREATE TABLE silver.dim_service (
    service_id VARCHAR(10),
    service_type VARCHAR(50),
    service_rate DECIMAL(10,2),
    create_date     DATE,
    dwh_create_date datetime2 default GETDATE()
);
GO

IF OBJECT_ID('silver.dim_date', 'U') IS NOT NULL
    DROP TABLE silver.dim_date;
GO
CREATE TABLE silver.dim_date (
    date_id VARCHAR(10) PRIMARY KEY,
    full_date DATE,
    day INT,
    month VARCHAR(20),
    year INT,
    week_day VARCHAR(20),
    create_date     DATE,
    dwh_create_date datetime2 default GETDATE()
);
GO

IF OBJECT_ID('silver.fact_bookings', 'U') IS NOT NULL
    DROP TABLE silver.fact_bookings;
GO

CREATE TABLE silver.fact_bookings (
    booking_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    hotel_id VARCHAR(10),
    room_id VARCHAR(10),

    booking_date_id VARCHAR(10), 
    check_in_date DATE,
    check_out_date DATE,

    channel VARCHAR(20),
    create_date     DATE,
    dwh_create_date datetime2 default GETDATE()
    FOREIGN KEY (booking_date_id) REFERENCES dim.date(date_id)
);