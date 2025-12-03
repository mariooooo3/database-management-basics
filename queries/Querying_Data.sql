SELECT ename, job, sal AS 'SALARY'
FROM emp;

SELECT empno, ename,sal, sal * 12 AS 'Anual Salary'
FROM emp;

DESCRIBE dept;

DESCRIBE emp;

SELECT empno, ename, job, hiredate
FROM emp;

SELECT empno AS 'EMP#', ename AS 'Employee',
       job AS 'Job', hiredate AS 'HireDate'
FROM emp;

SELECT DISTINCT job
FROM emp;

SELECT CONCAT(ename, ', ', job) AS 'Employee and Title'
FROM emp;

SELECT DISTINCT CONCAT(empno, ', ', ename, ', ',job,
              ', ',hiredate, ', ',sal,', ',deptno)
FROM emp;