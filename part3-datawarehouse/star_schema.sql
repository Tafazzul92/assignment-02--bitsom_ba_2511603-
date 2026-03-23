--------------------
-- DIMENSION TABLES
--------------------


-- Date Dimension
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL,
    weekday VARCHAR(10) NOT NULL
);


-- Store Dimension
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);


-- Product Dimension
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);


--------------------
-- FACT TABLE
--------------------


CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    units_sold INT NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-----------------------------------
-- INSERT CLEANED DIMENSION DATA
-----------------------------------


-- dim_date (cleaned to YYYY-MM-DD)

INSERT INTO dim_date VALUES
(20230829, '2023-08-29', 2023, 8, 29, 'Tuesday'),
(20231212, '2023-12-12', 2023, 12, 12, 'Tuesday'),
(20230205, '2023-02-05', 2023, 2, 5, 'Sunday'),
(20230220, '2023-02-20', 2023, 2, 20, 'Monday'),
(20230115, '2023-01-15', 2023, 1, 15, 'Sunday'),
(20230809, '2023-08-09', 2023, 8, 9, 'Wednesday'),
(20230331, '2023-03-31', 2023, 3, 31, 'Friday'),
(20231026, '2023-10-26', 2023, 10, 26, 'Thursday'),
(20231208, '2023-12-08', 2023, 12, 8, 'Friday'),
(20230815, '2023-08-15', 2023, 8, 15, 'Tuesday');

-- dim_store (cleaned store_city)

INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune'),
(5, 'Mumbai Central', 'Mumbai');

-- dim_product (standardized category casing)

INSERT INTO dim_product VALUES
(1, 'Speaker', 'Electronics', 49262.78),
(2, 'Tablet', 'Electronics', 23226.12),
(3, 'Phone', 'Electronics', 48703.39),
(4, 'Smartwatch', 'Electronics', 58851.01),
(5, 'Atta 10kg', 'Grocery', 52464.00),
(6, 'Jeans', 'Clothing', 2317.47),
(7, 'Biscuits', 'Grocery', 27469.99),
(8, 'Headphones', 'Electronics', 39854.96),
(9, 'Jacket', 'Clothing', 30187.24),
(10, 'Milk 1L', 'Grocery', 43374.39);


----------------------------------------
-- INSERT CLEANED FACT DATA (10 rows)
----------------------------------------


INSERT INTO fact_sales VALUES
(1, 20230829, 1, 1, 3, 147788.34),
(2, 20231212, 1, 2, 11, 255487.32),
(3, 20230205, 1, 3, 20, 974067.80),
(4, 20230220, 2, 2, 14, 325165.68),
(5, 20230115, 1, 4, 10, 588510.10),
(6, 20230809, 3, 5, 12, 629568.00),
(7, 20230331, 4, 4, 6, 353106.06),
(8, 20231026, 4, 6, 16, 37079.52),
(9, 20231208, 3, 7, 9, 247229.91),
(10, 20230815, 3, 4, 3, 176553.03);
