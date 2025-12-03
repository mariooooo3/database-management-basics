SELECT COUNT(DISTINCT mgr) AS 'Numar Manageri'
FROM emp;

SELECT MAX(sal) - MIN(sal) AS 'Diferenta'
FROM emp;

SELECT DISTINCT mgr, MIN(sal) AS 'sal_min'
FROM emp
WHERE mgr IS NOT NULL
GROUP BY mgr
HAVING MIN(sal) > 1000
ORDER BY sal_min DESC;

SELECT dname AS 'Nume departament',loc AS 'Locatie',
       COUNT(emp.empno) AS 'Numar persoane', AVG(sal) AS 'sal_med'
FROM dept
INNER JOIN emp
ON dept.deptno = emp.deptno
GROUP BY dname, loc;

SELECT COUNT(emp.deptno)
FROM emp
WHERE deptno = (SELECT emp.deptno
             FROM emp
             WHERE ename = 'BLAKE')
AND ename <> 'BLAKE';

SELECT emp.empno, emp.ename, emp.sal
FROM emp
WHERE sal > (SELECT AVG(sal)
             FROM emp)
ORDER BY sal ASC;

SELECT dept.deptno, dname, COUNT(emp.empno)
FROM emp
INNER JOIN  dept
ON emp.deptno = dept.deptno
WHERE ename LIKE '%A%'
GROUP BY emp.deptno;

SELECT e.mgr, AVG(e.sal) AS 'SAL med'
FROM emp e
WHERE mgr IS NOT NULL
GROUP BY e.mgr
HAVING COUNT(e.empno) >= 2
ORDER BY e.mgr;

SELECT dept.deptno, dname, ename, emp.job
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE sal > (SELECT AVG(e1.sal)
             FROM emp e1
             INNER JOIN dept d1
             ON e1.deptno = d1.deptno
             WHERE d1.dname = 'SALES');

SELECT ename, AVG(sal)
FROM emp
WHERE sal > (SELECT AVG(sal)
             FROm emp)
AND deptno = ANY (SELECT deptno
                  FROM emp
                  WHERE ename LIKE '%T%');

SELECT e.ename,
       e.sal,
       (SELECT AVG(sal) FROM emp e_sub WHERE e_sub.deptno = e.deptno) AS "Medie Departament" -- Subinterogare CORELATA
FROM emp e
WHERE e.sal > (SELECT AVG(sal) FROM emp) -- Conditia 1: Salariu peste media companiei
  AND e.deptno IN (SELECT deptno -- Conditia 2: Este in departamentul cu angajati care contin 'T'
                   FROM emp
                   WHERE ename LIKE '%T%');