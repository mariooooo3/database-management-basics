CREATE TABLE DEPARTAMENTELE(
    id_dept INT,
    nume VARCHAR(25));

INSERT INTO DEPARTAMENTELE(id_dept, nume)
VALUES(1, 'Productie'),
      (2,'Vanzari'),
      (3, 'Contabilitate');

DESCRIBE DEPARTAMENTELE;

CREATE TABLE angajati(
    id_ang INT,
    nume VARCHAR(20),
    prenume VARCHAR(15),
    id_dept INT);

INSERT INTO angajati
VALUES
    (1, 'Claudiu', 'Claudiu',2),
    (2, 'Mario', 'Mario', 3),
    (3, 'Marian', 'Marian', 1),
    (4, 'Corina', 'Corina', 1);

DELETE FROM DEPARTAMENTELE
WHERE id_dept > 1;

DELETE FROM angajati
WHERE id_dept = 1;

TRUNCATE angajati;

DROP TABLE angajati;

DROP TABLE DEPARTAMENTELE;