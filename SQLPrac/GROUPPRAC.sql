/*
GROUP BY���� �⺻ ����

    SELECT ��ȸ�� ��1 �̸�, ��2 �̸�, ...,��N �̸�
    FROM ��ȸ�� ���̺� �̸�
    WHERE ��ȸ�� ���� �����ϴ� ���ǽ�
    GROUP BY �׷�ȭ�� ���� ����(���� �� ���� ����)
    ORDER BY �����Ϸ��� �� ����
*/

SELECT AVG(COMM),DEPTNO
FROM EMP
GROUP BY DEPTNO;

/*
HAVING���� �⺻ ����
    SELECT ��ȸ�� ��1 �̸�, ��2 �̸�,...,��N �̸�
    FROM ��ȸ�� ���̺� �̸�
    WHERE ��ȸ�� ���� �����ϴ� ���ǽ�
    GROUP BY �׷�ȭ�� �� ����(���� �� ���� ����)
    HAVING ��� �׷��� �����ϴ� ���ǽ�
    ORDER BY �����Ϸ��� �� ����
*/

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL)>=500
ORDER BY DEPTNO, JOB;


