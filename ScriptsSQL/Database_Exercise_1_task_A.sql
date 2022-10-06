-- 		___________________Database Exercise 1 : Task A________________ 
-- 		Create a script that will add an attribute of type Weight and with a value
-- 		set to Thin to all employees. If an employee already has a Weight
-- 		attribute, update that attribute, otherwise create a new one

USE dbo;

CALL company_extreme_diet();


-- __________________________________ Procedures Implementation_______________________________________

-- PROCEDURE: company_extreme_diet: looping for every employee and separete the cases for employee record: 
--                                  1.attribute value Thin   
--                                  2.attribute name Weight but not Thin
--                                  3.attribute name Height
--                                  4.no attribute
--                                 Handle every case with right calls to procedures.                                
DELIMITER //
DROP PROCEDURE  IF EXISTS company_extreme_diet;
CREATE PROCEDURE  company_extreme_diet()
BEGIN
   DECLARE emp_id CHAR(36);
   DECLARE total_number_employees INT;
   DECLARE employee_row_number INT;
   DECLARE employee_name CHAR(10);

   SET employee_row_number = 0;
   SET total_number_employees =  (SELECT COUNT(*) FROM employee);

    looping_employees: 
    While  NOT total_number_employees = employee_row_number DO
		
        SET emp_id = (SELECT employee.EMP_ID FROM employee LIMIT employee_row_number, 1);
		SET employee_name = (SELECT employee.EMP_Name FROM employee WHERE employee.EMP_ID=emp_id);
     
		-- If employee has attribute record
		IF  EXISTS (SELECT * FROM employeeattribute WHERE employeeattribute.EMPATTR_EmployeeID = emp_id) THEN

			-- If employee has attribute with value Thin, we do nothing
			IF EXISTS ( SELECT * FROM attribute where attribute.ATTR_ID in (SELECT employeeattribute.EMPATTR_AttributeID FROM employeeattribute
						   WHERE employeeattribute.EMPATTR_EmployeeID=emp_id AND attribute.ATTR_Value="Thin")) THEN
                           
				ITERATE  looping_employees;
                           
			-- If employee has attribute with name Weight,  we update the Value to Thin      
			ELSEIF EXISTS (  SELECT * FROM attribute where attribute.ATTR_ID in (SELECT employeeattribute.EMPATTR_AttributeID FROM employeeattribute 
								WHERE employeeattribute.EMPATTR_EmployeeID=emp_id AND attribute.ATTR_Name="Weight")) THEN 
               
                    CALL update_attribute(emp_id);
                   
			-- If employee has attribute with name Height, we insert the new attribute    
			ELSE 
            
				   CALL insert_new_attribute(emp_id);
               
			END IF;
              
		-- Employee hasn't attribute record    
 		ELSE
        
		  --  So, we insert the new attribute
		  -- SELECT concat(employee_name, ' DIET, DIET, DIET!') AS ''; 
			CALL insert_new_attribute(EMP_ID);
		END IF;
    
        SET employee_row_number = employee_row_number + 1;
    END 
    WHILE looping_employees;

END; //
DELIMITER ;


-- PROCEDURE: insert_new_attribute: inserting 2 new rows, 1 on the table attribute, and the other on table employeeattribute
DELIMITER //
DROP PROCEDURE  IF EXISTS insert_new_attribute;
CREATE PROCEDURE insert_new_attribute(IN emp_id Char(36))
BEGIN
	DECLARE new__atrribute_id Char(36);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SHOW ERRORS; 
        ROLLBACK;   
    END; 

	START TRANSACTION;
		SET new__atrribute_id = upper(UUID());
		
        INSERT INTO  Attribute values (new__atrribute_id, 'Weight', 'Thin');
		INSERT INTO EmployeeAttribute values (emp_id, new__atrribute_id );
         SELECT 'A new attribute (Weight, Thin) has been inserted for the employee: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=emp_id;
         
     COMMIT;
END//
DELIMITER ;

-- PROCEDURE: update_attribute: update table attribute, value to Thin
DELIMITER //
DROP PROCEDURE  IF EXISTS update_attribute;
CREATE PROCEDURE update_attribute(IN emp_id Char(36))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SHOW ERRORS; 
        ROLLBACK;   
    END; 
	START TRANSACTION;
		
		UPDATE Attribute SET Attribute.ATTR_Value='Thin' WHERE Attribute.ATTR_ID=emp_id;
		SELECT 'The attribute Weight has been updated to Thin for the employee: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=emp_id;
        
    COMMIT;
END//
DELIMITER ;


-- _____________________________ END ___________________________________