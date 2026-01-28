🚀 Data Engineering Zoomcamp — Module 1 Homework

Docker, PostgreSQL, SQL Analytics & Terraform on GCP

📌 Project Overview

This project demonstrates foundational data engineering skills using containerization, relational databases, SQL analytics, and Infrastructure as Code (IaC).

The objective is to:

Deploy PostgreSQL and pgAdmin using Docker Compose

Ingest and analyze real-world NYC Taxi data

Perform analytical queries using SQL

Provision cloud infrastructure on Google Cloud Platform (GCP) using Terraform

This project simulates a typical data engineering workflow: from local data ingestion and analysis to cloud resource provisioning.

🛠️ Technology Stack

Docker & Docker Compose — container orchestration

PostgreSQL — relational database

pgAdmin — database administration tool

SQL — data analysis and querying

Terraform — Infrastructure as Code

Google Cloud Platform (GCP) — cloud storage & BigQuery

🏗️ System Architecture
+-------------------+
|   NYC Taxi Data   |
| (Parquet & CSV)   |
+---------+---------+
          |
          v
+-------------------+       +------------------+
|   PostgreSQL DB   |<----->|      pgAdmin     |
| (Docker Container)|       | (Docker Container)|
+---------+---------+       +------------------+
          |
          v
+-------------------+
|   SQL Analytics   |
+---------+---------+
          |
          v
+-------------------+
| Terraform (GCP)   |
| - GCS Bucket      |
| - BigQuery Dataset|
+-------------------+

📂 Repository Structure
de-zoomcamp-hw1/
│
├── docker-compose.yaml      # PostgreSQL & pgAdmin services
├── queries.sql              # SQL queries for analysis
├── README.md                # Project documentation
│
└── terraform/
    ├── main.tf              # GCP resources
    ├── variables.tf         # Terraform variables
    └── README.md            # Terraform usage guide

⚙️ Environment Setup
1️⃣ Start PostgreSQL and pgAdmin using Docker
docker-compose up -d


PostgreSQL runs on port 5433 and pgAdmin on port 8080.

2️⃣ Download the datasets
wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2025-11.parquet
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv

3️⃣ Load data into PostgreSQL

The datasets are loaded into PostgreSQL tables:

green_taxi — trip data

zones — taxi zone lookup

🧪 Homework Solutions
✅ Question 1 — Docker pip version

Command executed:

docker run -it --entrypoint bash python:3.13
pip --version


Answer: 25.3

✅ Question 2 — Docker networking

In Docker Compose, containers communicate using service names and internal ports.

Answer: db:5432

✅ Question 3 — Counting short trips

Trips with trip_distance <= 1 mile in November 2025:

SELECT COUNT(*) 
FROM green_taxi
WHERE lpep_pickup_datetime >= '2025-11-01'
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;


Answer: 8,007

✅ Question 4 — Longest trip day (< 100 miles)
SELECT DATE(lpep_pickup_datetime) AS day,
       MAX(trip_distance) AS max_distance
FROM green_taxi
WHERE trip_distance < 100
GROUP BY day
ORDER BY max_distance DESC
LIMIT 1;


Answer: 2025-11-14

✅ Question 5 — Biggest pickup zone by revenue
SELECT z."Zone", SUM(g.total_amount) AS total
FROM green_taxi g
JOIN zones z ON g.PULocationID = z."LocationID"
WHERE DATE(g.lpep_pickup_datetime) = '2025-11-18'
GROUP BY z."Zone"
ORDER BY total DESC
LIMIT 1;


Answer: East Harlem North

✅ Question 6 — Largest tip destination zone
SELECT z2."Zone", MAX(g.tip_amount) AS max_tip
FROM green_taxi g
JOIN zones z1 ON g.PULocationID = z1."LocationID"
JOIN zones z2 ON g.DOLocationID = z2."LocationID"
WHERE z1."Zone" = 'East Harlem North'
GROUP BY z2."Zone"
ORDER BY max_tip DESC
LIMIT 1;


Answer: Yorkville West

--->> Terraform Workflow

Correct sequence:

init → download providers

apply → create resources

destroy → delete resources

✅ Correct answer:

terraform init, terraform apply -auto-approve, terraform destroy


📊 Key Learnings

Understanding Docker images, containers, and networking

Orchestrating multi-container applications with Docker Compose

Working with real-world datasets using PostgreSQL

Writing analytical SQL queries for data insights

Applying Infrastructure as Code principles with Terraform

Provisioning cloud resources on Google Cloud Platform


🌟 Professional Takeaways

This project demonstrates the ability to:

Build reproducible data environments using containers

Perform data analysis using SQL on large datasets

Apply DevOps and cloud principles in data engineering workflows

Document technical work in a clear and professional manner

These skills are essential for modern Data Engineering and DevOps roles.


🔗 References

Data Engineering Zoomcamp — DataTalksClub

NYC Taxi & Limousine Commission Dataset

Docker, PostgreSQL, Terraform, Google Cloud Platform
