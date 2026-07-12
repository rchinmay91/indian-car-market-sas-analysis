# Indian Domestic Automotive Market Analysis (SAS)

A comprehensive data engineering and analysis project mapping structural variations in fuel efficiency (km/L), power output, and absolute pricing systems across 22 major passenger vehicles in India.

## Project Architecture & Methodology
* **Dynamic Currency Processing**: Implemented `PROC FORMAT` with a native Unicode injection routine (`\u20B9`) to map the official Indian Rupee symbol (`₹`) directly within a UTF-8 compilation profile.
* **Feature Engineering**: Normalized raw pricing figures from commercial Lakh units into base scalar integer values (`Base_Price_Lakhs * 100,000`) and derived an analytical consumer value indicator (`Price_per_HP`).
* **Segmentation Analytics**: Leveraged `PROC MEANS` and sorting algorithms to evaluate structural market differences across Hatchbacks, Sedans, SUVs, MPVs, and EVs.

---

## 📊 SAS Execution Output

### 1. Market Averages by Vehicle Classification Segment (`PROC MEANS`)
The following matrix shows how structural vehicle architectures impact financial and fuel dynamics across the domestic fleet.

| Vehicle Segment | Metrics | Fuel Efficiency (km/L) | Base Price (₹) |
| :--- | :--- | :---: | :---: |
| **Hatchback** | Mean <br> Minimum <br> Maximum | 22.16 <br> 19.34 <br> 24.80 | ₹7,03,250.00 <br> ₹6,49,000.00 <br> ₹7,04,000.00 |
| **Sedan** | Mean <br> Minimum <br> Maximum | 19.29 <br> 17.80 <br> 20.60 | ₹11,48,333.33 <br> ₹11,63,000.00 <br> ₹11,82,000.00 |
| **SUV** | Mean <br> Minimum <br> Maximum | 17.58 <br> 13.00 <br> 20.09 | ₹11,04,230.77 <br> ₹6,13,000.00 <br> ₹16,19,000.00 |
| **MPV** | Mean <br> Minimum <br> Maximum | 24.68 <br> 23.24 <br> 26.11 | ₹14,34,000.00 <br> ₹8,69,000.00 <br> ₹19,99,000.00 |
| **Electric (EV)**| Mean <br> Minimum <br> Maximum | 31.25 <br> 31.25 <br> 31.25 | ₹12,49,000.00 <br> ₹12,49,000.00 <br> ₹12,49,000.00 |

### 2. High-Performance Fleet Portfolio (`PROC PRINT` Snippet)
Vehicles ranked sequentially by overall mechanical power capacity (`Horsepower`) to evaluate premium market pricing.

| Brand | Model | Segment | Fuel Type | Efficiency (km/L) | Base Price (₹) | Horsepower |
| :--- | :--- | :--- | :--- | :---: | :---: | :---: |
| Mahindra | XUV700 | SUV | Petrol | 13.00 | ₹13,99,000.00 | 197 |
| Toyota | Innova_Hycross | MPV | Hybrid | 23.24 | ₹19,99,000.00 | 184 |
| Mahindra | Scorpio_N | SUV | Diesel | 14.20 | ₹13,62,000.00 | 172 |
| Tata | Harrier | SUV | Diesel | 16.80 | ₹15,49,000.00 | 168 |
| Tata | Safari | SUV | Diesel | 16.30 | ₹16,19,000.00 | 168 |
| Hyundai | Verna | Sedan | Petrol | 20.60 | ₹11,00,000.00 | 158 |
| ... | ... | ... | ... | ... | ... | ... |

---

## How to Deploy and Execute
1. Copy the code from `indian_automotive_analysis.sas`.
2. Open your preferred environment (**SAS Studio, Enterprise Guide, or SAS 9.4**).
3. **Crucial**: Ensure your session connection profile is initialized with **UTF-8 Encoding** rather than Latin1 to allow the system to securely map the `\u20B9` hex string.
4. Run the code to generate your analytical outputs.
