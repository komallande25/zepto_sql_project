
# Zepto Product & Inventory Analysis (SQL)

**Problem:** Analyze product pricing, stock availability, and category performance for a Zepto-style e-commerce dataset to surface business-relevant insights.

**Dataset:** `zepto_v2.csv` — 3,732 products across 14 categories. Columns: name, category, mrp, discountPercent, availableQuantity, discountedSellingPrice, weightInGms, outOfStock, quantity.

## Data Cleaning
- Checked for missing values across all columns
- Removed 1 row with `mrp = 0` (invalid entry)
- Converted `mrp` and `discountedSellingPrice` from paise to rupees:
```sql
UPDATE zepto
SET mrp = mrp / 100,
    discountedSellingPrice = discountedSellingPrice / 100;
```
- Identified 2,051 rows where the same product name appears multiple times (different weights/variants) — expected for this dataset, not treated as duplicates

## Analysis (SQL)
Queries covered: top discount products, high-MRP out-of-stock items, revenue by category, price-per-gram value analysis, weight-based classification (Low/Medium/Bulk via CASE statements), and category-wise inventory weight.

## Key Findings
- **453 products (12.1% of inventory) are out of stock**, including high-MRP items like Patanjali Cow's Ghee (₹565) — representing potential lost revenue
- **Fruits & Vegetables has the highest average discount (~15.5%)**, notably higher than any other category
- Revenue is unevenly distributed across categories, with some categories contributing significantly more than others despite similar product counts

## Tools
SQL (MySQL Workbench), CSV dataset processing

## Repository Structure
```
├── zepto_v2.csv
└── zepto_project.sql
```
