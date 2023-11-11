USE tvondemand
DROP PROCEDURE IF EXISTS getActorFirstLastName;
DELIMITER $$
CREATE PROCEDURE getActorFirstLastName(name VARCHAR(45))
BEGIN
 DECLARE actorsnumber INT;
    SELECT COUNT(actor.actor_id) INTO actorsnumber
    FROM actor
    WHERE actor.last_name = name;
    
    IF(actorsnumber > 1)
    THEN
      SELECT actorsnumber;
	END IF;
    
	SELECT actor.first_name, actor.last_name
    FROM actor
    WHERE actor.last_name = name
    ORDER BY actor.first_name;
END$$
DELIMITER ;

CALL getActorFirstLastName('Ali')