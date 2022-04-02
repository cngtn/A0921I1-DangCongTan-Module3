use demo;
DELIMITER $$

CREATE PROCEDURE show_list_user()

BEGIN

    SELECT users.id, users.name, users.email, users.country

    FROM users;

    END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE update_user (IN id INT, name VARCHAR(50), email VARCHAR(50), country VARCHAR(50))

BEGIN

    UPDATE users SET users.name = name, users.email = email , users.country = country
    
    WHERE users.id = id;

    END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE delete_user(IN id INT)

BEGIN

    DELETE FROM users
    
    WHERE users.id = id;
    
END$$

DELIMITER ;


CALL delete_user(11);