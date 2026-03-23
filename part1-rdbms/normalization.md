**## Anomaly Analysis**



**1. Insert Anomaly**



Row 12 — Columns: sales\_rep\_name, sales\_rep\_email, office\_address



**Issue:**

To insert a new product into the system, the flat file requires entering sales rep details even if the sales rep has nothing to do with the product.



**Why this is an anomaly:**

The product cannot be inserted unless unrelated sales rep information is also inserted.  

This violates normalization because product data depends on product\_id, not sales\_rep\_id.



**2. Update Anomaly**



Rows 5, 9, 14 — Column: customer\_city for customer\_id = C002



**Issue:**

Customer C002 appears in multiple rows. If the customer moves to a new city, the city must be updated in every row.



**Why this is an anomaly:**

If one row is updated but others are not, the database becomes inconsistent.  

This happens because customer information is duplicated across many rows.



**3. Delete Anomaly**



Row 3 — Columns: order\_id = ORD1002 (only order for customer C004)



**Issue:**

If the only order for customer C004 is deleted, all customer information (name, email, city) is also lost.



**Why this is an anomaly:**

Deleting an order should not delete the customer.  

But in a flat file, customer data is stored inside the same row as the order, so deleting the row removes both.







**## Normalization Justification**



While keeping all data in a single table may appear simpler at first, the flat structure in orders\_flat.csv creates serious data integrity problems. The dataset clearly demonstrates multiple anomalies that make the “one big table” approach unreliable and costly to maintain.



For example, the file repeats customer information on every order row. Priya Sharma (C002) appears dozens of times with the same name, email, and city. If her email changes, every row must be updated individually. Missing even one row leads to inconsistent data—an obvious update anomaly. Similarly, sales representative details such as “SR01, Deepak Joshi, Mumbai HQ, Nariman Point” are duplicated across many orders. A single change in office address would require editing every occurrence.



The flat file also prevents inserting new master data without unrelated information. For instance, adding a new product like a “Monitor” is impossible unless an order is created, because product attributes only exist inside order rows. This is a textbook insert anomaly.



Finally, the dataset shows clear delete anomalies. Product P008 (Webcam) appears in only one order. If that order is deleted, all knowledge of the product disappears from the system entirely. The same risk applies to customers or sales reps with only one associated order.



Normalization resolves these issues by separating customers, products, sales reps, orders, and order items into independent tables. This eliminates redundancy, ensures consistent updates, and preserves master data even when orders are removed. Far from being over engineering, normalization is essential for accuracy, scalability, and long term maintainability.



