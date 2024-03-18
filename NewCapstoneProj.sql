SHOW DATABASES;
CREATE DATABASE capstone_db;
USE capstone_db;

-- creating users table 
CREATE TABLE users(
	id INT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL,
	age INT,
	gender VARCHAR(1) NOT NULL,
	state VARCHAR(50) NOT NULL,
	street_address VARCHAR(255) NOT NULL,
	postal_code VARCHAR(20) NOT NULL,
	city VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	latitude DECIMAL(10, 8) NOT NULL,
	longitude DECIMAL(10, 8) NOT NULL,
	traffic_source VARCHAR(50) NOT NULL,
	created_at TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE orders (
    order_id INT NOT NULL,
    user_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    created_at TIMESTAMP,
    returned_at TIMESTAMP,
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    num_of_item INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE events (
	id INT NOT NULL,
    user_id INT,
    sequence_number INT NOT NULL,
    session_id VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    ip_address VARCHAR(15) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    browser VARCHAR(50) NOT NULL,
    traffic_source VARCHAR(50) NOT NULL,
    uri VARCHAR(255) NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
    );

CREATE TABLE distribution_centers (
	id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    latitude DECIMAL(10, 6) NOT NULL,
    longitude DECIMAL(10, 6) NOT NULL,
    PRIMARY KEY (id)
    );
    
CREATE TABLE products (
	id INT NOT NULL,
    cost DECIMAL(10, 8) NOT NULL,
    category VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    retail_price DECIMAL(10, 8) NOT NULL,
    department VARCHAR(50) NOT NULL,
    sku VARCHAR(50) NOT NULL,
    distribution_center_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (distribution_center_id) REFERENCES distribution_centers (id)
    );
    
CREATE TABLE inventory_items (
	id INT NOT NULL,
    product_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    sold_at TIMESTAMP NOT NULL,
    cost DECIMAL(10, 8) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    product_brand VARCHAR(50) NOT NULL,
    product_retail_price DECIMAL(10, 8) NOT NULL ,
    product_department VARCHAR(50) NOT NULL,
    product_sku VARCHAR(50) NOT NULL,
    product_distribution_center_id INT NOT NULL,  
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (product_distribution_center_id) REFERENCES distribution_centers (id)
	);
    
CREATE TABLE order_items (
	id INT NOT NULL,
    order_id INT NOT NULL,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    inventory_item_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP,
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    returned_at TIMESTAMP,
    sale_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (product_id) REFERENCES products (id),
    FOREIGN KEY (inventory_item_id) REFERENCES inventory_items (id)
    );
    
    
DROP DATABASE  capstone_db;