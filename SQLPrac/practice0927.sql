--Q1
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
WHERE SAL<2000  OR SAL>3000;

--Q5
SELECT ENAME, EMPNO, SAL, DEPTNO
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
    , RPAD(SUBSTR(EMPNO,1,2),LENGTH(EMPNO),'*') AS MASKING_EMPNO
    ,ENAME
    ,RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME)>=5
    AND LENGTH(ENAME)<6;
    
--Q2
SELECT EMPNO, ENAME, SAL
    , TRUNC(SAL/21.5,2) DAY_PAY
    , ROUND(SAL/21.5/8,1) TIME_PAY
FROM EMP;

--Q3
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY/MM/DD')
    , TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'??????'),'YYYY-MM-DD') R_JOB
    , NVL(TO_CHAR(COMM),'N/A') COMM
FROM EMP;

--Q4
SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR),' ') MGR
    ,CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN TO_CHAR(SUBSTR(MGR,1,2))=75 THEN '5555'
        WHEN TO_CHAR(SUBSTR(MGR,1,2))=76 THEN '6666'
        WHEN TO_CHAR(SUBSTR(MGR,1,2))=77 THEN '7777'
        WHEN TO_CHAR(SUBSTR(MGR,1,2))=78 THEN '8888'
        ELSE TO_CHAR(MGR)
        END AS CHG_MGR
FROM EMP;

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
SELECT TO_CHAR(HIREDATE,'YYYY') HIRE_YEAR
    , DEPTNO
    , COUNT(*) CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY'), DEPTNO;

--Q4
SELECT NVL2(COMM,'O','X') EXIST_COMM
    , COUNT(*) CNT
FROM EMP
GROUP BY NVL2(COMM,'O','X');

--Q5
SELECT DEPTNO
    , TO_CHAR(HIREDATE, 'YYYY') HIRE_YEAR
    , COUNT(*) CNT
    , MAX(SAL) MAX_SAL
    , SUM(SAL) SUM_SAL
    , AVG(SAL) AVG_SAL
FROM EMP
GROUP BY DEPTNO,TO_CHAR(HIREDATE, 'YYYY');

--Q1
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
    AND E.SAL>2000;

--Q2
SELECT D.DEPTNO, D.DNAME
    , TRUNC(AVG(SAL)) AVG_SAL
    , MAX(SAL) MAX_SAL
    , MIN(SAL) MIN_SAL
    , COUNT(*) CNT
FROM DEPT D, EMP E
WHERE D.DEPTNO=E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;

--Q3
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

--Q4
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, D.DEPTNO, S.LOSAL, S.HISAL, S.GRADE
    , E1.EMPNO MGR_EMPNO
    , E1.ENAME MGR_ENAME
FROM EMP E, DEPT D, SALGRADE S, EMP E1
WHERE E.DEPTNO=D.DEPTNO(+)
    AND E.MGR=E1.EMPNO(+)
    AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
ORDER BY D.DEPTNO, E.EMPNO;

--Q1
SELECT E.JOB, E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
    AND JOB IN(SELECT JOB
            FROM EMP
            WHERE ENAME='ALLEN');
            
