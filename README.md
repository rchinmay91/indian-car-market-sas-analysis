# Indian Domestic Automotive Market Analysis (SAS)

A deep-dive data analysis mapping fuel efficiencies (km/L) and absolute pricing structures across 22 major passenger vehicles in India.

## Project Features
* **Localized Indian Currencies**: Formatted outputs to natively print the official Indian Rupee symbol (`₹`) alongside regional Indian numbering systems.
* **Feature Engineering**: Built calculation routines to scale Base Price from Lakhs to absolute integers and derived a custom value metric (`Price_Per_HP`).
* **Statistical Modeling**: Evaluated operational efficiency metrics grouped by body segments (SUVs, Hatchbacks, Sedans, MPVs) via `PROC MEANS`.

## Dataset Attributes Covered
* Vehicle Metadata: `Brand`, `Model`, `Segment`, `Fuel_Type`
* Performance Metrics: `Mileage_KML`, `Horsepower`
* Financials: `Base_Price_Lakhs`, `Price_INR` (Formatted to ₹)

## How To Run
Ensure your SAS Environment execution profile is configured to compile with **UTF-8 Encoding** to seamlessly support the Unicode `\u20B9` mapping routines.
