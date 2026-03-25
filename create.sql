CREATE TABLE Customer (
    Customer_id NUMBER PRIMARY KEY,
    customer_Name VARCHAR2(50) NOT NULL,
    customer_Tel VARCHAR2(20)
);

CREATE TABLE Product (
    Product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50) NOT NULL,
    Price NUMBER(6,2)
);

CREATE TABLE Orders (
    Customer_id NUMBER,
    Product_id NUMBER,
    quantity NUMBER,
    total_amount NUMBER(8,2),
    CONSTRAINT pk_Orders PRIMARY KEY (Customer_id, Product_id),
    CONSTRAINT fk_Orders_Customer FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    CONSTRAINT fk_Orders_Product FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);
