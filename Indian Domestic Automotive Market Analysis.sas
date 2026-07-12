/****************************************************************************
* PROJECT NAME: Indian Domestic Automotive Market Analysis
* PURPOSE: Deep-dive analysis of vehicle efficiencies (km/L) and pricing (INR)
*          across 22 major car models available in India.
****************************************************************************/

/* 1. Create a large, comprehensive dataset of cars running on Indian roads */
/* Note: Standard '$' must be used for character compilation types */
data indian_car_market;
    length Brand $15 Model $25 Segment $12 Fuel_Type $8;
    input Brand $ Model $ Segment $ Fuel_Type $ Mileage_KML Base_Price_Lakhs Horsepower;
    datalines;
Maruti_Suzuki Swift Hatchback Petrol 24.80 6.49 88
Maruti_Suzuki Baleno Hatchback Petrol 22.35 6.66 89
Maruti_Suzuki Brezza SUV Petrol 19.89 8.34 102
Maruti_Suzuki Ertiga MPV CNG 26.11 8.69 102
Tata Punch SUV Petrol 20.09 6.13 87
Tata Nexon SUV Petrol 17.44 8.00 118
Tata Harrier SUV Diesel 16.80 15.49 168
Tata Safari SUV Diesel 16.30 16.19 168
Tata Nexon_EV SUV Electric 31.25 12.49 143
Mahindra Thar SUV Diesel 15.20 11.25 130
Mahindra XUV700 SUV Petrol 13.00 13.99 197
Mahindra Scorpio_N SUV Diesel 14.20 13.62 172
Mahindra Bolero SUV Diesel 16.00 9.79 75
Hyundai i20 Hatchback Petrol 19.34 7.04 82
Hyundai Creta SUV Petrol 17.40 11.00 113
Hyundai Verna Sedan Petrol 20.60 11.00 158
Kia Seltos SUV Petrol 17.00 10.90 113
Kia Sonet SUV Petrol 18.70 7.99 118
Honda City Sedan Petrol 17.80 11.82 119
Skoda Slavia Sedan Petrol 19.47 11.63 114
Toyota Innova_Hycross MPV Hybrid 23.24 19.99 184
MG Hector SUV Petrol 13.79 13.99 141
;
run;

/* 2. Setup the Environment and Formats for the Rupee Sign */
/* Force SAS to render Indian regional currency parameters natively */
options locale=en_IN;

/* Create a custom Unicode Picture format for robust '₹' mapping */
%let inr = %sysfunc(unicode(\u20B9));
proc format;
    picture rupee_fmt 
        low - <0  = '00,00,00,00,009.99)' (prefix="(&inr")
        0 - high  = '00,00,00,00,009.99 ' (prefix="&inr");
run;

/* 3. Process and Format variables using Localised Indian Standards */
data cleaned_indian_cars;
    set indian_car_market;
    
    /* Convert Lakhs into absolute Rupee figures (1 Lakh = 1,00,000 INR) */
    Price_INR = Base_Price_Lakhs * 100000;
    
    /* Compute engineered value ratio: Rupee cost per unit of Horsepower */
    Price_Per_HP = Price_INR / Horsepower;
    
    /* Apply clean headers containing the physical ₹ symbol */
    label Mileage_KML = "Fuel Efficiency (km/L)"
          Price_INR = "Base Price (₹)"
          Price_Per_HP = "Price per HP (₹)";
          
    /* Render using our custom Unicode Rupee symbol configuration */
    format Price_INR Price_Per_HP rupee_fmt.; 
run;

/* 4. Generate Analytical Insights Grouped by Vehicle Segment */
title "Market Averages by Vehicle Classification Segment";
proc means data=cleaned_indian_cars mean min max maxdec=2;
    class Segment;
    var Mileage_KML Price_INR;
run;
title;

/* 5. Rank vehicles by absolute Power Output (Horsepower) */
proc sort data=cleaned_indian_cars out=performance_ranking;
    by descending Horsepower;
run;

title "Top Performance Portfolio - Indian Fleet Ranking";
proc print data=performance_ranking label;
    var Brand Model Segment Fuel_Type Mileage_KML Price_INR Horsepower;
run;
title;
