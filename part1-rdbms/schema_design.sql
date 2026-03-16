-- Create and select database
CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;

-- Customers table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales representatives table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(200)
);

-- Orders table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order items table
CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample Inserts (5 per table)

INSERT INTO customers VALUES
('C101','Rahul Mehta','rahul@email.com','Mumbai'),
('C102','Anita Shah','anita@email.com','Delhi'),
('C103','Vikram Patel','vikram@email.com','Mumbai'),
('C104','Sneha Gupta','sneha@email.com','Pune'),
('C105','Arjun Nair','arjun@email.com','Bangalore');

INSERT INTO products VALUES
('P101','Wireless Mouse','Electronics',1200),
('P102','Mechanical Keyboard','Electronics',4500),
('P103','Laptop Stand','Accessories',1500),
('P104','USB-C Hub','Accessories',2200),
('P105','Noise Cancelling Headphones','Electronics',8500);

INSERT INTO sales_reps VALUES
('S201','Rohit Sharma','rohit@company.com','Mumbai HQ'),
('S202','Neha Kapoor','neha@company.com','Delhi Office'),
('S203','Amit Singh','amit@company.com','Bangalore Office'),
('S204','Priya Desai','priya@company.com','Mumbai HQ'),
('S205','Karan Malhotra','karan@company.com','Delhi Office');

INSERT INTO orders VALUES
('ORD1001','C101','S201','2024-01-10'),
('ORD1002','C102','S202','2024-01-12'),
('ORD1003','C103','S201','2024-01-15'),
('ORD1004','C104','S203','2024-01-18'),
('ORD1005','C105','S204','2024-01-20');

INSERT INTO order_items VALUES
('ORD1001','P101',2),
('ORD1001','P103',1),
('ORD1002','P102',1),
('ORD1003','P105',1),
('ORD1004','P104',3);