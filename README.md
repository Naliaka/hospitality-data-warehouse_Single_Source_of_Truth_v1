## End-to-End Medallion Architecture (SQL Server + Tableau) – Single Source of Truth

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

1. Bronze Layer: Raw data ingestion from source systems (CSV files)
2. Silver Layer: Cleaned and structured data (dimensions and fact tables)
3. Gold Layer: Business-ready views for analytics and reporting
---

## 🧩 Data Model
The model follows a star schema design:

<img width="991" height="738" alt="Datamart" src="https://github.com/user-attachments/assets/22d15270-6ce0-4025-b453-6c42984a4f05" />

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

## 🟡 Data Pipeline
1. Data is ingested into Bronze tables using BULK INSERT
2. Silver layer applies:
   - Data cleaning
   - Standardization
   - Key relationships
3. Gold layer builds business logic:
   - Stay cost = days_stayed * day_rate
   - Service cost = units * service_rate
   - Discount applied for revenue > 50,000

---

## 🧮 Business Logic
- Stay cost = Days stayed × Day rate
- Service cost = Units × Service rate
- Discount rule → 20% applied for revenue > 50,000
- Final revenue = Stay + Services − Discount

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
- SQL Server (Data Warehouse)
- T-SQL (Data Transformations)
- Tableau (Visualization)
- Draw.io (Architecture Design)

---

## 🚀 Key Learnings
- Designing scalable data models
- Handling multi-fact relationships
- Avoiding duplication using LOD expressions
- Translating business logic into analytics

---

##  💡 Key Highlight:
Instead of building everything in Tableau, I pushed business logic into the data warehouse (Gold Layer) — ensuring:
- Single source of truth
- Better performance
- Reusable analytics layer

---
## 🌟 About Me

Hi there! I am a Data Analytics Developer with a strong focus on data engineering, data modeling, and business intelligence.

I specialize in designing end-to-end data solutions—from raw data ingestion to building analytical data models and interactive dashboards. My work emphasizes creating scalable data pipelines, applying best practices such as Medallion Architecture, and delivering business-ready insights.

This project reflects my ability to combine technical data engineering skills with analytical thinking to solve real-world business problems.

Let's stay in touch! Feel free to connect with me on the following platforms:

[![YouTube](https://img.shields.io/badge/YouTube-Milkawork-red?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@milkawork1238)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Milka%20Wafula-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/milka-wafula/)

