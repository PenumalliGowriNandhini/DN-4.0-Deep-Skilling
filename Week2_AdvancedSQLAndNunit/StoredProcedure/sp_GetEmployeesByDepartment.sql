-- Create database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'EmployeeDB')
BEGIN
    CREATE DATABASE EmployeeDB;
END;
GO

-- Use database
USE EmployeeDB;
GO

-- Drop Employees table if it exists
IF OBJECT_ID('Employees', 'U') IS NOT NULL
    DROP TABLE Employees;
GO

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    JoinDate DATE
);
GO

-- Insert data
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
VALUES 
('Gowri', 'Nandhini', 1, 60000, '2023-06-01'),
('Kiran', 'Kumar', 2, 55000, '2022-04-15'),
('Sita', 'Rani', 1, 58000, '2021-12-20');
GO

-- Drop procedure sp_InsertEmployee if exists
IF OBJECT_ID('sp_InsertEmployee', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertEmployee;
GO

-- Create procedure to insert employee
CREATE PROCEDURE sp_InsertEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate);
END;
GO

-- Drop procedure sp_GetEmployeesByDepartment if exists
IF OBJECT_ID('sp_GetEmployeesByDepartment', 'P') IS NOT NULL
    DROP PROCEDURE sp_GetEmployeesByDepartment;
GO

-- Create procedure to get employees by department
CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        JoinDate
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Call: Get employees in Department 1
EXEC sp_GetEmployeesByDepartment @DepartmentID = 1;
GO

-- Call: Insert new employee
EXEC sp_InsertEmployee 
    @FirstName = 'Arjun',
    @LastName = 'Reddy',
    @DepartmentID = 3,
    @Salary = 67000,
    @JoinDate = '2024-01-10';
GO

-- Final Output: Show all employees
SELECT * FROM Employees;
GO
