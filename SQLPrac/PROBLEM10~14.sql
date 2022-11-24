CREATE TABLE CHAP10HW_EMP
AS SELECT * FROM EMP;

CREATE TABLE CHAP10HW_DEPT
AS SELECT * FROM DEPT;

CREATE TABLE CHAP10HW_SALGRADE
AS SELECT * FROM SALGRADE;

--P287 10�� Q1
INSERT INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
VALUES(50,'ORACLE', 'BUSAN');
INSERT INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
VALUES(60,'SQL', 'ILSAN');
INSERT INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
VALUES(70,'SELECT', 'INCHEON');
INSERT INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
VALUES(80,'DML', 'BUNDANG');

SELECT * FROM CHAP10HW_DEPT;

--Q2
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7201,'TEST_USER1','MANAGER',7788,'2016-01-02',4500,NULL ,50);
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL ,50);
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,NULL ,60);
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300 ,60);
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,NULL ,70);
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,NULL ,70);
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,NULL ,80);
INSERT INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE,SAL,COMM,DEPTNO)
VALUES(7208,'TEST_USER8','STUDENT',7201,'2016-03-09',1200,NULL ,80);

--UPDATE CHAP10HW_EMP
--SET TO_CHAR(COMM)=' '
--WHERE COMM IS NULL;

SELECT EMPNO,ENAME,JOB,MGR, HIREDATE,SAL,
    NVL(TO_CHAR(COMM),' ') AS COMM,
    DEPTNO
FROM CHAP10HW_EMP;

COMMIT;

SELECT * FROM CHAP10HW_EMP;

DELETE FROM CHAP10HW_EMP;

DROP TABLE CHAP10HW_EMP;



--Q3
UPDATE  CHAP10HW_EMP
SET DEPTNO=70
WHERE SAL>(SELECT AVG(SAL)
        FROM CHAP10HW_EMP
        WHERE DEPTNO=50);
        
SELECT * FROM CHAP10HW_EMP
ORDER BY DEPTNO;

--Q4
UPDATE CHAP10HW_EMP
SET DEPTNO=80, SAL=SAL+SAL*1.1
WHERE  HIREDATE>(SELECT MIN(HIREDATE)
        FROM CHAP10HW_EMP
        WHERE DEPTNO=60);

SELECT * FROM CHAP10HW_EMP;

ALTER TABLE CHAP10HW_EMP DROP PRIMARY KEY;
ALTER TABLE CHAP10HW_EMP
ADD CONSTRAINT PK_EMPNO PRIMARY KEY(EMPNO);

--Q5
DELETE 
FROM CHAP10HW_EMP 
WHERE EMPNO IN(SELECT EMPNO
                FROM CHAP10HW_EMP, SALGRADE
                WHERE SAL BETWEEN LOSAL AND HISAL
                AND GRADE=5);
                
--(SELECT GRADE
--            FROM SALGRADE
--            WHERE SAL BETWEEN LOSAL AND HISAL
--                AND GRADE=5);
    
ROLLBACK;




--P325 Q12-1
CREATE TABLE EMP_HW(
    EMPNO NUMBER(4),
    ENAME VARCHAR(10),
    JOB VARCHAR(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

--Q12-2
ALTER TABLE EMP_HW
ADD(BIGO VARCHAR(20));

--Q12-3
ALTER TABLE EMP_HW
MODIFY(BIGO VARCHAR(30)); 

--Q12-4
ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;

--Q12-5
INSERT INTO EMP_HW(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO 
FROM EMP;

SELECT * FROM EMP;

--Q12-6
DROP TABLE EMP_HW;


--p357 Q13-1
CREATE TABLE EMPIDX
AS SELECT * FROM EMP;

CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX(EMPNO);

SELECT * FROM USER_INDEXES
WHERE INDEX_NAME ='IDX_EMPIDX_EMPNO';

--Q13-2

CREATE OR REPLACE VIEW EMPIDK_OVER15K
AS(SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, NVL2(COMM,'O','X') AS COMM
    FROM EMPIDX
    WHERE SAL>1500);

SELECT * FROM EMPIDK_OVER15K;

--Q13-3
CREATE TABLE DEPTSEQ
AS SELECT * FROM DEPT;

SELECT * FROM DEPTSEQ;

CREATE SEQUENCE SEQ_DEPTSEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE
    NOCACHE;
    
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES(SEQ_DEPTSEQ.NEXTVAL, 'DATEBASE','SEOUL');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES(SEQ_DEPTSEQ.NEXTVAL, 'WEB','BUSAN');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES(SEQ_DEPTSEQ.NEXTVAL, 'MOBILE','ILSAN');
SELECT * FROM DEPTSEQ;

--p394 Q14-1
CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2),
    DNAME VARCHAR(14),
    LOC VARCHAR(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL,
    CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY(DEPTNO),
    CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE(DNAME)
);

CREATE TABLE EMP_CONST(
    EMPNO NUMBER(4),
    ENAME VARCHAR(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
    JOB VARCHAR(9),
    TEL VARCHAR(20),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2),
    CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY(EMPNO),
    CONSTRAINT EMPCONST_TEL_UNQ UNIQUE(TEL),
    CONSTRAINT EMPCONST_SAL_CHK CHECK(SAL BETWEEN 1000 AND 9999),
    CONSTRAINT EMPCONST_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT_CONST(DEPTNO) 
    ON DELETE CASCADE
);

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME LIKE ('%CONST')
ORDER BY CONSTRAINT_NAME;

