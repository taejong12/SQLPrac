/*INDEX*/
CREATE INDEX EMP_INDEX
ON EMP(EMPNO, ENAME);

/*CREATE UNIQUE INDEX ON EMP()*/

DROP INDEX EMP_INDEX;

/*DICTIONARY*/
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

/*
    USER_?? ����� ���� ��ü ����
    ALL_?? ����� ��밡���� ��ü ����
    DBA_?? DB ���õ� ���� (SYSTEM SYS)
    V$_VIEW ����
*/

SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_USERS;
SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;

/*VIEW*/
CREATE VIEW VW_EMP1
AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL
    FROM EMP
    WHERE DEPTNO=10);
SELECT * FROM USER_VIEWS;

SELECT * FROM VW_EMP1;

CREATE VIEW VW_EMP2
AS (SELECT E.*, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO);
SELECT * FROM USER_VIEWS;

SELECT EMPNO, ENAME, DNAME FROM VW_EMP2;

DROP VIEW VW_EMP1;

/*SEQUENCE
    CREATE SEQUENCE [SEQ NAME]
    INCREMENT BY [NUM]
    START WITH [START NUM]
    NOMINVALUE OR MINVALUE [MINNUM]
    NOMAXVALUE OR MAXVALUE [MAXNUM]
    CYCLE OR NOCYCLE
    CACHE OR NOCACHE [SIZE]
*/
CREATE SEQUENCE EX_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
CACHE 2;

CREATE TABLE SEQTABLE(SEQNUM NUMBER(4), TESTTXT VARCHAR2(10));
SELECT * FROM SEQTABLE;
INSERT INTO SEQTABLE VALUES(EX_SEQ.NEXTVAL, EX_SEQ.CURRVAL);
INSERT INTO SEQTABLE VALUES(EX_SEQ.NEXTVAL, 'TEMP');

SELECT EX_SEQ.CURRVAL FROM DUAL;
SELECT EX_SEQ.NEXTVAL FROM DUAL;

--����
ALTER SEQUENCE EX_SEQ INCREMENT BY -3;
ALTER SEQUENCE EX_SEQ INCREMENT BY 1;

SELECT * FROM EMP;

--����
DROP SEQUENCE EX_SEQ;

/*�ٹ�ȣ*/
SELECT ROWNUM, A.*
FROM(SELECT E.* 
    FROM EMP E
    ORDER BY E.ENAME
    ) A
;

SELECT ROW_NUMBER() OVER(ORDER BY E.ENAME) ROW_NUM
    ,E.*
FROM EMP E
ORDER BY E.ENAME;

SELECT ROW_NUMBER() OVER(ORDER BY E.JOB,E.ENAME) ROW_NUM
    ,E.*
FROM EMP E
ORDER BY E.JOB, E.ENAME;

SELECT ROW_NUMBER() OVER(PARTITION BY E.JOB ORDER BY E.JOB,E.ENAME) ROW_NUM
    ,E.*
FROM EMP E
ORDER BY E.JOB, E.ENAME;


/* OVER (PARTITION BY)*/
SELECT JOB,SUM(SAL)
FROM EMP
WHERE JOB IN('MANAGER','SALESMAN')
GROUP BY JOB
ORDER BY JOB;

SELECT EMPNO
    ,ENAME
    ,DEPTNO
    ,JOB
    ,SUM(SAL) OVER(PARTITION BY JOB, DEPTNO)
FROM EMP
WHERE JOB IN('MANAGER', 'SALESMAN')
ORDER BY JOB,DEPTNO;


SELECT EMPNO,ENAME,JOB,SAL
    ,RANK() OVER(PARTITION BY JOB ORDER BY SAL DESC) AS ���
    FROM EMP
    WHERE SAL IS NOT NULL
    ORDER BY JOB;

SELECT EMPNO,ENAME,JOB,SAL
    ,RANK() OVER(PARTITION BY JOB ORDER BY SAL DESC) AS ���1
    ,DENSE_RANK() OVER(PARTITION BY JOB ORDER BY SAL DESC) AS ���2
    FROM EMP
    WHERE SAL IS NOT NULL
    ORDER BY JOB;
    
/*SYNONYM ���Ǿ�
CREATE PUBLIC SYNONYM [NAME]
FOR [TARGET]
*/
CREATE SYNONYM DE
FOR DEPT;
SELECT * FROM DE;
DROP SYNONYM DE;

SELECT LEVEL FROM DUAL CONNECT BY LEVEL<=10;

SELECT * FROM(SELECT ROWNUM AS NUM FROM EMP E, EMP A) WHERE NUM<=24;


SELECT * FROM(
SELECT 1 FROM DUAL UNION ALL
SELECT 2 FROM DUAL UNION ALL
SELECT 3 FROM DUAL UNION ALL
SELECT 4 FROM DUAL 
);

SELECT LEVEL, EMPNO, ENAME, MGR,JOB
FROM EMP
START WITH JOB='PRESIDENT'
CONNECT BY PRIOR EMPNO=MGR
ORDER BY LEVEL;

SELECT LEVEL, EMPNO
    , CASE WHEN JOB='PRESIDENT' THEN ENAME
    ELSE LPAD('��',3*(LEVEL-1))||ENAME
    END AS ENAME
    ,MGR, JOB
FROM EMP
START WITH JOB='PRESIDENT'
CONNECT BY PRIOR EMPNO=MGR AND LEVEL<=3
ORDER BY LEVEL;

    