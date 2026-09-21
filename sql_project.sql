CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    BirthDate DATE,
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Chemistry'),
(5, 'Biology'),
(6, 'Economics');

INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Rahul', 'Sharma', 'rahul.sharma@email.com', '2001-03-10', '2023-01-15'),
(4, 'Priya', 'Patel', 'priya.patel@email.com', '2000-11-20', '2022-08-01'),
(5, 'Michael', 'Brown', 'michael.brown@email.com', '1998-07-12', '2020-08-01'),
(6, 'Sarah', 'Wilson', 'sarah.wilson@email.com', '2002-02-05', '2023-08-01');

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Quantum Mechanics', 3, 4),
(104, 'Organic Chemistry', 4, 3),
(105, 'Cell Biology', 5, 3),
(106, 'Microeconomics', 6, 3);

INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2),
(3, 'Charlie', 'Davis', 'charlie.davis@univ.com', 3),
(4, 'Diana', 'Miller', 'diana.miller@univ.com', 4),
(5, 'Ethan', 'Clark', 'ethan.clark@univ.com', 5),
(6, 'Fiona', 'White', 'fiona.white@univ.com', 6);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 3, 103, '2023-01-15'),
(4, 4, 104, '2022-08-01'),
(5, 5, 105, '2020-08-01'),
(6, 6, 106, '2023-08-01');

-- Q1. Perform CRUD on all tables.

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (7, 'Statistics');

SELECT * FROM Departments;

UPDATE Departments
SET DepartmentName = 'Data Science'
WHERE DepartmentID = 7;

DELETE FROM Departments
WHERE DepartmentID = 7;

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(7, 'Amit', 'Shah', 'amit.shah@email.com', '2001-06-10', '2024-08-01');

SELECT * FROM Students;

UPDATE Students
SET Email = 'amit.new@email.com'
WHERE StudentID = 7;

DELETE FROM Students
WHERE StudentID = 7;

INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES (107, 'Statistics', 1, 3);

SELECT * FROM Courses;

UPDATE Courses
SET Credits = 4
WHERE CourseID = 107;

DELETE FROM Courses
WHERE CourseID = 107;

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID)
VALUES
(7, 'George', 'Martin', 'george.martin@univ.com', 1);

SELECT * FROM Instructors;

UPDATE Instructors
SET Email = 'george.new@univ.com'
WHERE InstructorID = 7;

DELETE FROM Instructors
WHERE InstructorID = 7;

INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(7, 1, 102, '2024-08-01');

SELECT * FROM Enrollments;

UPDATE Enrollments
SET EnrollmentDate = '2024-09-01'
WHERE EnrollmentID = 7;

DELETE FROM Enrollments
WHERE EnrollmentID = 7;

-- Q2. Retrieve students who enrolled after 2022
SELECT * FROM Students WHERE EnrollmentDate > '2022-12-31';

-- Q3. Retrieve courses offered by the mathematics department with a limit of 5 courses.
SELECT c.CourseID, c.CourseName, c.Credits FROM Courses c
JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics' LIMIT 5;

-- Q4. get the number of students enrolledin each course, filtering for courses with more than 5 students
SELECT CourseID, COUNT(StudentID) AS TotalStudents FROM Enrollments
GROUP BY CourseID HAVING COUNT(StudentID) > 5;

-- Q5. Find students who are enrolled in both Introduction to SQL and Data Structures.
SELECT s.*
FROM Students s
JOIN Enrollments e1 ON s.StudentID = e1.StudentID
JOIN Courses c1 ON e1.CourseID = c1.CourseID AND c1.CourseName = 'Introduction to SQL'
JOIN Enrollments e2 ON s.StudentID = e2.StudentID
JOIN Courses c2 ON e2.CourseID = c2.CourseID AND c2.CourseName = 'Data Structures';

-- Q6. Find students who are either enrolled in Introduction to SQL or Data Structures.
SELECT DISTINCT s.* FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

-- Q7. Calculate the average number of credits for all courses.
SELECT AVG(Credits) AS avgcredits FROM Courses;

-- Q8. Find the maximum salary of instructors in the Computer Science department.
ALTER TABLE Instructors ADD Salary DECIMAL(10, 2);

UPDATE Instructors SET Salary = 85000.00 WHERE InstructorID = 1;
UPDATE Instructors SET Salary = 75000.00 WHERE InstructorID = 2;
UPDATE Instructors SET Salary = 90000.00 WHERE InstructorID = 3;
UPDATE Instructors SET Salary = 65000.00 WHERE InstructorID = 4;
UPDATE Instructors SET Salary = 70000.00 WHERE InstructorID = 5;
UPDATE Instructors SET Salary = 80000.00 WHERE InstructorID = 6;

SELECT MAX(i.Salary) AS MaxSalary FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID WHERE d.DepartmentName = 'Computer Science';

-- Q9. Count the number of students enrolled in each department.
SELECT d.DepartmentName, COUNT(e.StudentID) AS totalstudents FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID GROUP BY d.DepartmentID, d.DepartmentName;

-- Q10. INNER JOIN: Retrieve students and their corresponding courses.
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- Q11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;

-- Q12. Subquery: Find students enrolled in courses that have more than 10 students.
SELECT * FROM Students WHERE StudentID IN (SELECT StudentID FROM Enrollments 
WHERE CourseID IN (SELECT CourseID FROM Enrollments 
GROUP BY CourseID HAVING COUNT(StudentID) > 10));

-- Q13. Extract the year from the EnrollmentDate of students.
SELECT StudentID, FirstName, LastName, YEAR(EnrollmentDate) AS enrollmentyear FROM Students;

-- Q14. Concatenate the instructor's first and last name.
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Instructors;

-- Q15. Calculate the running total of students enrolled in courses.
SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
COUNT(StudentID) OVER (ORDER BY EnrollmentDate, EnrollmentID) AS runningtotal FROM Enrollments;

-- Q16. Label students as 'Senior' or 'Junior' based on their year of enrollment.
SELECT StudentID, FirstName, LastName, EnrollmentDate,
       CASE 
           WHEN EnrollmentDate < CURRENT_DATE - INTERVAL '4 years' THEN 'Senior'
           ELSE 'Junior'
       END AS StudentStatus
FROM Students;
