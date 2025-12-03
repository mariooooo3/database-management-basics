CREATE TABLE departamenteeeeee(
    loc VARCHAR(20),
    ID INT,
    dname VARCHAR(20) NOT NULL,
    deptno INT UNIQUE,
    CONSTRAINT deparatment_id_pk PRIMARY KEY (ID)
);

CREATE TABLE anagajatiiiiiiiiiii(
    sal INT NOT NULL,
    empno INT UNIQUE,
    CONSTRAINT angajati_empno_pk PRIMARY KEY (empno),
    mgr INT,
    deptno_fk INT,
    ename VARCHAR(30)
);

ALTER TABLE anagajatiiiiiiiiiii
ADD CONSTRAINT check_angajati_ck CHECK ( sal BETWEEN 500 AND 5000);

ALTER TABLE departamenteeeeee
ADD CONSTRAINT check_dep_ck CHECK ( loc <> '' );

ALTER TABLE anagajatiiiiiiiiiii
ADD CONSTRAINT foreign_key_angajati FOREIGN KEY(mgr)
REFERENCES anagajatiiiiiiiiiii(empno);

ALTER TABLE anagajatiiiiiiiiiii
ADD CONSTRAINT fk_angajati_dep FOREIGN KEY(deptno_fk)
REFERENCES departamenteeeeee(ID);

INSERT INTO departamenteeeeee(loc, ID, dname, deptno)
VALUES ('Iasi', 10, 'IT', 100),
       ('Bucuresti', 20, 'Vanzari', 200);

INSERT INTO anagajatiiiiiiiiiii(sal, empno, mgr, deptno_fk, ename)
VALUES (3000, 3, NULL, 10, 'King');

INSERT INTO anagajatiiiiiiiiiii(sal, empno, mgr, deptno_fk, ename)
VALUES (2000, 1, 3, 20, 'Marius'),
       (3000, 2, 1, 10, 'Eric');

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'anagajatiiiiiiiiiii';

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'departamenteeeeee';

ALTER TABLE departamenteeeeee
DROP CONSTRAINT check_dep_ck;

ALTER TABLE anagajatiiiiiiiiiii
DROP CONSTRAINT check_angajati_ck;