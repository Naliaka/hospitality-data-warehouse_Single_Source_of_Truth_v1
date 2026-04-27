-- =========================
-- BRONZE SCHEMA TABLES
-- ========================


IF OBJECT_ID('bronze.services_raw', 'U') IS NOT NULL
    DROP TABLE bronze.services_raw;
GO

CREATE TABLE bronze.services_raw (
    service_txn_id VARCHAR(10),
    booking_id VARCHAR(10),
    service_id VARCHAR(10),
    units INT,
    create_date     DATE
);
GO

IF OBJECT_ID('bronze.customers_raw', 'U') IS NOT NULL
    DROP TABLE bronze.customers_raw;
GO
CREATE TABLE bronze.customers_raw (
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    customer_type VARCHAR(50),
    country VARCHAR(50),
    gender VARCHAR(10),
    loyalty_tier VARCHAR(20),
    create_date     DATE
);
GO

IF OBJECT_ID('bronze.hotels_raw', 'U') IS NOT NULL
    DROP TABLE bronze.hotels_raw;
GO

CREATE TABLE bronze.hotels_raw (
    hotel_id VARCHAR(10),
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    create_date     DATE
);
GO

IF OBJECT_ID('bronze.rooms_raw', 'U') IS NOT NULL
    DROP TABLE bronze.rooms_raw;
GO
CREATE TABLE bronze.rooms_raw (
    room_id VARCHAR(10),
    room_type VARCHAR(50),
    capacity INT,
    day_rate DECIMAL(10,2),
    create_date     DATE
);
GO

IF OBJECT_ID('bronze.service_raw', 'U') IS NOT NULL
    DROP TABLE bronze.service_raw;
GO
CREATE TABLE bronze.service_raw (
    service_id VARCHAR(10),
    service_type VARCHAR(50),
    service_rate DECIMAL(10,2),
    create_date     DATE
);
GO

IF OBJECT_ID('bronze.date_raw', 'U') IS NOT NULL
    DROP TABLE bronze.date_raw;
GO
CREATE TABLE bronze.date_raw (
    date_id VARCHAR(10) PRIMARY KEY,
    full_date DATE,
    day INT,
    month VARCHAR(20),
    year INT,
    week_day VARCHAR(20),
    create_date     DATE
);
GO

IF OBJECT_ID('bronze.bookings_raw', 'U') IS NOT NULL
    DROP TABLE bronze.bookings_raw;
GO

CREATE TABLE bronze.bookings_raw (
    booking_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    hotel_id VARCHAR(10),
    room_id VARCHAR(10),

    booking_date_id VARCHAR(10), 
    check_in_date DATE,
    check_out_date DATE,

    channel VARCHAR(20),
    create_date     DATE,

    FOREIGN KEY (booking_date_id) REFERENCES dim.date(date_id)
);