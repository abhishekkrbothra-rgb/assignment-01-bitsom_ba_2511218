Anomaly Analysis
Insert Anomaly

An insert anomaly occurs when we cannot add data without adding unrelated data.

Example from the dataset structure:

Columns involved:
product_id, product_name, category, unit_price

Because products exist only inside order rows, a new product cannot be inserted unless an order exists.

Example rows:

order_id = ORD1027

order_id = ORD1162

Both contain the same product_id with product details.
Problem:
If the company wants to add a new product (e.g., product_id = P200) to the catalog before it is ordered, there is no place to store it in this table without creating a fake order.

Update Anomaly

An update anomaly occurs when the same information is stored in multiple rows and must be updated everywhere.

Example:

Product information appears in many rows:
| order_id | product_id | product_name   | unit_price |
| -------- | ---------- | -------------- | ---------- |
| ORD1027  | P101       | Wireless Mouse | 1200       |
| ORD1162  | P101       | Wireless Mouse | 1200       |
| ORD1133  | P101       | Wireless Mouse | 1200       |

Columns involved:
product_id, product_name, unit_price

Problem:
If the price of Wireless Mouse changes from 1200 to 1300, it must be updated in every row where product_id = P101.

If one row is missed, the database becomes inconsistent.

Delete Anomaly

A delete anomaly occurs when deleting a row removes important unrelated information.

Example:

If the row:

order_id = ORD1002

is the only order placed by customer C301, deleting that order will also delete:

customer_name

customer_email

customer_city

Columns involved:
customer_id, customer_name, customer_email, customer_city
Problem:
We lose customer information simply because their order was deleted.

Normalization Justification

Keeping all retail data in a single table may appear simple initially, but it introduces serious data integrity and maintenance problems. The dataset orders_flat.csv stores customer information, product details, order information, and sales representative data in the same table. This design leads to redundancy and anomalies.

For example, product information such as product_name, category, and unit_price is repeated for every order containing that product. If the price of a product changes, the update must be applied to multiple rows. Missing one row leads to inconsistent pricing data. This is a classic update anomaly that normalization eliminates by storing product data in a separate products table.

Similarly, customer data such as customer_name, customer_email, and customer_city appears in every order placed by the same customer. If the customer updates their email address, it must be updated across all rows. In a normalized schema, customer data is stored once in a customers table and referenced using a foreign key.

Delete anomalies are also present. If the only order for a customer is deleted, the entire customer recorddisappears. Normalization prevents this by separating orders from customers.

By transforming the dataset into Third Normal Form (3NF), we separate entities into logical tables such as customers, products, orders, and sales_reps. This reduces redundancy, improves consistency, and ensures data integrity. Therefore, normalization is not over-engineering but a necessary practice for reliable database design.

