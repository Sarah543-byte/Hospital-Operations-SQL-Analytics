# Hospital Clinical & Billing Operations SQL Analytics

## Project Overview
A relational database schema and SQL analytics project modeling hospital patient care, departmental revenue, 30-day readmission rates, and insurance claim audits across three normalized tables (`Patients`, `Doctors`, and `Billing`).

## Key Business & Clinical Queries
* **Departmental Revenue & Length of Stay (LOS):** Used multi-table `INNER JOIN`s and `GROUP BY` aggregations to rank hospital departments by total billing revenue and average patient stay duration.
* **Senior Readmission Tracking:** Filtered cohorts (`Age > 60`) to isolate diagnoses driving 30-day hospital readmissions.
* **Insurance Claims Revenue Cycle Audit:** Flagged high-value (`> ₹1,00,000`) rejected and pending insurance claims across Cardiology and Orthopedics for billing recovery.

## SQL Concepts Demonstrated
* Relational Schema Design (`PRIMARY KEY`, `FOREIGN KEY` constraints)
* Multi-table `JOIN` operations across 3 normalized tables
* Aggregations (`SUM`, `COUNT`, `AVG`, `ROUND`) with `GROUP BY` and `ORDER BY`
* Conditional filtering (`WHERE`, `IN`, logical `AND`)
