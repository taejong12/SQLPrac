/*
GROUP BY절의 기본 사용법

    SELECT 조회할 열1 이름, 열2 이름, ...,열N 이름
    FROM 조회할 테이블 이름
    WHERE 조회할 행을 선별하는 조건식
    GROUP BY 그룹화할 열을 지정(여러 개 지정 가능)
    ORDER BY 정렬하려는 열 지정
*/

SELECT AVG(COMM),DEPTNO
FROM EMP
GROUP BY DEPTNO;

/*
HAVING절의 기본 사용법
    SELECT 조회할 열1 이름, 열2 이름,...,열N 이름
    FROM 조회할 테이블 이름
    WHERE 조회할 행을 선별하는 조건식
    GROUP BY 그룹화할 열 지정(여러 개 지정 가능)
    HAVING 출력 그룹을 제한하는 조건식
    ORDER BY 정렬하려는 열 지정
*/

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL)>=500
ORDER BY DEPTNO, JOB;


