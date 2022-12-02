CREATE DEFINER=`root`@`localhost` PROCEDURE `create_service2`(IN newDateTime DATETIME, IN newTheme VARCHAR(50), IN newSongleader VARCHAR(50), IN initServiceID int, OUT success INT)
BEGIN
	DECLARE next_id INTEGER;
    DECLARE personid INTEGER;
    
    # Default values
    SELECT person.Person_ID INTO personid FROM person WHERE CONCAT(person.First_Name, ' ' , person.Last_Name) = newSongleader;
	SELECT MAX(Service_ID) + 1 INTO next_id FROM service;
    
    # Check service time
    IF newDateTime IN (SELECT Svc_DateTime FROM service) THEN 
		SET success = 0; # Error
    ELSE 
		INSERT INTO service (Service_ID, Svc_DateTime, Theme_Event)
		VALUES (next_id, newDateTime, newTheme);
        
        INSERT INTO fills_role (Service_ID, Person_ID, Role_Type, Confirmed)
        VALUES (next_id, personid, 'S', 'Y');
        
        SET success = 1; # Success
    END IF;
END