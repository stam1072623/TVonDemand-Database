USE tvondemand;
DROP PROCEDURE IF EXISTS getActorBetween;
DELIMITER $$
PROCEDURE getActorBetween(name1 VARCHAR(45), name2 VARCHAR(45))
BEGIN

	SELECT COUNT(*)
    FROM actor
    WHERE actor.last_name BETWEEN name1 AND name2
    ORDER BY actor.last_name;

	SELECT actor.first_name, actor.last_name
    FROM actor
    WHERE actor.last_name BETWEEN name1 AND name2
    ORDER BY actor.last_name;

END$$
DELIMITER ;

call getActorBetween('ALa','Alu');
