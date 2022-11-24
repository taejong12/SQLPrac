/*���տ�����
    1. UNION ������
    2. UNION ALL �ߺ����
    3. INTERSECT ������
    4. MINUS ������
    
    BETWEEN ������
    
    BETWEEN A AND B : A��? B ������ ������ �˻��ؼ� ��Ÿ����� �ǹ��Դϴ�.
    
    SELECT column_name(s)
    FROM table_name
    WHERE column_name BETWEEN value1 AND value2;

*/

/* DML
    SELECT ������ ��ȸ
    INSERT ������ ���� 
    UPDATE ������ ����
    DELETE ������ ����
    
    UPDATE
    
    UPDATE TB
    SET COL1=VAL1, COL2=VAL2,...
    WHERE CON;
*/

/* INSERT
    INSERT INTO TB(COL1, COL2...)
    VALUES ( VAL1,VAL2,VAL3...)
*/

/* DELETE
    DELETE FROM TB WHERE CON;
*/

/* 
    GROUP BY
    
    SELECT COLS (COUNT MAX MIN SUM AVG)
    FROM TB
    WHERE CONDITION
    GROUP BY COLS

    HAVING���� �⺻ ����
    SELECT ��ȸ�� ��1 �̸�, ��2 �̸�,...,��N �̸�
    FROM ��ȸ�� ���̺� �̸�
    WHERE ��ȸ�� ���� �����ϴ� ���ǽ�
    GROUP BY �׷�ȭ�� �� ����(���� �� ���� ����)
    HAVING ��� �׷��� �����ϴ� ���ǽ�
    ORDER BY �����Ϸ��� �� ����
    
    HAVING
    
    SELECT COLS
    FROM TB
    WHERE CON
    GROUP BY COLS
    HAVING CON
    ORDER BY COLS
    
    �����ϴ� ȸ�縦 ������� �Ѵ�
    
    JOIN
    �����Ϳ� �����͸� �������ִ�
*/

/*WITH(VIEW ����� ���)
    WITH
    ��Ī AS SELECT.....
    
    SELECT
    FROM ��Ī
*/

WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO=10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO=D.DEPTNO;

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10
,(SELECT * FROM DEPT) D
WHERE E10.DEPTNO=D.DEPTNO;

