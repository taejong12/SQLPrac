--q1
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE ENAME LIKE '%S';

--Q2
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=30
    AND JOB='SALESMAN';
    
--Q3
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(20,30)
    AND SAL>2000;
    
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=20
    AND SAL>2000
   UNION
    SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=30
    AND SAL>2000;
    
    --Q4
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE SAL<2000 OR SAL>3000;

--Q5
SELECT ENAME,EMPNO,SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%'
    AND DEPTNO=30
    AND SAL NOT BETWEEN 1000 AND 2000;
    
--Q6
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE COMM IS NULL
    AND MGR IS NOT NULL
    AND JOB IN('MANAGER','CLERK')
    AND ENAME NOT LIKE '_L%';
    
--Q1
SELECT EMPNO
    ,RPAD(SUBSTR(EMPNO,1,2),LENGTH(EMPNO),'*') MASKING_EMPNO
    , ENAME
    ,RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME)>=5
    AND LENGTH(ENAME)<6;
    
--Q2
SELECT EMPNO, ENAME, SAL
    , TRUNC(SAL/21.5,2) DAY_PAY
    , ROUND(SAL/21.5/8,1) TIME_PAY
FROM EMP;

--Q3
SELECT EMPNO, ENAME
    , TO_CHAR(HIREDATE,'YYYY/MM/DD') HIREDATE
    , TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3),'������'),'YYYY-MM-DD') R_JOB
    , NVL(TO_CHAR(COMM),'N/A') COMM
FROM EMP;

--Q4
SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR),' ') MGR
    ,CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR,1,2)=75 THEN '5555'
        WHEN SUBSTR(MGR,1,2)=76 THEN '6666'
        WHEN SUBSTR(MGR,1,2)=77 THEN '7777'
        WHEN SUBSTR(MGR,1,2)=78 THEN '8888'
        ELSE TO_CHAR(MGR)
        END AS CHG_MGR
FROM EMP
;

--Q1
SELECT DEPTNO
    ,TRUNC(AVG(SAL)) AVG_SAL
    ,MAX(SAL) MAX_SAL
    ,MIN(SAL) MIN_SAL
    ,COUNT(*) CNT
FROM EMP
GROUP BY DEPTNO;

--Q2
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB)>=3;

--Q3
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR
    , DEPTNO
    , COUNT(*) CNT
FROM EMP
WHERE DEPTNO IS NOT NULL
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

--Q4
SELECT NVL2(COMM,'O','X') EXIST_COMM, COUNT(*) CNT
FROM EMP
GROUP BY NVL2(COMM,'O','X') ;

--Q5
SELECT DEPTNO
    ,TO_CHAR(HIREDATE,'YYYY') HIRE_YEAR
    ,COUNT(*) CNT
    ,MAX(SAL) MAX_SAL
    ,SUM(SAL) SUM_SAL
    ,AVG(SAL) AVG_SAL
FROM EMP
WHERE DEPTNO IS NOT NULL
GROUP BY DEPTNO
    ,TO_CHAR(HIREDATE,'YYYY');

--Q1
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
    AND SAL>2000
    ORDER BY DEPTNO, SAL
;





