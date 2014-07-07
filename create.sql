use niktestdb;
add jar /opt/cloudera/parcels/CDH/lib/sqoop/sqoop-1.4.3-cdh4.4.0.jar;

DROP TABLE IF EXISTS departments;
CREATE EXTERNAL TABLE departments (
  deptid INT,
  deptname STRING,
  city STRING
)
ROW FORMAT SERDE 'com.cloudera.sqoop.contrib.FieldMappableSerDe'
WITH SERDEPROPERTIES (
  "fieldmappable.classname" = "departments"
)
STORED AS SEQUENCEFILE
LOCATION "hdfs://datavault-dev-db3.internal.machines:8020/user/niklas.andersen/imports/departments";

DROP TABLE IF EXISTS managers;
CREATE EXTERNAL TABLE managers (
  managerid INT,
  deptid INT,
  fname STRING,
  lname STRING,
  datehired STRING
)
ROW FORMAT SERDE 'com.cloudera.sqoop.contrib.FieldMappableSerDe'
WITH SERDEPROPERTIES (
  "fieldmappable.classname" = "managers"
)
STORED AS SEQUENCEFILE
LOCATION "hdfs://datavault-dev-db3.internal.machines:8020/user/niklas.andersen/imports/managers";

DROP TABLE IF EXISTS employees;
CREATE EXTERNAL TABLE employees (
  empid INT,
  deptid INT,
  fname STRING,
  lname STRING,
  ssn BIGINT,
  datehired STRING
)
ROW FORMAT SERDE 'com.cloudera.sqoop.contrib.FieldMappableSerDe'
WITH SERDEPROPERTIES (
  "fieldmappable.classname" = "employees"
)
STORED AS SEQUENCEFILE
LOCATION "hdfs://datavault-dev-db3.internal.machines:8020/user/niklas.andersen/imports/employees";

DROP TABLE IF EXISTS orders;
CREATE EXTERNAL TABLE orders (
  orderid INT,
  sellerid INT,
  amount INT,
  orderdate STRING,
  customerid INT
)
ROW FORMAT SERDE 'com.cloudera.sqoop.contrib.FieldMappableSerDe'
WITH SERDEPROPERTIES (
  "fieldmappable.classname" = "orders"
)
STORED AS SEQUENCEFILE
LOCATION "hdfs://datavault-dev-db3.internal.machines:8020/user/niklas.andersen/imports/orders";

DROP TABLE IF EXISTS customers;
CREATE EXTERNAL TABLE customers (
  customerid INT,
  fname STRING,
  lname STRING,
  street STRING,
  city STRING
)
ROW FORMAT SERDE 'com.cloudera.sqoop.contrib.FieldMappableSerDe'
WITH SERDEPROPERTIES (
  "fieldmappable.classname" = "customers"
)
STORED AS SEQUENCEFILE
LOCATION "hdfs://datavault-dev-db3.internal.machines:8020/user/niklas.andersen/imports/customers";

SET hive.exec.compress.output=true;
SET mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;

use niktestdb;
DROP TABLE IF EXISTS resultTable1;
CREATE TABLE resultTable1
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE
AS
SELECT  m.FName AS managerFname, d.DeptName as departmentName, e.FName as employeeFname, c.FName as customerFname
    FROM Managers m
    JOIN Departments d on d.deptID = m.DeptID
    JOIN Employees e on e.DeptID = d.DeptID
    JOIN Orders o on o.SellerID = e.EmpID
    JOIN Customers c on c.CustomerID = o.CustomerID
    WHERE c.City <> d.City;


DROP TABLE IF EXISTS resultTable2;
CREATE TABLE resultTable2
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
AS
SELECT  m.FName AS managerFname, d.DeptName AS departmentName, e.FName AS employeeFname, c.FName AS customerFname
    FROM Managers m
    JOIN Departments d on d.deptID = m.DeptID
    JOIN Employees e on e.DeptID = d.DeptID
    JOIN Orders o on o.SellerID = e.EmpID
    JOIN Customers c on c.CustomerID = o.CustomerID
    WHERE c.City like '%ab%';

DROP TABLE IF EXISTS resultTable3;

CREATE TABLE resultTable3
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
AS
SELECT c.CustomerID AS customerid, o.OrderID AS orderid, e.EmpID AS employeeid
FROM Customers c
JOIN Orders o on o.CustomerID = c.CustomerID
JOIN Employees e on e.EmpID = o.SellerID
JOIN Departments d on d.DeptID = e.DeptID
JOIN Managers m on m.DeptID = d.DeptID
WHERE m.ManagerID < 50; 

        

DROP TABLE IF EXISTS resultTable4;
      
CREATE TABLE resultTable4
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE 
AS  
SELECT sum(o.Amount) AS ordersAmountSum, m.FName AS managerFname, e.DeptID AS employeeDeptId, COUNT(c.CustomerID) AS customerIdCount
    FROM Orders o
    JOIN Employees e on o.SellerID = e.EmpID
    JOIN Customers c on c.CustomerID = o.CustomerID
    JOIN Departments d on d.DeptID = e.DeptID
    JOIN Managers m on m.DeptID = d.DeptID
    WHERE d.DeptID >10
    GROUP BY m.FName, e.DeptID;


