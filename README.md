# SQL Database Schema for Customer-Order Management

This repository contains the SQL schema definition for a relational database managing customers, products, and orders.

## Relational Model

The database consists of three tables:

- **Customer** – Stores customer information
- **Product** – Stores product catalog
- **Orders** – Stores customer orders with quantity and total amount

## Table Structures

### Customer
| Column          | Type         | Constraints              |
|-----------------|--------------|--------------------------|
| Customer_id     | NUMBER       | PRIMARY KEY              |
| customer_Name   | VARCHAR2(50) | NOT NULL                 |
| customer_Tel    | VARCHAR2(20) |                          |

### Product
| Column        | Type         | Constraints              |
|---------------|--------------|--------------------------|
| Product_id    | NUMBER       | PRIMARY KEY              |
| product_name  | VARCHAR2(50) | NOT NULL                 |
| Price         | NUMBER(6,2)  |                          |

### Orders
| Column        | Type         | Constraints                          |
|---------------|--------------|--------------------------------------|
| Customer_id   | NUMBER       | PRIMARY KEY, FOREIGN KEY (Customer)  |
| Product_id    | NUMBER       | PRIMARY KEY, FOREIGN KEY (Product)   |
| quantity      | NUMBER       |                                      |
| total_amount  | NUMBER(8,2)  |                                      |

## SQL Commands

### Create Tables

```sql
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
