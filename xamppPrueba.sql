
/*crear tabla*/


CREATE TABLE flights ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
origin VARCHAR(255) NOT NULL, 
destination VARCHAR(255) NOT NULL, 
duration INT NOT NULL 
)


/*ingresando datos en la tabla*/


INSERT INTO flights(origin,destination,duration)values("New York","London",415);
INSERT INTO flights(origin,destination,duration)values("Shanghai","Paris",760);
INSERT INTO flights(origin,destination,duration)values("Panama","Costa Rica",200);
INSERT INTO flights(origin,destination,duration)values("Mexico","Argentina",600);
INSERT INTO flights(origin,destination,duration)values("Instanbul","Tokyo",700);
INSERT INTO flights(origin,destination,duration)values("New York","Paris",435);
INSERT INTO flights(origin,destination,duration)values("Moscou","Paris",245);
INSERT INTO flights(origin,destination,duration)values("Lima","New York",435);


/*Mostrando*/


SELECT * from flights WHERE origin = “New York”

SELECT id AS ‘Transaccion’ from flights WHERE origin = “New York”

SELECT AVG(duration) FROM flights;

SELECT COUNT(*) FROM flights;

SELECT MIN(duration) FROM flights;

SELECT * FROM flights WHERE origin like ‘%a%’


/*Actualizar*/


UPDATE flights SET destination = "Panama" WHERE id = 3
UPDATE flights SET duration = 500 WHERE destination = 'Paris' AND origin = 'New York'

/*Borrar todo*/


DELETE FROM `flights` WHERE destination = 'Tokyo'


/*Volví a crear la tabla por borrado del campo*/


SELECT origin, COUNT(*) FROM flights GROUP BY origin
SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1


/*se crea tabla nueva*/


CREATE TABLE passenger ( 

	id INT AUTO_INCREMENT PRIMARY KEY, 

	name VARCHAR(255) NOT NULL, 

	flights_id INT NOT NULL, 

	FOREIGN KEY (flights_id) REFERENCES flights(id) 

)


/*Insertamos datos en la tabla*/


INSERT INTO passenger(name, flights_id)values("Alice",1);

INSERT INTO passenger(name, flights_id)values("Bob",1);

INSERT INTO passenger(name, flights_id)values("Charlie",2);

INSERT INTO passenger(name, flights_id)values("Dave",2);

INSERT INTO passenger(name, flights_id)values("Erin",4);

INSERT INTO passenger(name, flights_id)values("Frank",6);

INSERT INTO passenger(name, flights_id)values("Grace",6);


/*Mostrar con JOIN*/


SELECT origin, destination, name FROM flights JOIN passenger ON passenger.flights_id = flights.id
SELECT origin, destination, name FROM flights JOIN passenger ON passenger.flights_id = flights.id WHERE name = "Alice"

SELECT origin, destination, name FROM flights LEFT JOIN passenger ON passenger.flights_id = flights.id
SELECT origin, destination, name FROM flights RIGHT JOIN passenger ON passenger.flights_id = flights.id

