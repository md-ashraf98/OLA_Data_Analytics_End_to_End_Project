<p align="center">
  <img src="D:\DataAnalyticsProjects\OLA_Data_Analytics_End_To_End_Project\Images\OLAlogo.jpg" alt="OLA logo" width="120"/>
</p>

# OLA Data Analytics: End to End

An end-to-end analytics project on **103,024 OLA ride bookings (July 2024)**. It uses **Excel** for data cleaning, **PostgreSQL** for analysis, **Power BI** for an interactive dashboard and **PowerPoint** for presenting the results, and ends with business recommendations.

![Excel](https://img.shields.io/badge/Data%20Cleaning-Excel-217346?logo=microsoftexcel&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-PostgreSQL-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Dashboard-Power%20BI-F2C811?logo=powerbi&logoColor=black)
![PowerPoint](https://img.shields.io/badge/Presentation-PowerPoint-B7472A?logo=microsoftpowerpoint&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-B7D332)

---

## Table of Contents
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Dataset](#dataset)
- [Data Cleaning (Excel)](#data-cleaning-excel)
- [Approach](#approach)
- [Key Findings](#key-findings)
- [SQL Analysis](#sql-analysis)
- [Power BI Dashboard](#power-bi-dashboard)
- [Report and Presentation](#report-and-presentation)
- [Recommendations](#recommendations)
- [Repository Structure](#repository-structure)
- [How to Run](#how-to-run)
- [Tools Used](#tools-used)
- [Author](#author)

---

## Problem Statement
Ride-hailing profits depend on turning each booking request into a completed ride. Cancellations and unmatched requests waste driver time, hurt customer trust and lose revenue. This project finds out **how many bookings fail, why they fail, and where revenue comes from**, so that OLA can act on it.

## Objectives
- Measure the booking success rate and the distribution of failures
- Compare cancellations by drivers and by customers, with reasons
- Analyse revenue, distance and ratings by vehicle type
- Understand payment preferences and demand patterns
- Recommend actions to raise the completion rate
- Present the findings in a clear report and presentation for stakeholders

## Dataset
| Item | Detail |
|---|---|
| File | `Bookings-100000-Rows.csv` |
| Size | 103,024 rows × 20 columns |
| Period | 1 to 31 July 2024 |
| Vehicle types | Auto, Bike, eBike, Mini, Prime Plus, Prime Sedan, Prime SUV |
| Booking status | Success, Canceled by Driver, Canceled by Customer, Driver Not Found |
| Key columns | Booking_Value, Ride_Distance, V_TAT, C_TAT, Driver_Ratings, Customer_Rating, Payment_Method |

## Data Cleaning (Excel)
Before analysis, the raw bookings file was cleaned and checked in Microsoft Excel:

- Checked for duplicate `Booking_ID`s (none found)
- Reviewed blank cells in rating, payment method, turnaround time (V_TAT, C_TAT) and incomplete-ride fields. These are expected for non-successful bookings, because those events only occur on completed rides, so they were kept as blanks
- Standardised column names and data types (date, time, numeric values)
- Validated categories such as Booking_Status, Vehicle_Type and Payment_Method for spelling and consistency
- Removed or corrected invalid values, if any (edit this line to match what you did)
- Saved the cleaned data as CSV for loading into PostgreSQL

## Approach
1. **Collect:** obtain the raw bookings data (103,024 rows × 20 columns)
2. **Clean:** clean and validate the data in Excel
3. **Query:** load the CSV into a PostgreSQL table named `ola` and write 10 SQL queries
4. **Visualise:** build the Power BI dashboard (KPI cards, charts, slicers)
5. **Present:** summarise the insights in a PowerPoint presentation and a written report
6. **Recommend:** turn the findings into actions

## Key Findings
| Metric | Value |
|---|---|
| Total bookings | 103,024 |
| Successful rides | 63,967 (**62.1%**) |
| Canceled by Driver | 18,434 (17.9%) |
| Canceled by Customer | 10,499 (10.2%) |
| Driver Not Found | 10,124 (9.8%) |
| Completed revenue | ₹35.08M |
| Booking value on failed bookings | ₹21.45M |
| Average booking value (completed) | ₹548 |
| Average driver / customer rating | 4.0 / 4.0 |

- **37.9% of bookings fail to complete.** Drivers cancel almost twice as often as customers.
- **The top customer cancellation reasons are about driver behaviour:** "Driver is not moving towards pickup location" (3,175) and "Driver asked to cancel" (2,670).
- **The top driver cancellation reason is "Personal & Car related issue"** (6,542).
- **Revenue is evenly spread across vehicle types**, from ₹4.88M to ₹5.22M. Prime Sedan is highest.
- **Cash is 54.8% of completed rides and UPI is 40.5%.**
- **Demand is steady** at about 3,320 bookings a day, and the failure rate stays near 38% in every hour.
- **Ratings are consistent** at 3.98 to 4.01 for every vehicle type.

## SQL Analysis
The script `OLA_Data_Analysis_Using_SQL.sql` creates the table and answers 10 questions:

1. Retrieve all successful bookings
2. Average ride distance for each vehicle type
3. Total rides cancelled by customers
4. Top 5 customers by number of rides
5. Rides cancelled by drivers due to personal and car-related issues
6. Maximum and minimum driver ratings for Prime Sedan
7. Rides paid using UPI
8. Average customer rating per vehicle type
9. Total booking value of successful rides
10. Incomplete rides with reasons

```sql
-- Example: total booking value of successful rides
SELECT SUM("Booking_Value") AS "Total Booking Value"
FROM ola
WHERE "Booking_Status" = 'Success';
```

## Power BI Dashboard
The interactive dashboard is in `OLA_Analytics_Dashboard.pbix`.

<!-- Add screenshots of your dashboard here -->
<!-- ![Dashboard Overview](images/dashboard_overview.png) -->

## Report and Presentation
The findings are also packaged for stakeholders:

| Deliverable | File | Contents |
|---|---|---|
| Project report | `OLA_Data_Analytics_Report.docx` | Executive summary, problem statement, approach, dataset, charts, SQL summary, recommendations, conclusion |
| PowerPoint presentation | `OLA_Data_Analytics_Presentation.pptx` | 13 slides covering the problem, approach, Excel cleaning, KPIs, booking outcomes, revenue, cancellations, payments, service quality, SQL toolkit and recommendations |

## Recommendations
| Area | Action |
|---|---|
| Driver reliability | Monitor and coach drivers who cancel or do not head to pickup |
| Supply coverage | Add incentives in zones with frequent "Driver Not Found" |
| Fleet health | Run vehicle checks for AC and breakdowns |
| Address quality | Add pin-drop confirmation to reduce wrong-address cancellations |
| Digital payments | Reward UPI and card use for cash riders |

Recovering even 10% of the ₹21.45M lost on failed bookings would add about ₹2.1M a month.

## Repository Structure
```
├── Bookings-100000-Rows.csv
├── OLA_Cleaned_Data.xlsx          (optional: your Excel cleaning file)
├── OLA_Data_Analysis_Using_SQL.sql
├── OLA_Analytics_Dashboard.pbix
├── OLA_Data_Analytics_Report.docx
├── OLA_Data_Analytics_Presentation.pptx
├── OLAlogo.jpg
└── icons/            (cancelled.png, rating.png, car.png, ...)
```

## How to Run
1. Clone the repository
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git
   ```
2. Create the `ola` table in PostgreSQL using the first section of `OLA_Data_Analysis_Using_SQL.sql`
3. Import the cleaned `Bookings-100000-Rows.csv` into the table
4. Run the analysis queries from the same script
5. Open `OLA_Analytics_Dashboard.pbix` in Power BI Desktop
6. Open `OLA_Data_Analytics_Presentation.pptx` in PowerPoint to view the presentation

## Tools Used
- Microsoft Excel: data cleaning and validation
- PostgreSQL: data analysis
- Power BI Desktop: dashboard
- Microsoft PowerPoint: presentation of findings
- Microsoft Word: project report
- Python (pandas, matplotlib): verification and report charts

## Author
**Pinjari Mohammed Ashraf**
