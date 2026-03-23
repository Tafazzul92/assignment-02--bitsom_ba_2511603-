## Anomaly Analysis

•An Insert Anomaly
“P008, Webcam, Electronics, 2100” (from Order ORD1185)

•An Update Anomaly
“SR01, Deepak Joshi, deepak@corp.com, Mumbai HQ, Nariman Point, Mumbai - 400021”

•A Delete Anomaly
“ORD1185 … P008, Webcam, Electronics, 2100”


## Normalization Justification

While keeping all data in a single table may appear simpler at first, the flat structure in orders flat.csv creates serious data integrity problems. The dataset clearly demonstrates multiple anomalies that make the “one big table” approach unreliable and costly to maintain.
For example, the file repeats customer information on every order row. Priya Sharma (C002) appears dozens of times with the same name, email, and city. If her email changes, every row must be updated individually. Missing even one row leads to inconsistent data an obvious update anomaly. Similarly, sales representative details such as “SR01, Deepak Joshi, Mumbai HQ, Nariman Point” are duplicated across many orders. A single change in office address would require editing every occurrence.
The flat file also prevents inserting new master data without unrelated information. For instance, adding a new product like a “Monitor” is impossible unless an order is created, because product attributes only exist inside order rows. This is a textbook insert anomaly.
Finally, the dataset shows clear delete anomalies. Product P008 (Webcam) appears in only one order. If that order is deleted, all knowledge of the product disappears from the system entirely. The same risk applies to customers or sales reps with only one associated order.
Normalization resolves these issues by separating customers, products, sales reps, orders, and order items into independent tables. This eliminates redundancy, ensures consistent updates, and preserves master data even when orders are removed. Far from being over engineering, normalization is essential for accuracy, scalability, and long term maintainability.
