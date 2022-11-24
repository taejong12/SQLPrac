/*
JOIN
데이터와 데이터를 연결해주는
데이터 전체를 짝을 지어준다
그 중에 조건절에 해당하는 애들만 나온다
ON
*/
--CARTESIAN PRODUCT 카디션 곱 상호조인
SELECT *
FROM EMP A
CROSS JOIN DEPT B;

--INNER JOIN은 공통부분 교집합
SELECT *
FROM EMP A
INNER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO;

SELECT A.EMPNO, A.ENAME, B.DNAME
FROM EMP A
INNER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO;

SELECT A.EMPNO, A.ENAME, A.JOB, B.DNAME
FROM EMP A
INNER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO
WHERE A.JOB='CLERK';

SELECT A.EMPNO, A.ENAME, A.JOB, B.DNAME
FROM EMP A
    ,DEPT B
WHERE A.DEPTNO=B.DEPTNO
    AND A.JOB='CLERK';

--FULL OUTER JOIN 전체
SELECT A.EMPNO
    ,A.ENAME
    ,A.DEPTNO
    ,B.DNAME
FROM EMP A
FULL OUTER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO;

SELECT A.*,B.*
FROM EMP A
FULL OUTER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO;
    
--LEFT OUTER JOIN
SELECT A.*,B.*
FROM EMP A
LEFT OUTER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO;
    
--RIGHT OUTER JOIN
SELECT A.*,B.*
FROM EMP A
RIGHT OUTER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO;
    
--빠져도 상관없는 쪽에 (+)(빠진다)
SELECT A.*,B.*
FROM EMP A
    ,DEPT B
WHERE A.DEPTNO=B.DEPTNO(+);

SELECT A.*,B.*
FROM EMP A
    ,DEPT B
WHERE A.DEPTNO(+)=B.DEPTNO;

SELECT A.*,B.*
FROM EMP A
LEFT OUTER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO
WHERE A.DEPTNO IS NULL;

SELECT A.*,B.*
FROM EMP A
RIGHT OUTER JOIN DEPT B
    ON A.DEPTNO=B.DEPTNO
WHERE A.EMPNO IS NULL;

--SELF JOIN
SELECT A.EMPNO ,A.ENAME, A.JOB ,A.MGR
    ,B.EMPNO ,B.ENAME ,B.JOB
FROM EMP A
INNER JOIN EMP B
    ON A.MGR=B.EMPNO;
    
SELECT A.EMPNO ,A.ENAME, A.JOB ,A.MGR
    ,B.EMPNO ,B.ENAME ,B.JOB
FROM EMP A
    ,EMP B
WHERE A.MGR=B.EMPNO;

SELECT A.EMPNO ,A.ENAME, A.JOB ,A.MGR
    ,C.DEPTNO, C.DNAME  
    ,B.EMPNO ,B.ENAME ,B.JOB
FROM EMP A
    ,EMP B
    ,DEPT C
WHERE A.MGR=B.EMPNO
AND A.DEPTNO=C.DEPTNO
ORDER BY C.DEPTNO;

/*
    SUB QUERY 서브쿼리
    SELECT 절/ FROM 절/ WHERE 절
    [SELECT, FROM, WHERE]
*/

--SCALAR SUBQUERY
--반드시 단일 횡이거나 한개의 형태로 들어온다
--결과가 반드시 단일 행이거나 단일 값이거나

SELECT E.ENAME
    ,(SELECT D.DNAME
        FROM DEPT D
        WHERE D.DEPTNO=E.DEPTNO)AS DEPTNAME
FROM EMP E
WHERE E.JOB='MANAGER';

--INLINE VIEWS
--결과가 반드시 하나의 테이블로 리턴
SELECT EMP_NAME, SALARY
FROM(SELECT E.ENAME AS EMP_NAME
        ,E.SAL AS SALARY
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    AND D.DNAME='SALES')
WHERE SALARY BETWEEN 1000 AND 2000;

--NESTED SUBQUERY
--단일행 다수의 행 둘다 가능
SELECT *
FROM DEPT D
WHERE D.DEPTNO IN (SELECT E.DEPTNO FROM EMP E WHERE E.SAL>3000);

SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT AVG(SAL) FROM EMP);

--IN은 하나만 맞으면 되지만 ALL은 다 맞아야 한다
SELECT ENAME, SAL
FROM EMP
WHERE SAL>ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO=30);
                
SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY(SELECT SAL
                FROM EMP
                WHERE DEPTNO=30);         

