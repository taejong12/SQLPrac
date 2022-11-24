CREATE TABLE "SCOTT"."EMP" (
    "EMPNO" NUMBER(4,0), 
	"ENAME" VARCHAR2(10 BYTE), 
	"JOB" VARCHAR2(9 BYTE), 
	"MGR" NUMBER(4,0), 
	"HIREDATE" DATE, 
	"SAL" NUMBER(7,2), 
	"COMM" NUMBER(7,2), 
	"DEPTNO" NUMBER(2,0)
);

/*
    ũ����Ʈ�� ���ؼ�
    ���̺��� ����ڴ�
    �� ������ �� ���� �� �ִ�
*/

--����1 
CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4), 
	ENAME VARCHAR2(10), 
	JOB VARCHAR2(9), 
	MGR NUMBER(4), 
	HIREDATE DATE, 
	SAL NUMBER(7,2), 
	COMM NUMBER(7,2), 
	DEPTNO NUMBER(2)
);

--Ȯ��
DESC EMP_DDL;

--����2
CREATE TABLE DEPT_DDL
AS SELECT * FROM DEPT;

DESC DEPT_DDL;

CREATE TABLE SALGRADE_DDL
AS SELECT * FROM SALGRADE;

DESC SALGRADE_DDL;

--������ �ű涧
CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE
    ,E.SAL,E.COMM,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;

--����
DROP TABLE EMPDEPT_DDL;

--�� �ű涧
CREATE TABLE EMPDEPT_DDL
AS SELECT E.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE
    ,E.SAL,E.COMM,D.DEPTNO,D.DNAME,D.LOC
FROM EMP E, DEPT D
WHERE 1<>1;

DESC EMPDEPT_DDL;

/* ALTER TABLE TBN ����
   1. ADD COLNAME DATATYPE;
   2. DROP COLNAME;
   3. MODIFY COLNAME DATATYPE;
   4. RENAME COLUMN OLDCOLNAME TO NEWCOLNAME 
*/
SELECT * 
FROM SALGRADE_DDL;

DESC SALGRADE_DDL;

--�߰�
ALTER TABLE SALGRADE_DDL
ADD PARTY VARCHAR2(20);

DESC SALGRADE_DDL;

--����
ALTER TABLE SALGRADE_DDL
RENAME COLUMN PARTY TO HOME;

DESC SALGRADE_DDL;

ALTER TABLE SALGRADE_DDL
MODIFY HOME NUMBER(10);

DESC SALGRADE_DDL;

--����
ALTER TABLE SALGRADE_DDL
DROP COLUMN HOME;

DESC SALGRADE_DDL;

--�̸� ����
RENAME SALGRADE_DDL TO SALZIP;

DESC SALGRADE_DDL;
DESC SALZIP;

/*DELETE ���� ����
TRUNCATE ���ɾ�� �뷮�� �پ� ���, �ε��� � ��� ���� �ȴ�. 
���̺��� ���������� �ʰ�, �����͸� �����Ѵ�. �Ѳ����� �� ������ �Ѵ�. 
���� �� ���� �ǵ��� �� ����.*/
TRUNCATE TABLE SAIZIP;

--DROP ���ɾ�� ���̺� ��ü�� ����, ����, ��ü�� �����Ѵ�. ���� �� ���� �ǵ��� �� ����.
DROP TABLE SALZIP;


/* NOT NULL/UNIQUE/PRIMARY KEY/FOREIGN KEY/CHECK/DEFAULT */
CREATE TABLE PERSONS(
    ID VARCHAR2(4) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    AGE NUMBER(3),
    TELNUM VARCHAR(20)
);

DESC PERSONS;
SELECT * FROM PERSONS;

INSERT INTO PERSONS(NAME) VALUES('SCOTT');

CREATE TABLE PERSONS2(
    ID VARCHAR2(4) CONSTRAINT PERSONS2_ID_NN NOT NULL,
    NAME VARCHAR2(20) CONSTRAINT PERSONS2_NAME_NN NOT NULL,
    AGE NUMBER(3),
    TELNUM VARCHAR(20)
);

