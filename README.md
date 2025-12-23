# 🚗 Vehicle Rental System - Database Design

## 📋 Project Overview

This project implements a comprehensive database design for a **Vehicle Rental System** that manages users, vehicles, and bookings. The database is designed to handle real-world scenarios including customer registrations, vehicle inventory management, and rental booking operations.

## 🎯 Objectives

This assignment demonstrates proficiency in:
- Designing Entity Relationship Diagrams (ERD) with various relationship types
- Understanding and implementing primary keys and foreign keys
- Writing complex SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING clauses
- Applying database normalization principles

---

## 🗂️ Database Schema

### Tables Overview

The database consists of three main tables:

#### 1. **Users Table**
Stores customer and admin information.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| user_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each user |
| name | VARCHAR(100) | NOT NULL | User's full name |
| email | VARCHAR(100) | UNIQUE, NOT NULL | User's email address |
| phone | VARCHAR(15) | NOT NULL | Contact number |
| password | VARCHAR(255) | NOT NULL | Encrypted password |
| role | ENUM('Admin', 'Customer') | DEFAULT 'Customer' | User role type |

#### 2. **Vehicles Table**
Manages the vehicle inventory.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| vehicle_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each vehicle |
| name | VARCHAR(100) | NOT NULL | Vehicle name/brand |
| type | ENUM('car', 'bike', 'truck') | NOT NULL | Vehicle category |
| model | VARCHAR(50) | NOT NULL | Model year |
| registration_number | VARCHAR(20) | UNIQUE, NOT NULL | Vehicle registration plate |
| rental_price | DECIMAL(10,2) | NOT NULL | Daily rental rate |
| status | ENUM('available', 'rented', 'maintenance') | DEFAULT 'available' | Current vehicle status |

#### 3. **Bookings Table**
Tracks all rental bookings.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| booking_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for each booking |
| user_id | INT | FOREIGN KEY REFERENCES Users(user_id) | Customer who made the booking |
| vehicle_id | INT | FOREIGN KEY REFERENCES Vehicles(vehicle_id) | Vehicle being rented |
| start_date | DATE | NOT NULL | Rental start date |
| end_date | DATE | NOT NULL | Rental end date |
| status | ENUM('pending', 'confirmed', 'completed', 'cancelled') | DEFAULT 'pending' | Booking status |
| total_cost | DECIMAL(10,2) | NOT NULL | Total rental cost |

---

## 🔗 Entity Relationship Diagram (ERD)

### Relationships

- **One to Many**: `Users` → `Bookings` (One user can make multiple bookings)
- **Many to One**: `Bookings` → `Vehicles` (Many bookings can reference one vehicle)
- **One to One (logical)**: Each booking connects exactly one user and one vehicle at a time

### ERD Link
🔗 **[View ERD Diagram](https://drawsql.app/teams/auvroinc/diagrams/assignment-3)**

> Created using DrawSQL - An interactive Entity Relationship Diagram tool

---

## 📊 Sample Data

### Users
| user_id | name | email | phone | role |
|---------|------|-------|-------|------|
| 1 | Alice | alice@example.com | 1234567890 | Customer |
| 2 | Bob | bob@example.com | 0987654321 | Admin |
| 3 | Charlie | charlie@example.com | 1122334455 | Customer |

### Vehicles
| vehicle_id | name | type | model | registration_number | rental_price | status |
|------------|------|------|-------|---------------------|--------------|--------|
| 1 | Toyota Corolla | car | 2022 | ABC-123 | 50 | available |
| 2 | Honda Civic | car | 2021 | DEF-456 | 60 | rented |
| 3 | Yamaha R15 | bike | 2023 | GHI-789 | 30 | available |
| 4 | Ford F-150 | truck | 2020 | JKL-012 | 100 | maintenance |

### Bookings
| booking_id | user_id | vehicle_id | start_date | end_date | status | total_cost |
|------------|---------|------------|------------|----------|--------|------------|
| 1 | 1 | 2 | 2023-10-01 | 2023-10-05 | completed | 240 |
| 2 | 1 | 2 | 2023-11-01 | 2023-11-03 | completed | 120 |
| 3 | 3 | 2 | 2023-12-01 | 2023-12-02 | confirmed | 60 |
| 4 | 1 | 1 | 2023-12-10 | 2023-12-12 | pending | 100 |

---

## 🔍 SQL Queries

All SQL queries are implemented in [`queries.sql`](queries.sql)

### Query 1: JOIN - Retrieve Booking Information
**Purpose**: Get booking details along with customer name and vehicle name.

**Concepts**: INNER JOIN

**Expected Result**: 4 rows showing booking details with customer and vehicle names

### Query 2: EXISTS - Find Unbooked Vehicles
**Purpose**: Identify all vehicles that have never been booked.

**Concepts**: NOT EXISTS, Subquery

**Expected Result**: 2 vehicles (Yamaha R15, Ford F-150)

### Query 3: WHERE - Filter Available Cars
**Purpose**: Retrieve all available vehicles of type 'car'.

**Concepts**: SELECT, WHERE clause, Multiple conditions

**Expected Result**: 1 vehicle (Toyota Corolla)

### Query 4: GROUP BY and HAVING - Popular Vehicles
**Purpose**: Find vehicles with more than 2 bookings.

**Concepts**: GROUP BY, HAVING, COUNT, Aggregate functions

**Expected Result**: 1 vehicle (Honda Civic with 3 bookings)

---

## 💡 Key Database Features

### Business Logic Implementation

✅ **User Management**
- Unique email validation (no duplicate accounts)
- Role-based access (Admin/Customer)
- Secure password storage

✅ **Vehicle Inventory**
- Unique registration numbers
- Real-time availability tracking
- Multiple vehicle types support

✅ **Booking System**
- Date-based rental tracking
- Status management (pending → confirmed → completed)
- Automatic cost calculation
- Prevents double booking through status management

### Data Integrity

- **Primary Keys**: Ensure unique identification for all records
- **Foreign Keys**: Maintain referential integrity between tables
- **UNIQUE Constraints**: Prevent duplicate emails and registration numbers
- **NOT NULL Constraints**: Ensure critical data is always provided
- **ENUM Types**: Restrict values to predefined options

---

## 🚀 How to Use

### 1. Database Setup
```sql
-- Create the database
CREATE DATABASE VehicleRentalSystem;
USE VehicleRentalSystem;

-- Run the schema creation queries
-- (Include your CREATE TABLE statements here)
```

### 2. Insert Sample Data
```sql
-- Insert test data for Users, Vehicles, and Bookings
-- (Refer to queries.sql for complete INSERT statements)
```

### 3. Execute Queries
```sql
-- Run queries from queries.sql file
-- Each query is numbered and documented
```

---


## 📝 Notes

- All queries are tested with the provided sample data
- The database design follows normalization principles (3NF)
- Foreign key constraints ensure data integrity
- Status fields allow for workflow management
- The schema is scalable for future enhancements

---
