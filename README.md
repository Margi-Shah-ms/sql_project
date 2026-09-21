Click here for the video: 

# SQL University Database Project

A relational database project built to practice and demonstrate core SQL concepts using a **University Management System**.

The project covers database design, table creation, constraints, data manipulation, CRUD operations, filtering, aggregation, joins, subqueries, string/date functions, conditional logic, and window functions.

---

## 📌 Project Overview

This project represents a simplified university database containing information about:

* Departments
* Students
* Courses
* Instructors
* Enrollments

The database is designed using primary keys and foreign keys to establish relationships between the entities.

### Main Objective

The objective of this project is to demonstrate practical SQL skills through a structured set of database operations and analytical queries.

---

## 🗂️ Database Structure

The database contains **5 tables**:

### 1. Departments

Stores information about university departments.

| Column         | Data Type    | Constraint  |
| -------------- | ------------ | ----------- |
| DepartmentID   | INT          | Primary Key |
| DepartmentName | VARCHAR(100) | NOT NULL    |

---

### 2. Students

Stores student personal and enrollment information.

| Column         | Data Type    | Constraint  |
| -------------- | ------------ | ----------- |
| StudentID      | INT          | Primary Key |
| FirstName      | VARCHAR(50)  |             |
| LastName       | VARCHAR(50)  |             |
| Email          | VARCHAR(100) |             |
| BirthDate      | DATE         |             |
| EnrollmentDate | DATE         |             |

---

### 3. Courses

Stores courses offered by different departments.

| Column       | Data Type    | Constraint  |
| ------------ | ------------ | ----------- |
| CourseID     | INT          | Primary Key |
| CourseName   | VARCHAR(100) |             |
| DepartmentID | INT          | Foreign Key |
| Credits      | INT          |             |

`DepartmentID` references `Departments(DepartmentID)`.

---

### 4. Instructors

Stores instructor information and their associated departments.

| Column       | Data Type     | Constraint  |
| ------------ | ------------- | ----------- |
| InstructorID | INT           | Primary Key |
| FirstName    | VARCHAR(50)   |             |
| LastName     | VARCHAR(50)   |             |
| Email        | VARCHAR(100)  |             |
| DepartmentID | INT           | Foreign Key |
| Salary       | DECIMAL(10,2) |             |

`DepartmentID` references `Departments(DepartmentID)`.

---

### 5. Enrollments

Acts as a relationship table between students and courses.

| Column         | Data Type | Constraint  |
| -------------- | --------- | ----------- |
| EnrollmentID   | INT       | Primary Key |
| StudentID      | INT       | Foreign Key |
| CourseID       | INT       | Foreign Key |
| EnrollmentDate | DATE      |             |

`StudentID` references `Students(StudentID)`.

`CourseID` references `Courses(CourseID)`.

---

## 🔗 Entity Relationships

The basic relationship structure is:

```text
Departments
     │
     ├──────────< Courses
     │               │
     │               │
     └──────────< Instructors
                    

Students
    │
    └──────────< Enrollments >────────── Courses
```

### Relationships

* One department can have multiple courses.
* One department can have multiple instructors.
* One student can have multiple enrollments.
* One course can have multiple enrollments.
* `Enrollments` connects students and courses.

---
## output: 
### 1. Departments:
<img width="305" height="196" alt="image" src="https://github.com/user-attachments/assets/c6ba7bc4-40b0-4e54-b08b-b8b05a1b6a07" />

### 2. Students:
<img width="789" height="195" alt="image" src="https://github.com/user-attachments/assets/e2a58b48-a36a-4888-bf7e-fe56d35918ab" />

### 3. Courses:
<img width="462" height="192" alt="image" src="https://github.com/user-attachments/assets/ed1e4603-1cbc-4330-a3ef-f409ea7f8462" />

### 4. Instructors:
<img width="694" height="192" alt="image" src="https://github.com/user-attachments/assets/264fa261-0f71-40de-88fa-6ba09a8f3cff" />

### 5. Enrollments:
<img width="406" height="195" alt="image" src="https://github.com/user-attachments/assets/63023cf6-25b7-423a-984f-0506229b6d9a" />

### Running total of students enrolled in courses
<img width="496" height="191" alt="image" src="https://github.com/user-attachments/assets/37a89e72-5420-453c-83f2-277565d40845" />

###  Label students as 'Senior' or 'Junior' based on their year of enrollment
<img width="660" height="194" alt="image" src="https://github.com/user-attachments/assets/f1bc93d1-1d9d-453a-b701-a1f8087d8e28" />


## 🛠️ SQL Concepts Covered

The project demonstrates the following SQL concepts:

### Database & Table Design

* `CREATE TABLE`
* Primary Keys
* Foreign Keys
* `NOT NULL`
* `ALTER TABLE`
* Adding columns
* Data types

### Data Manipulation

* `INSERT`
* `UPDATE`
* `DELETE`

### Data Retrieval

* `SELECT`
* `WHERE`
* `DISTINCT`
* `IN`
* `LIMIT`

### Filtering & Conditions

* Comparison operators
* Multiple conditions
* `CASE`
* Date-based filtering

### Aggregation

* `COUNT()`
* `AVG()`
* `MAX()`
* `GROUP BY`
* `HAVING`

### Joins

* `INNER JOIN`
* `LEFT JOIN`
* Multiple-table joins

### Advanced SQL

* Subqueries
* Window functions
* Running totals
* String concatenation
* Date functions

---


## 💻 SQL Environment

The project is intended for practice with relational databases and can be adapted to systems such as:

* MySQL
* PostgreSQL
* SQL Server

