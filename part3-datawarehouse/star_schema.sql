-- Dimension Tables

CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    day INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    year INT NOT NULL
);

CREATE TABLE dim_store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);


-- Fact Table

CREATE TABLE fact_sales (
    sale_id VARCHAR(10) PRIMARY KEY,
    date_id DATE NOT NULL,
    store_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    revenue DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- Insert Dimension Data

INSERT INTO dim_date VALUES
('2024-01-01',1,1,'January',2024),
('2024-01-05',5,1,'January',2024),
('2024-01-10',10,1,'January',2024),
('2024-02-01',1,2,'February',2024),
('2024-02-10',10,2,'February',2024);


INSERT INTO dim_store VALUES
('S101','Mumbai Central Store','Mumbai'),
('S102','Delhi Mall Store','Delhi'),
('S103','Pune City Store','Pune');


INSERT INTO dim_product VALUES
('P201','Laptop','Electronics'),
('P202','T-Shirt','Clothing'),
('P203','Organic Milk','Groceries'),
('P204','Headphones','Electronics');


-- Insert Fact Data (Cleaned)

INSERT INTO fact_sales VALUES
('F001','2024-01-01','S101','P201',1,65000,65000),
('F002','2024-01-01','S102','P202',3,1200,3600),
('F003','2024-01-05','S101','P204',2,3500,7000),
('F004','2024-01-05','S103','P203',10,80,800),
('F005','2024-01-10','S102','P201',1,64000,64000),
('F006','2024-02-01','S101','P202',5,1200,6000),
('F007','2024-02-01','S103','P203',15,80,1200),
('F008','2024-02-10','S101','P204',3,3500,10500),
('F009','2024-02-10','S102','P202',4,1200,4800),
('F010','2024-02-10','S103','P201',1,65000,65000);
