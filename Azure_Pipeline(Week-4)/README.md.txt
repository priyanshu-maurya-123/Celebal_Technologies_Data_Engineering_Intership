# Azure Data Factory - CSV Data Pipeline (Week 4 Mini Project)

## 📌 Project Overview

This project demonstrates an end-to-end Azure Data Factory (ADF) pipeline that reads a CSV file from Azure Blob Storage, validates the file using the **Get Metadata** activity, and copies it to a new location in Blob Storage using the **Copy Data** activity.

---

## 🎯 Problem Statement

Build a complete pipeline that reads a CSV file from Azure Blob Storage and processes it using Azure Data Factory.

### Requirements

- Source: CSV file in Azure Blob Storage
- Linked Service
- Dataset
- Pipeline
- Get Metadata Activity
- Copy Data Activity
- Destination: New Blob Storage location

---

## 🛠 Azure Services Used

- Azure Data Factory
- Azure Blob Storage
- Azure Storage Account
- Azure IAM (Role Assignment)

---

## 🔄 Pipeline Workflow

```
Source CSV
      │
      ▼
Get Metadata
      │
      ▼
Copy Data
      │
      ▼
Output Container
```

---

## 📂 Project Structure

```
Azure_ADF_Project_Week-4
│
├── 01_Resource_Group
├── 02_Storage_Account
├── 03_Linked_Service
├── 04_Dataset
├── 05_Get_Metadata
├── 06_Pipeline_Design
├── 07_Pipeline_Success
├── 08_Output_Container
└── 09_IAM_Role_Assignment
```

---

## 📋 Project Steps

### 1. Resource Group
Created a Resource Group to manage Azure resources.

### 2. Storage Account
Created an Azure Storage Account to store the CSV files.

### 3. Linked Service
Connected Azure Data Factory with Azure Blob Storage.

### 4. Dataset
Created Source and Sink datasets for the CSV file.

### 5. Get Metadata Activity
Validated the source CSV file before copying.

### 6. Pipeline Design
Designed an Azure Data Factory pipeline using:
- Get Metadata
- Copy Data

### 7. Pipeline Execution
Successfully executed the pipeline without errors.

### 8. Output Container
Verified that **Superstore_Copy.csv** was successfully copied to the destination container.

### 9. IAM Role Assignment
Assigned the required IAM role to Azure Data Factory for accessing Azure Storage.

---

## ✅ Project Output

- ✔ Pipeline executed successfully
- ✔ Metadata validation completed
- ✔ Data copied successfully
- ✔ Output file generated in Blob Storage

---

## 📸 Screenshots

The repository contains screenshots for every implementation step:

- Resource Group
- Storage Account
- Linked Service
- Dataset
- Get Metadata
- Pipeline Design
- Pipeline Success
- Output Container
- IAM Role Assignment

---

## 🚀 Skills Demonstrated

- Azure Data Factory
- Azure Blob Storage
- Azure IAM
- Linked Services
- Datasets
- Get Metadata Activity
- Copy Data Activity
- ETL Pipeline Development

---

## 👨‍💻 Author

Priyanshu Maurya
