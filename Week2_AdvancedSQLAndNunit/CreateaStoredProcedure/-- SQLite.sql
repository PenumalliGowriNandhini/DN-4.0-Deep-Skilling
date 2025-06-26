-- SQLite
DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    DepartmentID INTEGER PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INTEGER,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('John', 'Doe', 1, 5000.00, '2020-01-15'),
('Jane', 'Smith', 2, 6000.00, '2019-03-22'),
('Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
('Emily', 'Davis', 4, 5500.00, '2021-11-05');
SELECT * FROM Employees
WHERE DepartmentID = 1;
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
VALUES ('Alice', 'Brown', 2, 6200.00, '2023-04-01');
SELECT * FROM Employees;
