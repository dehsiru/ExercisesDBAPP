-- __________________________ Initialization script for Exercises_____________________________
-- Create database dbo, create tables, constraint foreign Keys, populate tables with data


-- create database dbo;
-- use dbo;


-- CREATE TABLE `Employee`(
-- `EMP_ID` Char(36) NOT NULL,
-- `EMP_Name` nvarchar(100) NOT NULL,
-- `EMP_DateOfHire` datetime(3) NOT NULL,
-- `EMP_Supervisor` Char(36) NOT NULL,
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
 
-- ALTER TABLE `Employee` ADD CONSTRAINT `FK_Employee_Employee` FOREIGN
-- KEY(`EMP_Supervisor`)
-- REFERENCES `Employee` (`EMP_ID`);
 
-- ALTER TABLE `EmployeeAttribute` ADD CONSTRAINT
-- `FK_EmployeeAttribute_Attribute` FOREIGN KEY(`EMPATTR_AttributeID`)
-- REFERENCES `Attribute` (`ATTR_ID`);  
  
-- ALTER TABLE `EmployeeAttribute` ADD CONSTRAINT
-- `FK_EmployeeAttribute_Employee` FOREIGN KEY(`EMPATTR_EmployeeID`)
--  REFERENCES `Employee` (`EMP_ID`);
 

-- populate data in the tables

-- insert into Employee values('82D58D49-72A2-42B0-A250-471E5C10D7D9', 'Greg', UTC_TIMESTAMP(3), null);
-- insert into Employee values('8CEE7A83-A9EB-4170-B7E8-5D4F0440C074', 'Oleg', UTC_TIMESTAMP(3), '82D58D49-72A2-42B0-A250-471E5C10D7D9');
-- insert into Employee values('561E2D88-A747-460F-99E1-CFB1D3D8CA5C', 'Pete', UTC_TIMESTAMP(3), '8CEE7A83-A9EB-4170-B7E8-5D4F0440C074');
-- insert into Employee values('28106345-435B-4215-AECF-7C226C071E11', 'Paul', UTC_TIMESTAMP(3), '82D58D49-72A2-42B0-A250-471E5C10D7D9');
-- insert into Employee values('7012F5C7-33AD-4839-A092-4FA6E1448A5D', 'Aura', UTC_TIMESTAMP(3), '82D58D49-72A2-42B0-A250-471E5C10D7D9');
-- insert into Employee values('2E3074E7-8FFB-4C5F-83AE-962812F93D08', 'Phil', UTC_TIMESTAMP(3), '82D58D49-72A2-42B0-A250-471E5C10D7D9');

-- insert into Attribute values ('3C86A592-823B-4B83-952F-F437D08F2EA8', 'Height', 'Tall');
-- insert into Attribute values ('70C311F5-B2B0-4118-A069-3AB9C3AC65E1', 'Height', 'Short');
-- insert into Attribute values ('82FF24BB-0180-40F9-B68E-15799556A5C2', 'Height', 'Medium');
-- insert into Attribute values ('EB812BF6-3415-4686-A0B6-38089C87D09D', 'Height', 'Short');
-- insert into Attribute values ('83382664-DA55-4C6D-8D18-ED79C26332A8', 'Weight', 'Medium');
-- insert into Attribute values ('F27B9C58-FD9E-4EB1-9B09-E01FF7032CC8', 'Weight', 'Thin');
-- insert into Attribute values ('4F8EAC6B-8B29-4716-A597-C8CDE3A3996D', 'Weight', 'Heavy');

-- insert into EmployeeAttribute values ('82D58D49-72A2-42B0-A250-471E5C10D7D9', '3C86A592-823B-4B83-952F-F437D08F2EA8');
-- insert into EmployeeAttribute values ('8CEE7A83-A9EB-4170-B7E8-5D4F0440C074', '70C311F5-B2B0-4118-A069-3AB9C3AC65E1');
-- insert into EmployeeAttribute values ('561E2D88-A747-460F-99E1-CFB1D3D8CA5C', '82FF24BB-0180-40F9-B68E-15799556A5C2');
-- insert into EmployeeAttribute values ('28106345-435B-4215-AECF-7C226C071E11', 'EB812BF6-3415-4686-A0B6-38089C87D09D');
-- insert into EmployeeAttribute values ('2E3074E7-8FFB-4C5F-83AE-962812F93D08', '4F8EAC6B-8B29-4716-A597-C8CDE3A3996D');
-- insert into EmployeeAttribute values ('8CEE7A83-A9EB-4170-B7E8-5D4F0440C074', 'F27B9C58-FD9E-4EB1-9B09-E01FF7032CC8');
-- insert into EmployeeAttribute values ('82D58D49-72A2-42B0-A250-471E5C10D7D9', '83382664-DA55-4C6D-8D18-ED79C26332A8');


-- _____________________________ END ___________________________________