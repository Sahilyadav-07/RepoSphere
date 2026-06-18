# 🚀 RepoSphere

### A Web-Based Repository Management System

RepoSphere is a web-based repository management platform inspired by basic GitHub functionality. It allows users to create repositories and manage files through upload, download, viewing, and deletion operations using a simple web interface.

---

## 📌 Overview

RepoSphere provides a centralized platform for organizing project files into repositories. Users can create repositories, upload files, download them when needed, and manage repository contents efficiently.

The project is built using Java Servlets, JSP, MySQL, and Apache Tomcat.

---

## ✨ Features

### 📁 Repository Management
- Create Repository
- View All Repositories
- Delete Repository
- Open Repository

### 📄 File Management
- Upload Files
- View Uploaded Files
- Download Files
- Delete Files

### 🔄 Dynamic Operations
- Repository-wise file organization
- Real-time file listing
- Dynamic URL handling
- User feedback messages

---

## 🛠️ Tech Stack

### Frontend
- JSP
- HTML
- CSS
- JavaScript

### Backend
- Java Servlets
- JDBC

### Database
- MySQL

### Server
- Apache Tomcat 9

### Development Tools
- Eclipse IDE
- MySQL Workbench

---

## 🏗️ Project Architecture

```text
User
  │
  ▼
JSP Pages
  │
  ▼
Servlets
  │
  ▼
JDBC
  │
  ▼
MySQL Database

File Storage
  │
  ▼
Repositories Folder
```

---

## 📂 Project Structure

```text
RepoSphere/
│
├── src/
│   ├── dao/
│   │   └── DBConnection.java
│   │
│   └── servlets/
│       ├── CreateRepoServlet.java
│       ├── ViewRepoServlet.java
│       ├── DeleteRepoServlet.java
│       ├── OpenRepoServlet.java
│       ├── UploadFileServlet.java
│       ├── DownloadFileServlet.java
│       └── DeleteFileServlet.java
│
├── webapp/
│   ├── createRepo.jsp
│   ├── viewRepos.jsp
│   ├── repo.jsp
│   └── index.jsp
│
└── Repositories/
```

---

## ⚙️ Database Setup

Create Database:

```sql
CREATE DATABASE reposphere;
USE reposphere;
```

Create Table:

```sql
CREATE TABLE repositories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 🚀 How to Run

### 1. Clone Repository

```bash
git clone https://github.com/yourusername/RepoSphere.git
```

### 2. Import Project

Import the project into Eclipse IDE.

### 3. Configure Database

Update database credentials in:

```java
DBConnection.java
```

### 4. Add MySQL Connector

Add MySQL Connector JAR to the project libraries.

### 5. Run on Tomcat

Deploy the project on Apache Tomcat 9.

### 6. Open Browser

```text
http://localhost:8080/RepoSphere/viewRepos
```

---

## 🎯 User Workflow

```text
Create Repository
        ↓
Open Repository
        ↓
Upload Files
        ↓
View Files
        ↓
Download/Delete Files
```

---

## 🔮 Future Enhancements

- User Authentication
- Public & Private Repositories
- Repository Collaboration
- File Versioning
- Cloud Storage Integration
- Repository Analytics Dashboard
- Modern React Frontend

---

## 👨‍💻 Author

**Sahil Yadav**

Project: **RepoSphere – Code Repository Platform**

---

## 📜 License

This project is developed for educational and learning purposes.
