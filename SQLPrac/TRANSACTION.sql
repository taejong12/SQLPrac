/* Ʈ�����
    ������ü K���� DB �ȿ� A��� ����� ���� ���� �� �ٸ� S���� B��� ����� ����
    SELECT���� Ȯ���ϰ� ������ ������ ���� ��ü��� ����
    ������ ���� ���� DML UPDATE
    �̷� ���� ��ü�� �ϳ��� Ʈ������̴�
    �� ������ ó�����ִ� �۾� ��ü�� �����̶�� �Ѵ�
    ���� �����ϴ� ���� ���� �ȿ� �������� Ʈ������� ���ư� �� �ִ�


    TCL(DCL)
*/


--6 5000 7000 �߰�
INSERT INTO SAL_TCL(GRADE,LOSAL,HISAL)
VALUES(6, 5000,7000);

--5 3001 4999 ����
UPDATE SAL_TCL
SET LOSAL=3001, HISAL=4999
WHERE GRADE=5;

--3 ����
DELETE FROM SAL_TCL WHERE GRADE=3;
DELETE FROM SAL_TCL WHERE GRADE=6;

ROLLBACK;

SELECT * FROM SAL_TCL;

COMMIT;

DELETE FROM SAL_TCL;

INSERT INTO SAL_TCL
VALUES(1, 1000, 2000);