/* DDL
    CREATE �����ͺ��̽�, ���̺� ���� ����
    ALTER ���̺��� ����
    DROP �����ͺ��̽�, ���̺��� ����
    TRUNCATE ���̺��� �ʱ�ȭ
    
    CREATE
    CREATE TABLE TB
    (COL DATATYPE �⺻��(��������) NULL(��������));
    
    CREATE(����)
    CREATE TABLE ���ο�����̺��
    AS SELECT * FROM ���������̺��;
    
    ALTER
    1. ���̺� �÷� �߰��ϱ�
    [����] ALTER TABLE?���̺�� ADD(�÷��� ����ŸŸ��(������));

    2. ���̺� �÷� �����ϱ�
    [����] ALTER TABLE?���̺�� MODIFY(�÷��� ����ŸŸ��(������));
    
    3. ���̺� �÷� �����ϱ�
    [����] ALTER TABLE ���̺�� DROP COLUMN?�÷���

    4. ���̺� �÷� �̸� �����ϱ�
    [����] ALTER TABLE ���̺�� RENAME COLUMN �����÷��� TO �ٲ��÷���;

    DROP
    DROP TABLE ���̺� �̸�;
    DROP CONSTRAINT �������� �̸�;
    
    TRUNCATE
    TRUNCATE TABLE ���̺� �̸�;
    
    ���� ����(constraint)
    1. NOT NULL
    2. UNIQUE
    3. PRIMARY KEY
    4. FOREIGN KEY
    5. DEFAULT
    6. CHECK
    
    1. NOT NULL - NOT NULL�� ����ϰ� �Ǹ� �μ�Ʈ�� �� �����Ͱ��� ���߸� �մϴ�.
    ���̺� ������ �������� �߰���
    
    -CREATE TABLE ���̺��(
    �÷��� ������Ÿ��() NOT NULL);
    
    ���� �Ŀ� NOT NULL �������� �߰���
    
    -ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL;
    
    2. UNIQUE - ������(�ߺ�X)
    
    -CREATE TABLE ���̺��(
    �÷��� ������Ÿ��() UNIQUE);
    -CREATE TABLE ���̺��( // CONSTRAINT�� ����
    �÷��� ������Ÿ��() CONSTRAINT �������Ǹ� UNIQUE(�÷���));
    -CREATE TABLE ���̺��(
    �÷��� ������Ÿ��(),
    CONSTRAINT �������Ǹ� UNIQUE(�÷���));
    
    3. PRIMARY KEY(NOT NULL,UNIQUE)
    
    -CREATE TABLE ���̺��(
    �÷��� ������Ÿ��() PRIMARY KEY
    );
     -CREATE TABLE ���̺��(
    �÷��� ������Ÿ��(),
    CONSTRAINT �������Ǹ� PRIMARY KEY (�÷���)
    );
    
    4.FOREIGN KEY
    �ܷ�Ű (Foreign Key)
    �⺻Ű(Primary Key) ���� �ִ� ���̺��� �ٸ� ���̺� �� ������ �����Ҷ� ���ȴ�.
    PK(Primary Key �⺻Ű)�� ������ ���� ���̺��� �ܷ�Ű(FK Foreign Key)�� ������ �ȴ�.
    �⺻Ű(PK)�� ������ �ִ� ���̺�(�θ����̺�)�� �����Ǿ��, �ܷ�Ű(FK)�� ������ ���̺�(�ڽ����̺�)�� ������ �� �ִ�.
    Foreign Key�� �̸��� �ߺ��Ǽ��� �ȵȴ�.

    -CREATE TABLE ���̺��1(
    �÷���1 ������Ÿ�� PRIMARY KEY
    );
    CREATE TABLE ���̺��2(
    �÷���1 ������ Ÿ��,
    CONSTRAINT �������Ǹ� FOREIGN KEY(�÷���1)
    REFERENCES ������ ���̺��1(������ �÷���1) ON DELETE CASCADE);
    
    ON DELETE CASCADE- �����Ǵ� �θ� ���̺��� �࿡ ���� DELETE�� ����Ѵ�.
    ��. �����Ǵ� �θ����̺� ���� �����Ǹ� ���������� �ڽ����̺� �� ���� �����˴ϴ�.

    5. DEFAULT
    CREATE TABLE ���̺��(
    �÷��� ������Ÿ�� DEFAULT �⺻��);
    
    ALTER TABLE ���̺��
    MODIFY �÷��� DEFAULT �⺻��

    6. CHECK
    ���̺� ������
    CREATE TABLE ���̺��(
    �÷��� ������Ÿ�� CONSTRAINT �������Ǹ� CHECK(���� �Ǵ� ����));
    
    ���̺� ���� ��
    ALTER TABLE ���̺��
    ADD CONSTRAINT �������Ǹ� CHECK(���� �Ǵ� ����);


1. ���̺� �����ϱ� ��Ű�� & ������
CREATE TABLE ���θ������̺�� AS
SELECT * FROM ���������̺�� [WHERE ��]
?
?

2. ���̺� ������ �����ϱ�
CREATE TABLE?���θ������̺��?AS
SELECT * FROM?���������̺��?WHERE 1=2 [where���� '��'�� �ƴ� ������ �־���]
?
?

3. ���̺��� �̹� �����Ǿ� �ְ� �����͸� ���� (���̺� ������ ������ ��)
INSERT INTO?���������̺��?SELECT * FROM ���̺��?[WHERE ��]
--Sample SQL
INSERT INTO TB_BOARD_TEMP SELECT * FROM TB_BOARD;
?
?

4. ���̺��� �̹� �����Ǿ� �ְ� �����͸� ���� (���̺� ������ �ٸ� ��)
INSERT INTO?���������̺��?(NUM, TITLE, CONTENTS) SELECT NUM, TITLE, CONTENTS FROM?���̺��


    DCL
    GRANT Ư�� �����ͺ��̽� ����ڿ��� Ư�� �۾��� ���� ���� ������ �ο�
    REVOKE Ư�� �����ͺ��̽� ����ڿ��� Ư�� �۾��� ���� ���� ������ ��Ż, ȸ��
    COMMIT Ʈ������� �۾��� ����
    ROLLBACK Ʈ������� �۾��� ���, ������� ����
    
    Ʈ�����
    ROLLBACK;
    COMMIT;

    �����
    CREATE VIEW ���̸� AS SELECT��

    INDEX ����
    CREATE [UNIQUE] INDEX [��Ű����.]�ε�����
      ON [��Ű����.]���̺�� (�÷�1 [, �÷�2, �÷�3, ...])
    
    ����������
    CREATE SEQUENCE ��Ű����.��������
        INCREMENT BY 1 (������(1�� ����))
        START WITH 1 (���۰�)
        MINVALUE 1 (�ּڰ�)
        MAXVALUE 9999 (�ִ�)
        NOCYCLE (�ִ� ���޽� ���۰����� �ٽ� �ݺ�)
        NOCACHE (CACHE�� ������� ����)
        NOORDER; (��û ������� ���� �������� ����)

    NOCYCLE|CYCLE: NOCYCLE(�ݺ�����), CYCLE(�������� �ִ񰪿� ���� �� �ּڰ� 1���� �ٽý���)
    NOCACHE|CACHE: NOCACHE(������), CACHE(ĳ�ø� ����Ͽ� �̸� ���� �Ҵ��� ���Ƽ� �ӵ��� ������, ���� ����ڰ� ���� ��� ����)
    NOORDER|ORDER: NOORDER(������), ORDER(��û ������ ���� �����Ͽ� �߻� ������ ���������� ������ �ý��� ���ϰ� ����)
    
    
*/
