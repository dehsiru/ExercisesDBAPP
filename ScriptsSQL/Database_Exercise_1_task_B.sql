-- 		___________________Database Exercise 1 : Task B________________ 
-- Create a script that will add an attribute of type 'Height' and with a value set
-- to 'Short' to all employees that are supervisors of anybody else. If an
-- employee already has a 'Height' attribute, update that attribute, otherwise
-- create a new one.

USE dbo;

CALL get_taller_supervisors();





-- __________________________________ Procedures Implementation_______________________________________

                 
DELIMITER //
DROP PROCEDURE  IF EXISTS get_taller_supervisors;
CREATE PROCEDURE  get_taller_supervisors()
BEGIN
   DECLARE supervisor_id CHAR(36);
   DECLARE total_number_supervisors INT;
   DECLARE supervisor_row_number INT;
   DECLARE supervisor_name CHAR(10);

   SET supervisor_row_number = 0;
   SET total_number_supervisors=  (select count(distinct emp1.emp_id) from employee emp1 inner join employee emp2 on emp1.emp_id=emp2.EMP_Supervisor);
	
    
    looping_supervisors: 
    WHILE NOT total_number_supervisors = supervisor_row_number DO
    
		SET supervisor_id = (select distinct emp1.emp_id from employee emp1 inner join employee emp2 on emp1.emp_id=emp2.EMP_Supervisor LIMIT supervisor_row_number, 1);
		SET supervisor_name = (SELECT employee.EMP_Name FROM employee WHERE employee.EMP_ID=supervisor_id);
    
        
        -- If supervisor has got attribute record
		IF  EXISTS ( SELECT * FROM employeeattribute WHERE employeeattribute.EMPATTR_EmployeeID = supervisor_id) THEN

			-- If supervisor has got attribute with value Short, we do nothing
			IF EXISTS ( SELECT * FROM attribute where attribute.ATTR_ID in (SELECT employeeattribute.EMPATTR_AttributeID FROM employeeattribute
						   WHERE employeeattribute.EMPATTR_EmployeeID=supervisor_id AND attribute.ATTR_Value="Short")) THEN
				
				-- ITERATE  looping_supervisors;
                 SELECT 'This supervisor has Short value: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=supervisor_id;
                
			-- If supervisor has got attribute with name Height,  we update the value to Short
			ELSEIF EXISTS ( SELECT * FROM attribute where attribute.ATTR_ID in (SELECT employeeattribute.EMPATTR_AttributeID FROM employeeattribute 
								WHERE employeeattribute.EMPATTR_EmployeeID=supervisor_id AND attribute.ATTR_Name="Height")) THEN 
               
                    CALL update_height_attribute(supervisor_id);
                    -- SELECT 'This supervisor has Height, we update: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=supervisor_id;
                   
			-- If supervisor hasn't got attribute with name Height, we insert the new attribute    
			ELSE
            
				   CALL insert_new_short_attribute(supervisor_id);
                   -- SELECT 'This supervisor hasnot Height, we insert: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=supervisor_id;
               
			END IF;
              
		-- Supervisor hasn't got attribute record    
 		ELSE
        
		  --  So, we insert the new attribute
		--  SELECT 'This supervisor hasnot got attribute at all, so we insert: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=supervisor_id;
		   CALL insert_new_short_attribute(supervisor_id);
		END IF;
    
		SET supervisor_row_number = supervisor_row_number + 1;
	END 
    WHILE looping_supervisors;

END; //
DELIMITER ;


-- PROCEDURE: insert_new_short_attribute: inserting 2 new rows for attribute with value short, 1 on the table attribute, and the other on table employeeattribute
DELIMITER //
DROP PROCEDURE  IF EXISTS insert_new_short_attribute;
CREATE PROCEDURE insert_new_short_attribute(IN supervisor_id Char(36))
BEGIN
	DECLARE new__atrribute_id Char(36);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SHOW ERRORS; 
        ROLLBACK;   
    END; 

	START TRANSACTION;
		SET new__atrribute_id = upper(UUID());
		INSERT INTO Attribute values (new__atrribute_id, 'Height', 'Short');
		INSERT INTO EmployeeAttribute values (supervisor_id, new__atrribute_id );
		SELECT 'A new attribute (Height, Short) has been inserted for the supervisor: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=supervisor_id;
         
     COMMIT;
END//
DELIMITER ;

-- PROCEDURE: update_height_attribute: update table attribute value to Short
DELIMITER //
DROP PROCEDURE  IF EXISTS update_height_attribute;
CREATE PROCEDURE update_height_attribute(IN supervisor_id Char(36))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SHOW ERRORS; 
        ROLLBACK;   
    END; 
	START TRANSACTION;
		
		UPDATE Attribute SET Attribute.ATTR_Value='Short' WHERE Attribute.ATTR_ID=supervisor_id;
		SELECT 'The attribute Height has been updated to Short for the supervisor: ' as '', employee.EMP_Name FROM employee where employee.EMP_ID=supervisor_id;
        
    COMMIT;
END//
DELIMITER ;



-- _____________________________ END ___________________________________