--Q2
SELECT E.EMPNO, E.ENAME, D.DNAME, TO_CHAR(HIREDATE,'YYYY-MM-DD'), D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S. HISAL
    AND E.SAL>(SELECT AVG(SAL)
                FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO;

--Q3
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
    AND D.DEPTNO=10
    AND E.JOB NOT IN(SELECT DISTINCT JOB
                    FROM EMP E
                    WHERE DEPTNO=30);

--Q4
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND E.SAL>(SELECT MAX(SAL)
            FROM EMP
            WHERE JOB='SALESMAN')
            ORDER BY EMPNO;
            
--Q1
CREATE TABLE CH10_EMP AS SELECT * FROM EMP;
CREATE TABLE CH10_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CH10_SAL AS SELECT * FROM SALGRADE;

DELETE FROM CH10_DEPT WHERE DEPTNO=50;
INSERT INTO CH10_DEPT(DEPTNO, DNAME, LOC)
VALUES(50,'ORACL','BUSAN');
INSERT ALL
    INTO CH10_DEPT VALUES (60,'SQL','ILSAN')
    INTO CH10_DEPT VALUES (70,'SELECT','INCHEON')
    INTO CH10_DEPT VALUES (80,'DML','BUNDANG')
SELECT * FROM DUAL;

SELECT * 
FROM CH10_DEPT;

DROP TABLE CH10_DEPT;

--Q2
INSERT ALL
    INTO CH10_EMP VALUES  (7201,'TEST_USER1','MANAGER',7788,TO_DATE('2016-01-02','YYYY-MM-DD'),4500,NULL,50)
    INTO CH10_EMP VALUES  (7202,'TEST_USER2','CLERK',7201,TO_DATE('2016-02-21','YYYY-MM-DD'),1800,NULL,50)
    INTO CH10_EMP VALUES  (7203,'TEST_USER3','ANALYST',7201,TO_DATE('2016-04-11','YYYY-MM-DD'),3400,NULL,60)
    INTO CH10_EMP VALUES  (7204,'TEST_USER4','SALESMAN',7201,TO_DATE('2016-05-31','YYYY-MM-DD'),2700,300,60)
    INTO CH10_EMP VALUES  (7205,'TEST_USER5','CLERK',7201,TO_DATE('2016-07-20','YYYY-MM-DD'),2600,NULL,70)
    INTO CH10_EMP VALUES  (7206,'TEST_USER6','CLERK',7201,TO_DATE('2016-09-08','YYYY-MM-DD'),2600,NULL,70)
    INTO CH10_EMP VALUES  (7207,'TEST_USER7','LECTURER',7201,TO_DATE('2016-10-28','YYYY-MM-DD'),2300,NULL,80)
    INTO CH10_EMP VALUES  (7208,'TEST_USER8','STUDENT',7201,TO_DATE('2018-03-09','YYYY-MM-DD'),1200,NULL,80)
SELECT * FROM DUAL;

SELECT * 
FROM CH10_EMP;

ALTER TABLE CH10_EMP
MODIFY EMPNO NUMBER CONSTRAINT CH10_EMP_PK PRIMARY KEY;

UPDATE CH10_EMP
SET DEPTNO=70
WHERE DEPTNO=50
    AND SAL>(SELECT AVG(SAL)
            FROM CH10_EMP, CH10_SAL
            WHERE SAL BETWEEN LOSAL AND HISAL);
            

--Q4
UPDATE CH10_EMP
SET SAL=SAL*1.1, DEPTNO=80
WHERE HIREDATE>(SELECT MIN(HIREDATE)
                FROM CH10_EMP
                WHERE DEPTNO=60);
                
--Q5
DELETE FROM CH10_EMP WHERE EMPNO IN(SELECT EMPNO
                                    FROM CH10_EMP, CH10_SAL
                                    WHERE SAL BETWEEN LOSAL AND HISAL
                                    AND GRADE=5);
                                    SELECT * FROM CH10_EMP;
                                    SELECT * FROM CH10_SAL;

--Q1
CREATE TABLE EMP_HW(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
    );

DESC EMP_HW;

ALTER TABLE EMP_HW
ADD BIGO VARCHAR(20);

ALTER TABLE EMP_HW
MODIFY BIGO VARCHAR(30);

ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;

INSERT INTO EMP_HW(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM,DEPTNO)
SELECT * 
FROM EMP;

SELECT *
FROM EMP;
            
SELECT *
FROM EMP_HW;

DROP TABLE EMP_HW;

--Q1
CREATE TABLE EMPIDX
AS SELECT * FROM EMP;

SELECT * FROM EMPIDX;
            
CREATE INDEX IDX_EMPIDX_EMPNO
ON EMPIDX(EMPNO);

SELECT * FROM USER_INDEXES
WHERE INDEX_NAME='IDX_EMPIDX_EMPNO';

--q2

CREATE OR REPLACE VIEW EMPIDX_OVER15K AS
SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, NVL2(COMM,'O','X') COMM
FROM EMPIDX 
WHERE SAL>1500;

SELECT * FROM EMPIDX_OVER15K;

--Q3
CREATE TABLE DEPTSEQ AS
SELECT * FROM DEPT;

SELECT * FROM DEPTSEQ;

CREATE SEQUENCE SEQ_DEPTSEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE
    NOCACHE;

INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES (SEQ_DEPTSEQ.NEXTVAL,'DATEBASE','LOC');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES (SEQ_DEPTSEQ.NEXTVAL,'WEB','BUSAN');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES (SEQ_DEPTSEQ.NEXTVAL,'MOBILE','ILSAN');


--Q1
CREATE TABLE DEPT_CONST2(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DPETNO_PK2 PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ2 UNIQUE ,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN2 NOT NULL
);

DESC DEPT_CONST2;

CREATE TABLE EMP_CONST2(
    EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK2 PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN2 NOT NULL,
    JOB VARCHAR2(9),
    TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ2 UNIQUE,
    HIREDATE DATE,
    SAL NUMBER(7,2) CONSTRAINT EMPCONST_SAL_CHK2 CHECK(SAL BETWEEN 1000 AND 9999),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK2 REFERENCES DEPT_CONST2(DEPTNO)
);

DESC EMP_CONST2;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('DEPT_CONST2','EMP_CONST2')
    AND TABLE_NAME LIKE '%CONST2';
