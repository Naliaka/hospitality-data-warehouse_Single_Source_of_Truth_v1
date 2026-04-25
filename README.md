# Hospitality Data Warehouse – Single Source of Truth

## 📌 Project Overview
This project demonstrates how data from multiple hospitality departments can be integrated into a single source of truth using a dimensional data model.

The solution transforms a business scenario into a scalable data architecture, enabling consistent reporting and analytics.

---

## 🏗️ Architecture
Source Data → Star Schema → SQL Logic → Tableau Dashboard

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



<img width="1401" height="950" alt="Screenshot 2026-04-25 211735" src="https://github.com/user-attachments/assets/612941b5-d80a-4011-85e4-8e701909ac3f" />



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
