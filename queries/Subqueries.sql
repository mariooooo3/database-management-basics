SELECT ename, hiredate
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE ename = 'Blake')
AND ename <> 'BLAKE';

SELECT ename, job, emp.deptno
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE dept.loc = (SELECT loc
                  FROM dept
                  WHERE loc = 'DALLAS');

SELECT ename, sal
FROM emp
WHERE mgr = ALL (SELECT empno
                 FROM emp
                 WHERE ename = 'King');

SELECT emp.deptno, ename, job
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE dname = (SELECT dname
               FROM dept
               WHERE dname = 'SALES');

SELECT ename, hiredate, sal
FROM emp
WHERE sal = ALL (SELECT sal
             FROM emp
             WHERE ename = 'Scott')
AND comm = ALL (SELECT comm
            FROM emp
            WHERE ename = 'Scott');

SELECT ename, sal, dept.dname
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE (sal, comm) = ANY (SELECT sal, comm
                        FROM emp
                        INNER JOIN dept
                        ON emp.deptno = dept.deptno
                        WHERE loc = 'Dallas');

SELECT ename
FROM emp
WHERE sal > ALL (SELECT sal
                 FROM emp
                 WHERE job = 'CLERK')
ORDER BY sal DESC;

SELECT emp.empno, emp.ename
FROM emp
WHERE deptno = ANY (SELECT deptno
                FROM emp
                WHERE ename LIKE '%T%');

CREATE TABLE employee2
SELECT empno AS 'id', ename AS 'last_name',
       sal AS 'sal', emp.deptno AS 'dept_id'
FROM emp
WHERE deptno = 20;

DESCRIBE employee2;

INSERT INTO employee2 (id,last_name,sal,dept_id)
SELECT emp.empno, emp.ename, sal, emp.deptno
FROM emp
WHERE sal > 2300
AND ename LIKE '_O%';

SELECT dept.deptno, dname, emp.sal, emp.ename
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE (emp.deptno, emp.sal) = ANY (SELECT deptno, sal
                                FROM emp
                                WHERE comm IS NOT NULL);
