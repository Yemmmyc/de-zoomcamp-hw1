# 🚀 Data Engineering Zoomcamp — Module 1 Homework

![Python](https://img.shields.io/badge/Python-3.13-blue) ![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-blue?logo=postgresql) ![Terraform](https://img.shields.io/badge/Terraform-blue?logo=terraform) ![GCP](https://img.shields.io/badge/GCP-Google%20Cloud-blue?logo=googlecloud)

**Docker, PostgreSQL, SQL Analytics & Terraform on GCP**

---

## 📌 Project Overview

This project demonstrates foundational data engineering skills using:

* Containerization (Docker & Docker Compose)
* Relational databases (PostgreSQL)
* SQL analytics
* Infrastructure as Code (Terraform) on GCP

**Objectives:**

1. Deploy PostgreSQL and pgAdmin using Docker Compose
2. Ingest and analyze real-world NYC Taxi data
3. Perform analytical queries using SQL
4. Provision cloud infrastructure on Google Cloud Platform (GCP)

This project simulates a typical data engineering workflow: from local data ingestion and analysis to cloud resource provisioning.

---

## 🛠️ Technology Stack

* **Docker & Docker Compose** — container orchestration
* **PostgreSQL** — relational database
* **pgAdmin** — database administration tool
* **SQL** — data analysis and querying
* **Terraform** — Infrastructure as Code
* **Google Cloud Platform (GCP)** — cloud storage & BigQuery

---

## 🏗️ System Architecture

```text
+-------------------+
| NYC Taxi Data     |
| (Parquet & CSV)   |
+---------+---------+
          |
          v
+-------------------+      +------------------+
| PostgreSQL DB     |<---->| pgAdmin          |
| (Docker Container)|      | (Docker Container)|
+---------+---------+      +------------------+
          |
          v
+-------------------+
| SQL Analytics     |
+---------+---------+
          |
          v
+-------------------+
| Terraform (GCP)   |
| - GCS Bucket      |
| - BigQuery Dataset|
+-------------------+
```

> Optional: Replace ASCII diagram with an actual image of architecture:
> `![Architecture](images/architecture.png)`

---

## 📂 Repository Structure

```text
de-zoomcamp-hw1/
├── docker-compose.yaml    # PostgreSQL & pgAdmin services
├── queries.sql            # SQL queries for analysis
├── README.md              # Project documentation
└── terraform/
    ├── main.tf            # GCP resources
    ├── variables.tf       # Terraform variables
    └── README.md          # Terraform usage guide
```

---

## ⚙️ Environment Setup

1️⃣ **Start PostgreSQL and pgAdmin using Docker**

```bash
docker-compose up -d
```

* PostgreSQL: port 5433
* pgAdmin: port 8080

2️⃣ **Download the datasets**

```bash
wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2025-11.parquet
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv
```

3️⃣ **Load data into PostgreSQL**

* `green_taxi` — trip data
* `zones` — taxi zone lookup

---

## 🧪 Homework Solutions

**Question 1 — Docker pip version**

```bash
docker run -it --entrypoint bash python:3.13 pip --version
```

**Answer:** 25.3

**Question 2 — Docker networking**

Answer: `db:5432`

**Question 3 — Counting short trips**

```sql
SELECT COUNT(*)
FROM green_taxi
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;
```

**Answer:** 8,007

**Question 4 — Longest trip day (< 100 miles)**

```sql
SELECT DATE(lpep_pickup_datetime) AS day,
       MAX(trip_distance) AS max_distance
FROM green_taxi
WHERE trip_distance < 100
GROUP BY day
ORDER BY max_distance DESC
LIMIT 1;
```

**Answer:** 2025-11-14

**Question 5 — Biggest pickup zone by revenue**

```sql
SELECT z.zone, SUM(g.total_amount) AS total
FROM green_taxi g
JOIN zones z ON g.pulocationid = z.locationid
WHERE DATE(g.lpep_pickup_datetime) = '2025-11-18'
GROUP BY z.zone
ORDER BY total DESC
LIMIT 1;
```

**Answer:** East Harlem North

**Question 6 — Largest tip destination zone**

```sql
SELECT z2.zone, MAX(g.tip_amount) AS max_tip
FROM green_taxi g
JOIN zones z1 ON g.pulocationid = z1.locationid
JOIN zones z2 ON g.dolocationid = z2.locationid
WHERE z1.zone = 'East Harlem North'
GROUP BY z2.zone
ORDER BY max_tip DESC
LIMIT 1;
```

**Answer:** Yorkville West

---

## 🔨 Terraform Workflow

Full Windows instructions are available here: terraform/README.md

```bash
terraform init      # download providers
terraform apply -auto-approve   # create resources
terraform destroy   # delete resources
```

---

## 📊 Key Learnings

* Understanding Docker images, containers, and networking
* Orchestrating multi-container applications with Docker Compose
* Working with real-world datasets using PostgreSQL
* Writing analytical SQL queries for data insights
* Applying Infrastructure as Code principles with Terraform
* Provisioning cloud resources on Google Cloud Platform

---

## 🌟 Professional Takeaways

This project demonstrates the ability to:

* Build reproducible data environments using containers
* Perform data analysis using SQL on large datasets
* Apply DevOps and cloud principles in data engineering workflows
* Document technical work in a clear and professional manner

---

## 🔗 References

* [Data Engineering Zoomcamp — DataTalksClub](https://github.com/DataTalksClub/data-engineering-zoomcamp)
* [NYC Taxi & Limousine Commission Dataset](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page)
* Docker, PostgreSQL, Terraform, Google Cloud Platform

