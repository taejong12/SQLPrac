/*
    집합연산자
    1. UNION 합집합
    2. UNION ALL 중복허용
    3. INTERSECT 교집합
    4. MINUS 차집합
    
    SELECT column_name(s)
    FROM table_name
    WHERE column_name BETWEEN value1 AND value2;

    DML
    SELECT 데이터 조회
    INSERT 데이터 삽입
    UPDATE 데이터 수정
    DELETE 데이터 삭제
    
    UPDATE
    
    UPDATE TB
    SET COL=VAL...
    WHERE CON;
    
    INSERT
    
    INSERT INTO TB(COL...)
    VALUES(VAL...)
    
    DLELTE
    
    DELETE FROM TB WHERE CON;
    
    GROUP BY
    
    SELECT COLS (COUNT MAX MIN SUM AVG)
    FROM TB
    WHERE CONDITION
    GROUP BY COLS
    
    SELECT COLS
    FROM TB
    WHERE CON
    GROUP BY COLS
    HAVING CON
    ORDER BY COLS
    
    제작하는 회사를 벤더
    
    WITH
    WITH
    별칭 AS SELECT....
    
    SELECT
    FROM 별칭
    
    DDL
    CREATE 데이터베이스, 테이블 등을 생성
    ALTER 테이블을 수정
    DROP 데이터베이스, 테이블을 삭제
    TRUNCATE 테이블을 초기화
    
    CREATE
    
    CREATE TABLE TB
    (COL DATATUPE 기본값(생략가능) NULL(생략가능));
    
    CREATE(복사)
    
    CREATE TABLE 새로운테이블명
    AS SELECT * FROM 복사할테이블명;
    
    ALTER
    1.테이블 컬럼 추가하기
    ALTER TABLE 테이블명
    ADD(컬럼명 데이터타입(사이즈));
    
    2. 테이블 컬럼 수정하기
    ALTER TABLE 테이블명
    MODIFY(컬럼명 데이터타입(사이즈));
    
    3. 테이블 컬럼 삭제하기
    ALTER TABLE 테이블명
    DROP COLUMN 컬럼명
    
    4. 테이블 컬럼 이름 변경하기
    ALTER TABLE 테이블명
    RENAME COLUMN 원래컬럼명 TO 바꿀컬럼명;
    
    DROP
    
    DROP TABLE 테이블명;
    DROP CONSTRAINT 제약조건 이름;
    
    TRUNCATE
    
    TRUNCATE TABLE 테이블명;
    
    제약조건(CONSTRAINT)
    1. NOT NULL
    2. UNIQUE
    3. PRIMARY KEY
    4. FOREIGN KEY
    5. DEFAULT
    6. CHECK
    
    1. NOT NULL - NOT NULL을 사용하게 되면 인서트시 꼭 데이터값이 들어가야만 합니다.
    테이블 생성시 제약조건 추가법
    -CREATE TABLE 테이블명(
    컬럼명 데이터타입() NOT NULL);
    
    생성 후 NOT NULL 제약조건 추가법
    -ALTER TABLE 테이블명 MODIFY 컬럼명 NOT NULL;
    
    2. UNIQUE - 고유값(중복X)
    
    -CREATE TABLE 테이블명(
    컬럼명 데이터타입() UNIQUE);
    -CREATE TABLE 테이블명(
    컬럼명 데이터타입() CONSTRAINT 제약조건명 UNIQUE(컬럼명));
    
    DCL
    GRANT 특정 데이터베이스 사용자에게 특정 작업에 대한 수행 권한을 부여
    REEVOKE 특정 데이터베이스 사용자에게 특정 작업에 대한 수행 권한을 박탈, 회수
    COMMOT 트랜잭션의 작업을 저장
    ROLLBACK 트랜잭션의 작업을 취소, 원래대로 복구
    
*/

--P125 5장 Q1
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO 
FROM EMP
WHERE ENAME LIKE '%S';

--Q5-2
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=30
    AND JOB='SALESMAN';
    
--Q5-3
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(20, 30)
    AND SAL>2000;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=20
    AND SAL>2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO =30
    AND SAL>2000;

--Q5-4
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE SAL<2000 
    OR SAL>3000;

--Q5-5
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE DEPTNO=30
    AND SAL NOT BETWEEN 1000 AND 2000;

--Q5-6
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
WHERE COMM IS NULL
    AND MGR IS NOT NULL
    AND JOB IN('MANAGER','CLERK')
    AND ENAME NOT LIKE '_L%';

--Q6-1
SELECT EMPNO
    ,RPAD(SUBSTR(EMPNO,1,2),LENGTH(EMPNO),'*') AS MASKING_EMPNO
    ,ENAME
    ,RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME)>=5
    AND LENGTH(ENAME)<6;

--Q6-2
SELECT EMPNO, ENAME, SAL
    ,TRUNC(SAL/21.5,2) AS DAY_PAY
    ,ROUND(SAL/21.5/8,1) AS TIME_PAY
FROM EMP;

--Q6-3
SELECT EMPNO, ENAME
    , TO_CHAR(HIREDATE,'YYYY/MM/DD')
    , TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD') AS R_JOB
    , NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM EMP;

--Q6-4
SELECT EMPNO, ENAME
    , NVL(TO_CHAR(MGR),' ') MGR, 
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR,1,2)=75 THEN '5555'
        WHEN SUBSTR(MGR,1,2)=76 THEN '6666'
        WHEN SUBSTR(MGR,1,2)=77 THEN '7777'
        WHEN SUBSTR(MGR,1,2)=78 THEN '8888'
        ELSE TO_CHAR(MGR)
        END AS CHG_MGR
