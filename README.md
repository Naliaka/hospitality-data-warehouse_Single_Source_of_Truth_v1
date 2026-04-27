#End-to-End Medallion Architecture (SQL Server + Tableau) – Single Source of Truth

## 📌 Project Overview

This project demonstrates an end-to-end data warehouse solution for a hospitality business,It demonstrates how data from multiple departments can be integrated into a single source of truth using a dimensional data model.

The goal is to transform raw operational data into business-ready insights for revenue analysis, customer segmentation, and service utilization.

The solution follows the Medallion Architecture (Bronze, Silver, Gold) and is built using SQL Server, with Tableau used for visualization.

Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

---

## 📌 Business Questions Answered
This project answers key business questions:

1. Who are the customers generating the highest revenue?
2. How much revenue comes from hotel stays vs services?
3. What services are most used by customers?
4. How do room types impact revenue?
5. Which customers qualify for discounts?
6. What is the total revenue after discounts?

## 🏗️ Architecture
Source Data → Star Schema → SQL Logic → Tableau Dashboard
<img width="1282" height="868" alt="End-to-End Data Warehouse Architecture" src="https://github.com/user-attachments/assets/a0d567e2-abc9-41fd-8082-b62368f800e3" />

Bronze Layer: Raw data ingestion from source systems (CSV files)
Silver Layer: Cleaned and structured data (dimensions and fact tables)
Gold Layer: Business-ready views for analytics and reporting
---

## 🧩 Data Model
The model follows a star schema design:

### Fact Tables
- fact_bookings (Front Office)
- fact_services (Operations)

### Dimension Tables
- dim_customer
- dim_hotel
- dim_service
- dim_date
- dim_room
---

## 🔗 Key Features
- Multi-department data integration
- Conformed dimensions
- Dynamic calculation of business metrics
- Scalable analytical design

---

## 🧮 Business Logic
- Stay Cost = Day Rate × Days Stayed
- Service Cost = Service Rate × Units
- Total = Stay Cost + Service Cost
- Discount = 20% if Total > 50,000
- Final Amount = Total − Discount

---

## 📊 Dashboard
The Tableau dashboard provides:
- Customer-level insights
- Revenue breakdown
- Service usage analysis



<img width="1407" height="956" alt="Screenshot 2026-04-25 212828" src="https://github.com/user-attachments/assets/346c7973-e37a-4d2d-af39-105ab608433d" />

https://public.tableau.com/app/profile/milka.wafula/viz/Hospitality_Data_Model_Single_Source_of_Truth_Update/HospitalityDashboard?publish=yes


---

## 🛠️ Tools Used
- SQL (MsSQL)
- Tableau
- Dimensional Modeling (Star Schema)

---

## 🚀 Key Learnings
- Designing scalable data models
- Handling multi-fact relationships
- Avoiding duplication using LOD expressions
- Translating business logic into analytics

---

## 📎 Project Files
- SQL scripts: `/sql`
- Dataset: `/data`
- Dashboard: `/tableau`
- Documentation: `/docs`

---

## 💡 Author
Milka Wafula
