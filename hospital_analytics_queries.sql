-- ============================================================================
-- HOSPITAL CLINICAL & BILLING ANALYTICS DATABASE
-- Author: Sara Farhath
-- ============================================================================

-- 1. SCHEMA CREATION
CREATE TABLE Doctors (
    DoctorID TEXT PRIMARY KEY,
    DoctorName TEXT,
    Department TEXT
);

CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY,
    PatientName TEXT,
    Age INTEGER,
    Diagnosis TEXT,
    LengthOfStayDays INTEGER,
    Readmitted30Days INTEGER,
    DoctorID TEXT,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Billing (
    BillID INTEGER PRIMARY KEY,
    PatientID INTEGER,
    TotalAmount REAL,
    InsuranceCovered REAL,
    ClaimStatus TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- 2. ANALYTICAL QUERIES

-- Query 1: Departmental Revenue & Average Length of Stay (LOS)
SELECT d.Department,
       COUNT(p.PatientID) AS Total_Patients,
       ROUND(AVG(p.LengthOfStayDays), 1) AS Avg_Stay_Days,
       SUM(b.TotalAmount) AS Total_Revenue
FROM Patients p
JOIN Doctors d ON p.DoctorID = d.DoctorID
JOIN Billing b ON p.PatientID = b.PatientID
GROUP BY d.Department
ORDER BY Total_Revenue DESC;

-- Query 2: Senior Citizen (Age > 60) Readmission Audit
SELECT Diagnosis,
       COUNT(*) AS Senior_Cases,
       SUM(Readmitted30Days) AS Readmitted_Count
FROM Patients
WHERE Age > 60
GROUP BY Diagnosis;

-- Query 3: High-Value Rejected & Pending Insurance Claims Audit
SELECT p.PatientName, d.Department, b.TotalAmount, b.ClaimStatus
FROM Billing b
JOIN Patients p ON b.PatientID = p.PatientID
JOIN Doctors d ON p.DoctorID = d.DoctorID
WHERE b.ClaimStatus IN ('Rejected', 'Pending') AND b.TotalAmount > 100000;
