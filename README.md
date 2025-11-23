#  🛒 Zepto E-commerce SQL Project
📌 Overview

This project analyzes a real-world product dataset inspired by Zepto, focusing on product availability, pricing, discounts, and inventory insights.
Using SQL, the project performs data cleaning, exploratory queries, and business-oriented analysis to uncover actionable insights.

📂 Dataset Summary

File: zepto_v2.csv <BR>
Total Rows: 1,200+ <BR>

Key Columns:<BR>
name – Product name<BR>
category – Product category<BR>
mrp – Maximum Retail Price<BR>
discountPercent – Discount applied<BR>
discountedSellingPrice – Price after discount<BR>
availableQuantity – Stock units<BR>
weightInGms – Product weight<BR>
outOfStock – Stock status<BR>

🛠 SQL Tasks Performed

1️⃣ Data Exploration<BR>
Count total rows<BR>
Check for missing values<BR>
Identify unique categories<BR>
Find duplicate product names<BR>
Check stock vs. out-of-stock items<BR>

2️⃣ Data Cleaning

Removed products where mrp = 0<BR>
## 2. Updating Price Format (Paise → Rupees)

We convert all price values from paise to rupees using the SQL UPDATE query:

```sql
UPDATE zepto
SET 
    mrp = mrp / 100,
    discountedSellingPrice = discountedSellingPrice / 100;
```


Verified cleaned price columns<BR>

3️⃣ Business Insights (SQL Queries)

✔ Top 10 highest discount products<BR>
✔ High-MRP products that are out of stock<BR>
✔ Estimated revenue per category<BR>
✔ MRP > 500 and discount < 10%<BR>
✔ Top 5 categories with highest avg discount<BR>
✔ Best value products (price per gram)<BR>
✔ Weight classification → Low / Medium / Bulk<BR>
✔ Total inventory weight by category<BR>

📊 Key Insights
Certain categories offer significantly higher discounts<BR>
Some expensive items frequently go out of stock<BR>
Revenue contribution varies widely by category<BR>
Many products appear multiple times under different weights<BR>
Bulk items hold the highest inventory weight<BR>


🚀 Tech Used
SQL<BR>
MySQL / Workbench<BR>
CSV dataset processing<BR>