DESC PERSONS2;
SELECT * FROM PERSONS2;
COMMIT;

ALTER TABLE SAL_DDL
MODIFY LOSAL CONSTRAINT SAL_DDL_LOSAL_NN NOT NULL;

ALTER TABLE SAL_DDL
DROP CONSTRAINT SYS_C007004;

DROP TABLE PERSONS;
DROP TABLE PERSONS2;


CREATE TABLE PERSONS(
    ID VARCHAR2(4) PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL UNIQUE,
    AGE NUMBER(3) CHECK(AGE>=18),
    TELNUM VARCHAR(20),
    ADDR VARCHAR(100) DEFAULT 'SEOUL',
    BDAY DATE DEFAULT SYSDATE
);

INSERT INTO PERSONS(ID,NAME,AGE,TELNUM)
VALUES('1000','SCOTT',20,'01012345678');

SELECT * FROM PERSONS;

CREATE TABLE PERSONS2(
    ID VARCHAR2(4),
    NAME VARCHAR2(20) NOT NULL,
    AGE NUMBER(3),
    TELNUM VARCHAR(20),
    ADDR VARCHAR(100) DEFAULT 'SEOUL',
    BDAY DATE DEFAULT SYSDATE,
    CONSTRAINT PK_PERSONS2 PRIMARY KEY(ID),
    CONSTRAINT UN_PERSONS2 UNIQUE(NAME),
    CONSTRAINT CHK_PERSONS2 CHECK(AGE<=18)
);

ALTER TABLE PERSONS2
MODIFY ADDR DEFAULT 'PARIS';

ALTER TABLE PERSONS2
DROP CONSTRAINT CHK_PERSONS2;

ALTER TABLE PERSONS2
ADD CONSTRAINT CHK_P2 CHECK(AGE>50);


CREATE TABLE PLAYS(
    PLAY_ID NUMBER(10) PRIMARY KEY
    ,PLAY_RESULT VARCHAR2(100)
    ,PERSONS_ID VARCHAR2(4)
    ,CONSTRAINT FK_PLAYS FOREIGN KEY (PERSONS_ID) REFERENCES PERSONS(ID)
        ON DELETE CASCADE
);
--ON DELETE SET NULL


CREATE TABLE PKTABLE(
    PKVAL VARCHAR2(10),
    CONSTRAINT PK_KEY PRIMARY KEY(PKVAL)
);

   
CREATE TABLE FKTABLE(
    PKVAL VARCHAR2(10),
    FKVAL VARCHAR2(10)
);
    
DESC PKTABLE;
DESC FKTABLE;
    
ALTER TABLE FKTABLE
ADD CONSTRAINT FK_KEY FOREIGN KEY(FKVAL) REFERENCES PATABLE(PKVAL)
ON DELETE CASCADE;

ALTER TABLE FKTABLE
ADD CONSTRAINT FKT_PK_KEY PRIMARY KEY(PKVAL);

INSERT INTO PKTABLE VALUES('PK1');
INSERT INTO PKTABLE VALUES('PK2');
INSERT INTO PKTABLE VALUES('PK3');

SELECT * FROM PKTABLE;

INSERT INTO FKTABLE VALUES('PK1_VAL1','PK1');
INSERT INTO FKTABLE VALUES('PK1_VAL2','PK1');
INSERT INTO FKTABLE VALUES('PK2_VAL1','PK2');
INSERT INTO FKTABLE VALUES('PK2_VAL2','PK2');
INSERT INTO FKTABLE VALUES('PK3_VAL1','PK3');
INSERT INTO FKTABLE VALUES('PK3_VAL2','PK3');

SELECT *
FROM FKTABLE;

SELECT P.PKVAL, F.FKVAL, F.PKVAL
FROM PKTABLE P, FKTABLE F
WHERE P.PKVAL=F.FKVAL;

DELETE FROM PKTABLE WHERE PKVAL='PK1';
SELECT * FROM PKTABLE;
SELECT * FROM FKTABLE;

