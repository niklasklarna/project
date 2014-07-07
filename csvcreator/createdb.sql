CREATE TABLE Customers (
CustomerID integer UNIQUE primary key,
FName varchar(25) NOT NULL,
LName varchar(25) NOT NULL,
Street varchar(25) NOT NULL,
City varchar(25) NOT NULL);

CREATE TABLE Managers (
ManagerID integer UNIQUE primary key,
DeptID integer,
FName varchar(25),
LName varchar(25),
DateHired Date);

CREATE TABLE Departments (
DeptID serial primary key,
DeptName varchar(25),
City varchar(25));

CREATE TABLE Employees(
EmpID integer UNIQUE primary key,
DeptID integer,
FName varchar(25),
LName varchar(25),
SSN bigint NOT NULL,
DateHired Date,
FOREIGN KEY (DeptID) REFERENCES Departments(DeptID));

CREATE TABLE Orders (
OrderID integer UNIQUE primary key,
SellerID integer,
Amount integer,
OrderDate Date,
CustomerID integer,
FOREIGN KEY (SellerID) REFERENCES Employees(EmpID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

\copy customers from '/home/niklas/IdeaProjects/csvcreator/target/Customers.csv' DELIMITER ',';
\copy departments from '/home/niklas/IdeaProjects/csvcreator/target/Departments.csv' DELIMITER ',';
\copy employees from '/home/niklas/IdeaProjects/csvcreator/target/Employees.csv' DELIMITER ',';
\copy orders from '/home/niklas/IdeaProjects/csvcreator/target/Orders.csv' DELIMITER ',';
\copy Managers from '/home/niklas/IdeaProjects/csvcreator/target/Managers.csv' DELIMITER ',';