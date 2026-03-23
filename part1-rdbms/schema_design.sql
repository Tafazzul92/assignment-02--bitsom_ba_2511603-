mysql> use `sql_1.2`;
Database changed
mysql> CREATE TABLE customers (
    ->     customer_id   VARCHAR(10) PRIMARY KEY,
    ->     customer_name VARCHAR(100) NOT NULL,
    ->     customer_email VARCHAR(100) NOT NULL,
    ->     customer_city  VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.259 sec)

mysql> CREATE TABLE products (
    ->     product_id   VARCHAR(10) PRIMARY KEY,
    ->     product_name VARCHAR(100) NOT NULL,
    ->     category     VARCHAR(50) NOT NULL,
    ->     unit_price   DECIMAL(10,2) NOT NULL
    -> );
Query OK, 0 rows affected (0.154 sec)

mysql> CREATE TABLE sales_reps (
    ->     sales_rep_id   VARCHAR(10) PRIMARY KEY,
    ->     sales_rep_name VARCHAR(100) NOT NULL,
    ->     sales_rep_email VARCHAR(100) NOT NULL,
    ->     office_address  VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.173 sec)

mysql> CREATE TABLE orders (
    ->     order_id      VARCHAR(20) PRIMARY KEY,
    ->     customer_id   VARCHAR(10) NOT NULL,
    ->     sales_rep_id  VARCHAR(10) NOT NULL,
    ->     order_date    DATE NOT NULL,
    ->     FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    ->     FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
    -> );
Query OK, 0 rows affected (0.455 sec)

mysql> CREATE TABLE order_items (
    ->     order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     order_id VARCHAR(20) NOT NULL,
    ->     product_id VARCHAR(10) NOT NULL,
    ->     quantity INT NOT NULL,
    ->     FOREIGN KEY (order_id) REFERENCES orders(order_id),
    ->     FOREIGN KEY (product_id) REFERENCES products(product_id)
    -> );
Query OK, 0 rows affected (0.365 sec)

mysql> INSERT INTO customers VALUES
    -> ('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
    -> ('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
    -> ('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
    -> ('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
    -> ('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');
Query OK, 5 rows affected (0.075 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO products VALUES
    -> ('P001', 'Laptop', 'Electronics', 55000),
    -> ('P002', 'Mouse', 'Electronics', 800),
    -> ('P003', 'Desk Chair', 'Furniture', 8500),
    -> ('P004', 'Notebook', 'Stationery', 120),
    -> ('P005', 'Headphones', 'Electronics', 3200);
Query OK, 5 rows affected (0.062 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO sales_reps VALUES
    -> ('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
    -> ('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
    -> ('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001'),
    -> ('SR04', 'Placeholder Rep', 'placeholder@corp.com', 'Placeholder Office'),
    -> ('SR05', 'Backup Rep', 'backup@corp.com', 'Backup Office');
Query OK, 5 rows affected (0.054 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO orders VALUES
    -> ('ORD1027', 'C002', 'SR02', '2023-11-02'),
    -> ('ORD1114', 'C001', 'SR01', '2023-08-06'),
    -> ('ORD1153', 'C006', 'SR01', '2023-02-14'),
    -> ('ORD1002', 'C002', 'SR02', '2023-01-17'),
    -> ('ORD1118', 'C006', 'SR02', '2023-11-10');
Query OK, 5 rows affected (0.076 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO order_items (order_id, product_id, quantity) VALUES
    -> ('ORD1027', 'P004', 4),
    -> ('ORD1114', 'P003', 2),
    -> ('ORD1153', 'P003', 3),
    -> ('ORD1002', 'P005', 1),
    -> ('ORD1118', 'P003', 5);
Query OK, 5 rows affected (0.048 sec)
Records: 5  Duplicates: 0  Warnings: 0