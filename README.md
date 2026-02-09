# POC – Data Pipeline Automation with Kestra

Proof of Concept of a **data engineering pipeline** orchestrated with **Kestra**.  
This project demonstrates how to automate data ingestion, transformation, quality checks, and analytics using containerized workflows.

**Table of contents**

- [Project Goal](#🎯-project-goal)
- [What This POC Demonstrates](#🧠-what-this-poc-demonstrates)
- [Pipeline Architecture and Workflow](#🗂️-pipeline-architecture-and-workflow)
	- [Main steps](#main-steps)
	- [Pipeline Diagram](#pipeline-diagram)
- [Tech Stack](#⚙️-tech-stack)
- [Running the Project](#🚀-running-the-project)
	- [Prerequisites](#prerequisites)
	- [Start the services](#start-the-services)
	- [Build Custom Python Image](#build-custom-python-image)
	- [Import the yaml file](#import-the-yaml-file)
- [Outputs and Results](#📊-outputs-and-results)
- [Possible Improvements](#🔍-possible-improvements)

---

## 🎯 Project Goal

The goal of this POC is to design a **reproducible and automated data pipeline** that:
- ingests raw business data
- transforms it into analytics-ready formats
- enforces data quality checks at each step
- produces datasets and metrics ready for business analysis

This project was developed as part of a data engineering learning path.

---

## 🧠 What This POC Demonstrates

- Data pipeline orchestration with **Kestra**
- Containerized execution using **Docker**
- Integration of **Python** scripts in an orchestrator
- SQL transformations with **DuckDB**
- Automated data quality checks and assertions
- Parallel execution of analytical tasks
- End-to-end pipeline design (ingestion → analytics)

---

## 🗂️ Pipeline Architecture and Workflow

The pipeline is orchestrated by Kestra and scheduled to run **monthly**.

### Main steps:

1. **Ingestion & Conversion**
   - Download of a compressed dataset containing Excel files
   - Extraction and conversion of Excel files to **Parquet**
   - Validation of conversion using DuckDB

2. **Data Cleaning**
   - Removal of null values based on business rules
   - Assertions to ensure no invalid records remain

3. **Deduplication**
   - Removal of duplicate records using SQL logic
   - Uniqueness checks on business keys

4. **Dataset Merging**
   - Joins between ERP, web, and linking datasets
   - Consistency checks on row counts after merge

5. **Analytics & Export**
   - Revenue calculation per product and total revenue
   - Detection of atypical products using **z-score**
   - Export of results to CSV files
   - Parallel execution of analytical branches

---

### Pipeline Diagram

<img src="./doc/logigramme.png" alt="Kestra pipeline diagram" width="700"/>

---

## ⚙️ Tech Stack

- **Orchestration**: Kestra  
- **Containerization**: Docker, Docker Compose  
- **Languages**: Python, SQL  
- **Analytical Engine**: DuckDB  
- **Data Formats**: Excel, Parquet, CSV  

---

## 🚀 Running the Project

### Prerequisites
Docker & Docker compose

### Start the services
Default :
```bash
    docker compose up -d
```

### Build Custom Python Image
This project relies on a custom Python Docker image with all dependencies pre-installed.

Default :
```bash
    docker build -t custom-python-312 .
```

### Import the yaml file
- Open the Kestra UI: http://localhost:8080/
- Go to Flows > Import
- Import the POC_pipeline.yml file

## 📊 Outputs and Results
The pipeline produces:
- Cleaned and deduplicated datasets in Parquet format
- A CSV file with revenue per product and total revenue
- Two CSV files separating:
	1. vintage products (high z-score)
	2. common products
- Execution logs, metrics, and assertions available in Kestra

## 🔍 Possible Improvements

- Schema validation and schema evolution handling
- Deployment on a cloud environment
- Storage of outputs in a data lake
- Advanced monitoring and alerting
- Parameterization of pipeline inputs
