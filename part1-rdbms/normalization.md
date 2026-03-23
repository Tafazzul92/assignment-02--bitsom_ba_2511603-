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