FROM EMP;

--지정한 부서번호,부서명,사원이름 및 지정한 사원과 동일한 부서에서 근무하는 모든 사원을
--표시하도록 질의를 작성하고 부서번호는 department, 사원이름은 employee, 동일한
--부서에서 근무하는 사원은 colleague로 표시하시오.
--(부서번호, 사원이름,동료 순으로 오름차순 정렬)

SELECT D.DEPTNO AS department
    , D.DNAME
    , E1.ENAME AS employee
    , E1.DEPTNO
    , E2.ENAME AS colleague
FROM EMP E1, EMP E2, DEPT D
WHERE E1.DEPTNO=D.DEPTNO
    AND E1.DEPTNO=E2.DEPTNO
    AND NOT E1.ENAME=E2.ENAME
    
ORDER BY department, employee, colleague;


--P213 Q7-1
SELECT DEPTNO
    ,TRUNC(AVG(SAL)) AS AVG_SAL
    ,MAX(SAL) AS MAX_SAL
    ,MIN(SAL) AS MIN_SAL
    ,COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO DESC;

--Q7-2
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB)>=3
;

--Q7-3
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR
    , DEPTNO
    , COUNT(*) AS CNT
FROM EMP
WHERE DEPTNO IS NOT NULL
GROUP BY TO_CHAR(HIREDATE,'YYYY'), DEPTNO;

--Q7-4
SELECT NVL2(COMM,'O','X') AS EXISTCOMM, COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM,'O','X')
;

--Q7-5
SELECT DEPTNO
    , TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR
    , COUNT(*) AS CNT
    , MAX(SAL) AS MAX_SAL
    , SUM(SAL) AS SUM_SAL
    , AVG(SAL) AS AVG_SAL
FROM EMP
WHERE DEPTNO IS NOT NULL
GROUP BY DEPTNO,  TO_CHAR(HIREDATE, 'YYYY')
ORDER BY DEPTNO
;

--Q8-1
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
    AND SAL>2000
ORDER BY DEPTNO, SAL;

--Q8-2
SELECT D.DEPTNO, D.DNAME
    , TRUNC(AVG(E.SAL)) AS AVG_SAL
    , MAX(E.SAL) AS MAX_SAL
    , MIN(E.SAL) AS MIN_SAL
    , COUNT(*) AS CNT
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;

--Q8-3
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+)=D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

--Q8-4
SELECT D.DEPTNO, D.DNAME, E1.EMPNO, E1.ENAME, 
    NVL(TO_CHAR(E1.MGR),' ') MGR
    , E1.SAL
    ,D.DEPTNO AS DEPTNO_1
    ,S.LOSAL,S.HISAL,S.GRADE
    , NVL(TO_CHAR(E2.EMPNO),' ') AS MGR_EMPNO
    , NVL(E2.ENAME,' ') AS MGR_ENAME
FROM EMP E1, EMP E2, DEPT D, SALGRADE S
WHERE E1.DEPTNO=D.DEPTNO(+)
    AND E1.MGR=E2.EMPNO(+)
    AND E1.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+) 
ORDER BY D.DEPTNO, E1.EMPNO;

--Q9-1
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
    AND JOB=(SELECT A.JOB
                FROM EMP A
                WHERE A.ENAME='ALLEN');

--Q9-2
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E,DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO
    AND SAL>(SELECT AVG(SAL)
            FROM EMP
            WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
            )
ORDER BY E.SAL DESC, D.DEPTNO;

--Q9-3
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
    AND E.DEPTNO=10
    AND JOB NOT IN(SELECT DISTINCT JOB
            FROM EMP
            WHERE DEPTNO=30); 
            
--Q9-4
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE  SAL BETWEEN LOSAL AND HISAL
    AND SAL>(SELECT MAX(SAL)
            FROM EMP
            WHERE JOB='SALESMAN')
ORDER BY EMPNO;
            
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND SAL>ALL(SELECT DISTINCT SAL
                FROM EMP
                WHERE JOB='SALESMAN')
ORDER BY EMPNO;

--Q10-1
DROP TABLE CH10_EMP;

CREATE TABLE CH10_EMP 
AS SELECT * FROM EMP;

DROP TABLE CH10_DEPT;

CREATE TABLE CH10_DEPT 
AS SELECT * FROM DEPT;

DROP TABLE CH10_SAL;

CREATE TABLE CH10_SAL 
AS SELECT * FROM SALGRADE;

INSERT ALL
    INTO CH10_DEPT VALUES(50, 'ORACLE','BUSAN' )
    INTO CH10_DEPT VALUES(60, 'SQL', 'ILSAN')
    INTO CH10_DEPT VALUES(70, 'SELECT', 'INCHEON')
    INTO CH10_DEPT VALUES(80, 'DML', 'BUNDANG')
SELECT * FROM DUAL;
    
DELETE FROM CH10_DEPT WHERE DEPTNO=50;  

ALTER TABLE CH10_DEPT
MODIFY DEPTNO NUMBER CONSTRAINT PK_DEPTNO PRIMARY KEY;

INSERT INTO CH10_DEPT(DEPTNO, DNAME, LOC) VALUES(50, 'ORACLE','BUSAN');

--Q10-2
INSERT ALL
    INTO CH10_EMP VALUES(7201,'TEST_USER1','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES(7202,'TEST_USER2','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES(7203,'TEST_USER3','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES(7204,'TEST_USER4','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES(7205,'TEST_USER5','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES(7206,'TEST_USER6','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES(7207,'TEST_USER7','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES(7208,'TEST_USER8','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
 SELECT * FROM DUAL;