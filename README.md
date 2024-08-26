# Database-for-Retail-Store


# Spring23_S003_22 Database Project

## Overview

This project represents a database schema for managing employee, store, customer, product, and purchase information in a retail business. The schema is designed to handle relationships between various entities such as employees, stores, products, and purchases, along with associated operations like employee assignments, customer purchases, and product categorizations.

## Database Schema

The database schema consists of the following tables:

1. **Spring23_S003_22_Employee**
   - Stores information about employees, including their ID, name, social security number (SSN), physical address, birth date, and store assignment.

2. **Spring23_S003_22_EmployeePhoneNumber**
   - Holds the phone numbers associated with each employee, allowing for multiple phone numbers per employee.

3. **Spring23_S003_22_Store_Details**
   - Contains details about stores, including the store ID, ZIP code, manager details, city, state, yearly investment, and income.

4. **Spring23_S003_22_Customer**
   - Manages customer information, including their ID, name, amount spent, email, and contact number.

5. **Spring23_S003_22_Category**
   - Defines product categories, including category ID, name, number of items, and total cost.

6. **Spring23_S003_22_Products**
   - Stores product details such as ID, name, availability, price, location, type, and associated category and store IDs.

7. **Spring23_S003_22_Buys**
   - Tracks which customers have purchased which products.

8. **Spring23_S003_22_Buys_b_Info**
   - Contains detailed information about the purchases, including purchase date, quantity, and references to the Buys table.

9. **Spring23_S003_22_BillingMachine**
   - Captures billing machine details including machine ID, associated store, employee responsible, date, time, total cost, and number of purchases per day.

10. **Spring23_S003_22_Purchases**
    - Logs details of purchases, including purchase ID, machine ID, date, time, total cost, number of items, and customer ID.

11. **Spring23_S003_22_Purchases_Category**
    - Links purchases with specific categories of products.
