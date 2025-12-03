SELECT ename, sal
FROm emp
WHERE sal NOT BETWEEN 1500 AND 2850;

SELECT dname
FROM dept
WHERE loc = 'New York';

SELECT dname
FROM dept
WHERE loc IN('New York');

SELECT ename, sal
FROM emp
WHERE sal > 1500 AND deptno IN(10, 30);

SELECT ename, deptno
FROM emp
WHERE deptno IN(10, 30)
ORDER BY ename ASC;

SELECT ename, job
FROM emp
WHERE mgr IS NULL;

SELECT ename, sal, comm
FROM emp
WHERE comm IS NOT NULL
ORDER BY sal AND comm DESC;

SELECT ename
FROm emp
WHERE ename LIKE '%LL%' AND (deptno = 10 OR mgr = 7566);

SELECT ename, sal, comm
FROM emp
WHERE comm > sal + sal*10/100;

SELECT ename, job, sal
FROM emp
WHERE job IN('Clerk', 'Analyst') AND sal NOT IN(1000, 3000, 5000);

SELECT ename, job, hiredate
FROM emp
WHERE hiredate BETWEEN '1981-02-10' AND '1981-05-01';

SELECT ename, sal AS 'New sal'
FROM emp
WHERE (sal + sal *25/100) > 3000;