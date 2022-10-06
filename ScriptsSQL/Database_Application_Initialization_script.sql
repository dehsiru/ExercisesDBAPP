-- __________________________ Initialization script for the needs of the Application___________________________
-- Create database employeeattributedb, create tables, constraint foreign Keys, populate tables with data.  


-- create database employeeattributedb;
-- use employeeattributedb;


-- CREATE TABLE `Employee`(
-- `EMP_ID` Char(36) NOT NULL,
-- `EMP_Name` nvarchar(100) NOT NULL,
-- `EMP_Birthdate` datetime(3) NOT NULL,
-- `EMP_Car` BOOLEAN NULL,
-- `EMP_Address` nvarchar(100) NOT NULL,
-- CONSTRAINT `PK_Employee` PRIMARY KEY 
-- (
-- `EMP_ID` ASC
-- ) 
-- );

-- CREATE TABLE `Attribute`(
-- `ATTR_ID` Char(36) NOT NULL,
-- `ATTR_Name` nvarchar(50) NOT NULL,
-- `ATTR_Value` nvarchar(50) NOT NULL,
-- CONSTRAINT `PK_Attribute` PRIMARY KEY 
-- (
-- `ATTR_ID` ASC
-- ) 
-- );

-- CREATE TABLE `EmployeeAttribute`(
-- `EMPATTR_EmployeeID` Char(36) NOT NULL,
-- `EMPATTR_AttributeID` Char(36) NOT NULL,
-- CONSTRAINT `PK_EmployeeAttribute` PRIMARY KEY 
-- (
-- `EMPATTR_EmployeeID` ASC,
-- `EMPATTR_AttributeID` ASC
-- ) 
-- );


-- alter constraints FK
 
-- ALTER TABLE `EmployeeAttribute` ADD CONSTRAINT
-- `FK_EmployeeAttribute_Attribute` FOREIGN KEY(`EMPATTR_AttributeID`)
-- REFERENCES `Attribute` (`ATTR_ID`);
--  
  
-- ALTER TABLE `EmployeeAttribute` ADD CONSTRAINT
-- `FK_EmployeeAttribute_Employee` FOREIGN KEY(`EMPATTR_EmployeeID`)
--  REFERENCES `Employee` (`EMP_ID`);
 

-- populate data 

-- insert into Employee values('82D58D49-72A2-42B0-A250-471E5C10D7D9', 'Greg', TIMESTAMP('2000-05-04'), TRUE, 'Akropoleos 29');    
-- insert into Employee values('8CEE7A83-A9EB-4170-B7E8-5D4F0440C074', 'Pete', TIMESTAMP('1920-04-01'), FALSE, 'Akropoleos 30'); 

-- insert into Attribute values ('3C86A592-823B-4B83-952F-F437D08F2EA8', 'Height', 'Tall');                                       
-- insert into Attribute values ('70C311F5-B2B0-4118-A069-3AB9C3AC65E1', 'Height', 'Short');

-- insert into EmployeeAttribute values ('82D58D49-72A2-42B0-A250-471E5C10D7D9', '3C86A592-823B-4B83-952F-F437D08F2EA8');
-- insert into EmployeeAttribute values ('8CEE7A83-A9EB-4170-B7E8-5D4F0440C074', '70C311F5-B2B0-4118-A069-3AB9C3AC65E1');


-- __________________________ END___________________________
