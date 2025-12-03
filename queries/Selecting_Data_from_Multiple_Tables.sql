SELECT emp.ename, emp.empno, dept.dname
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno;

SELECT DISTINCT emp.job
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE dname = 'SALES';

SELECT emp.ename, dept.dname, dept.loc
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE emp.comm IS NOT NULL;

SELECT emp.ename, dept.dname
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE emp.ename LIKE 'A%';

SELECT emp.ename, emp.job, dept.deptno, dept.dname
FROM emp
INNER JOIN dept
ON emp.deptno = dept.deptno
WHERE dept.loc = 'Dallas';

SELECT emp.ename AS 'Emplooyee', emp.empno AS 'Emp#',
       man.ename AS 'Manager', man.empno AS 'Mgr#'
FROM emp
INNER JOIN emp man
ON emp.mgr = man.empno;

SELECT emp.ename AS 'Emplooyee', emp.empno AS 'Emp#',
       man.ename AS 'Manager', man.empno AS 'Mgr#'
FROM emp
LEFT JOIN emp man
ON emp.mgr = man.empno;

SELECT e1.ename AS 'ANGAJAT', e1.deptno AS 'DEPARTAMENT', e2.ename AS 'COLEG'
FROM emp e1
INNER JOIN emp e2
ON e1.deptno = e2.deptno
AND e1.ename <> e2.ename
ORDER BY e1.deptno ASC, e1.ename ASC ;

DESCRIBE salgrade;

SELECT emp.ename, emp.deptno, emp.sal, salgrade.grade
FROM emp
INNER JOIN salgrade
ON emp.sal BETWEEN salgrade.losal and salgrade.hisal

SELECT emp.ename, emp.hiredate
FROM emp
INNER JOIN emp e2
ON emp.hiredate > e2.hiredate AND e2.ename = 'Blake';

SELECT emp.ename AS 'Employee', emp.hiredate AS 'Emp Hiredate',
       e1.ename AS 'Manager', e1.hiredate AS 'Mgr Hiredate'
FROM emp
INNER JOIN emp e1
ON emp.mgr = e1.empno AND emp.hiredate > e1.hiredate;


