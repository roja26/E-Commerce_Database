# E-Commerce Database

### Team 15 DnA Final Project
### Authors - Aayush M. Aacharya, Adyansh Kakran, Roja Sahoo

To run this database, copy contents of `dump.sql` and paste them in the sql command line. Then run `ecomm.py` to run the interface for the functional requirements of the DB.

Implementation Details -
* We have 6 main entity types namely `Employees`, `Customers`, `Warehouses`, `Vendors`, `Items` and `Orders`.
* We relate all of them through multiple relations namely `Sent To`, `Ordered In`, `Delivered To`, `Items Ordered`, `Belongs To`, `Managing` and `Handling`.
* After normalizing our original database to 3NF form, we have a total of 19 relations.

Functional Requirements - 
1. `I1` - Inserts a new customer into the database.
2. `I2` - Inserts a new vendor into the database.
3. `I3` - Inserts a new Warehouse into the database.
4. `I4` - Inserts a new Item into the database.
5. `I5` - Inserts a new Employee into the database.
6. `I6` - Inserts a new order into the database.
7. `Q1` - Returns a list of all the items that has a rating of more than a specified value.
8. `Q2` - Returns a list of all cities a vendor has delivered to.
9. `Q3` - Returns a list of all employees under a manager.
10. `Q4` - Returns a list of all warehouses in a particular city.
11. `Q5` - Returns details of a customer's expenditure on the website.
12. `U1` - Updates status of order once it has been delivered from Arriving to Delivered.
13. `U2` - Updates Quantity of a Sold Item.
14. `U3` - Delete all cancelled orders from the database.
15. `U4` - Remove a fired employee from the database.