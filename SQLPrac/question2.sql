-- 1. ������ 12000 �̻�Ǵ� �������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY>=12000;

-- 2. �����ȣ�� 176 �� ����� LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID=176;

-- 3. ������ 5000 ���� 12000�� ���� �̿��� ������� LAST_NAME �� ������ ��ȸ����.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;

SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY<5000 OR SALARY>12000;

-- 4. 1998/02/20 �Ϻ��� 1998/05/01 ���̿� ���� ������� 
--LAST_NAME ���, ������ڸ� ��ȸ�Ѵ�.
SELECT LAST_NAME, EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN TO_DATE('19980220', 'YYYYMMDD') AND TO_DATE('19980501','YYYYMMDD');

SELECT LAST_NAME, EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE>=TO_DATE('19980220', 'YYYYMMDD') 
    AND HIRE_DATE<=TO_DATE('19980501','YYYYMMDD');
    
SELECT E.LAST_NAME, E.EMPLOYEE_ID, J.START_DATE
FROM EMPLOYEES E, JOB_HISTORY J
WHERE E.EMPLOYEE_ID=J.EMPLOYEE_ID
    AND J.START_DATE>=TO_DATE('19980220', 'YYYYMMDD') 
    AND J.START_DATE<=TO_DATE('19980501', 'YYYYMMDD');
    
-- 5. 20 �� �� 50 �� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ� ��ȣ�� ���ĺ������� ��ȸ�Ѵ�.
    SELECT LAST_NAME, DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN(20,50)
    ORDER BY LAST_NAME;
    
-- 6. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
    SELECT LAST_NAME, SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN(20,50) 
        AND SALARY BETWEEN 5000 AND 12000;
        
-- 7. 2005�⵵�� ���� ��� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
    SELECT LAST_NAME, HIRE_DATE
    FROM EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE,'YYYYMMDD') LIKE '2005%';

-- 8-1. �Ŵ����� ���� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL
    OR MANAGER_ID<>'';

-- 8-2. �Ŵ����� �ִ� ������� LAST_NAME �� JOB_ID �� ��ȸ�Ѵ�.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
     OR MANAGER_ID<>'';


-- 9. Ŀ�̼��� ���� ��� ������� LAST_NAME, ���� �� Ŀ�̼��� ��ȸ�Ѵ�.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

--    ���� ����, Ŀ�̼� �������� �����Ѵ�.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC ;

-- 10. LAST_NAME �� �׹�° ���ڰ� a �� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%';

-- 11. LAST_NAME �� a ��(OR) e ���ڰ� �ִ� ������� LAST_NAME �� ��ȸ�Ѵ�.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' 
OR LAST_NAME LIKE '%e%';

SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' 
AND LAST_NAME LIKE '%e%';

-- 12. ������ 2,500, 3,500, 7000 �� �ƴϸ� 
--������ SA_REP �̳� ST_CLERK �� ������� ��ȸ�Ѵ�.
SELECT *
FROM EMPLOYEES
WHERE SALARY NOT IN(2500, 3500, 7000)
    AND JOB_ID IN('SA_REP', 'ST_CLERK');

-- 13.������ AD_PRES �� ����� A �����, ST_MAN �� ����� B �����, 
--  IT_PROG �� ����� C �����,
--  SA_REP �� ����� D �����, ST_CLERK �� ����� E ����� ��Ÿ�� 0 �� �ο��Ͽ� ��ȸ�Ѵ�.
SELECT LAST_NAME||FIRST_NAME FULLNAME,
    CASE
    WHEN JOB_ID='AD_PRES' THEN 'A'
    WHEN JOB_ID='ST_MAN' THEN 'B'
    WHEN JOB_ID='IT_PROG' THEN 'C'
    WHEN JOB_ID='SA_REP' THEN 'D'
    WHEN JOB_ID='ST_CLERK' THEN 'E'
    ELSE 'O'
    END AS GRADE
FROM EMPLOYEES;

SELECT LAST_NAME||FIRST_NAME FULLNAME,
    CASE JOB_ID
    WHEN 'AD_PRES' THEN 'A'
    WHEN 'ST_MAN' THEN 'B'
    WHEN 'IT_PROG' THEN 'C'
    WHEN 'SA_REP' THEN 'D'
    WHEN 'ST_CLERK' THEN 'E'
    ELSE 'O'
    END AS GRADE
FROM EMPLOYEES;

SELECT LAST_NAME||FIRST_NAME FULLNAME,
    DECODE(JOB_ID
        ,'AD_PRESS', 'A'
        ,'ST_MAN', 'B'
        ,'IT_PROG', 'C'
        ,'SA_REO', 'D'
        ,'ST_CLERK', 'E'
        ,'0') AS JOB_GRADE
FROM EMPLOYEES;

-- 14. ��� ������� LAST_NAME, �μ� �̸� �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID;

-- 15. �μ���ȣ 30 ���� ��� �������� ������ �������� ��ȸ�Ѵ�. 
-- 90 �μ� ���� �����Ѵ�.
SELECT DISTINCT E.JOB_ID, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND (D.DEPARTMENT_ID<=30 
    OR D.DEPARTMENT_ID=90); 

-- 16. Ŀ�̼��� ���� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT DISTINCT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE (E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.LOCATION_ID=L.LOCATION_ID)
    AND E.COMMISSION_PCT IS NOT NULL;

-- 16-1. �þ�Ʋ�� ��� ��� �� Ŀ�̼��� ���� ��� ������� 
--LAST_NAME, �μ� ��, ���� ID �� ���� ���� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.LOCATION_ID=L.LOCATION_ID
    AND L.CITY='Seattle' 
    AND E.COMMISSION_PCT IS NOT NULL;


-- 17. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� 
--LAST_NAME �� HIRE_DATE �� ��ȸ�Ѵ�.
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE>(SELECT HIRE_DATE
                FROM EMPLOYEES
                WHERE LAST_NAME='DAVIES');
                
-- 18. �ڽ��� �Ŵ������� ���� ���� ������� LAST_NAME �� ������� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND E.HIRE_DATE<M.HIRE_DATE; 

-- 19. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES;

-- 20. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ������ �ڿ����� �����Ͽ� ��ȸ�Ѵ�.
SELECT JOB_ID,  MAX(SALARY), MIN(SALARY), SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 21. ������ ������ ���� ������� �� ���� ��ȸ�Ѵ�.
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 22-1. �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ�Ѵ�.
SELECT MANAGER_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID
;

SELECT D.MANAGER_ID, COUNT(*)
FROM EMPLOYEES E,DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.MANAGER_ID
ORDER BY D.MANAGER_ID;


-- 23. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ�Ѵ�.
SELECT MAX(SALARY),MIN(SALARY),
        (MAX(SALARY)-MIN(SALARY))
FROM EMPLOYEES;

-- 24. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ������ ��ȸ�Ѵ�.
--     �Ŵ����� ���� ������� �����Ѵ�.
--     �ּ� ������ 6000 �̸��� ���� �����Ѵ�.
--     ���� ���� �������� ��ȸ�Ѵ�.
SELECT M.EMPLOYEE_ID, MIN(E.SALARY)
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND E.MANAGER_ID IS NOT NULL
GROUP BY M.EMPLOYEE_ID
HAVING MIN(E.SALARY)>=6000
ORDER BY MIN(E.SALARY) DESC;
    

-- 25. �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ������ ��ȸ�Ѵ�.
--     ��� ������ �Ҽ��� 2 �ڸ������� ǥ���Ѵ�.
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(*), TRUNC(AVG(E.SALARY),2)
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME, LOCATION_ID;

-- 26. �� ��� �� �� 2001, 2002, 2003, 2004 �⵵ �� ���� ������� �� ���� ������ ���� ��ȸ�Ѵ�.
SELECT DISTINCT (SELECT COUNT(*)
        FROM EMPLOYEES) �ѻ��
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2001%') "2001 ���� ���"
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2002%') "2002 ���� ���"
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2003%') "2003 ���� ���"
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2004%') "2004 ���� ���"
FROM EMPLOYEES;

(SELECT COUNT(TO_CHAR(HIRE_DATE,'YYYY'))
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2001%'
    OR TO_CHAR(HIRE_DATE,'YYYY') LIKE '2002%'
    OR TO_CHAR(HIRE_DATE,'YYYY') LIKE '2003%'
    OR TO_CHAR(HIRE_DATE,'YYYY') LIKE '2004%');
    
-- 27.  �� �μ��� �� ���� �� ���� �� �� �� �� �μ��� ���� �� ���� ��ȸ�Ѵ�. 
SELECT E.DEPARTMENT_ID, E.JOB_ID, SUM(E.SALARY)
    ,(SELECT SUM(E1.SALARY)
        FROM EMPLOYEES E1
        WHERE E1.DEPARTMENT_ID=E.DEPARTMENT_ID
       ) AS DEPTSUM
FROM EMPLOYEES E
GROUP BY E.DEPARTMENT_ID, E.JOB_ID;

-- 28. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥�� ��ȸ�Ѵ�.
--     ��������� Zlotkey �� �����Ѵ�.
SELECT EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN(SELECT E.DEPARTMENT_ID
                        FROM EMPLOYEES E, DEPARTMENTS D
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                            AND LAST_NAME='Zlotkey'
                            );
                            
-- 29. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY>(SELECT AVG(SALARY)
                FROM EMPLOYEES);

-- 30-1. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT E.DEPARTMENT_ID
                        FROM EMPLOYEES E, DEPARTMENTS D
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                            AND LAST_NAME LIKE '%u%'
                            );

-- 30-2. (VIEW �̿�) LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME �� ��ȸ�Ѵ�.

-- 31-1. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.
SELECT E.LAST_NAME, D.DEPARTMENT_ID, E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.LOCATION_ID=1700;
    
-- 31-2. (VIEW �̿�)��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ�Ѵ�.

-- 32. King �� �Ŵ����� �ΰ� �ִ� ��� ������� LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT E.LAST_NAME, E.SALARY
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND M.LAST_NAME='King';
    
-- 33. EXECUTIVE �μ��� �ٹ��ϴ� ��� ������� �μ� ��ȣ, LAST_NAME, JOB_ID �� ��ȸ�Ѵ�.
SELECT E.DEPARTMENT_ID, E.LAST_NAME, E.JOB_ID 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.DEPARTMENT_NAME='Executive';

-- 34-1. ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--       �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT D.DEPARTMENT_ID
                        FROM EMPLOYEES E, DEPARTMENTS D
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                            AND SALARY>(SELECT AVG(SALARY)
                                        FROM EMPLOYEES)
                         AND LAST_NAME LIKE '%u%');

-- 34-2. (VIEW �̿�)ȸ�� ��ü ��� ���� ���� �� ���� ����� �� LAST_NAME �� u �� �ִ� �������
--       �ٹ��ϴ� �μ����� �ٹ��ϴ� ������� ���, LAST_NAME �� ������ ��ȸ�Ѵ�.

-- 35-1. ST_CLERK �� ���� ID �� ���� ����� ���� �μ� ID �� ��ȸ�Ѵ�.
--       NULL ���� �����Ѵ�. (NOT EXISTS ���)
SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN(
                            SELECT DISTINCT D.DEPARTMENT_ID
                            FROM EMPLOYEES E, DEPARTMENTS D
                            WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                                AND JOB_ID='ST_CLERK');

-- 36-1. ��ġ�� �μ��� ���� ���� ID �� ���� �̸��� ��ȸ����.(NOT EXISTS ���)
SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID NOT IN(SELECT C.COUNTRY_ID
                        FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
                        WHERE D.LOCATION_ID=L.LOCATION_ID
                        AND L.COUNTRY_ID=C.COUNTRY_ID);

-- 37. ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID �� ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN(SELECT DISTINCT E.JOB_ID
                FROM EMPLOYEES E, JOB_HISTORY J
                WHERE E.EMPLOYEE_ID=J.EMPLOYEE_ID);


-- 41. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY IN(SELECT E.SALARY
                FROM EMPLOYEES E, DEPARTMENTS D
                WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                    AND COMMISSION_PCT IS NOT NULL);

-- 42. ��ġ ID �� 1700 �� ������� ������ Ŀ�̼��� ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE (SALARY,NVL(COMMISSION_PCT,0)) IN(SELECT E.SALARY,NVL(E.COMMISSION_PCT,0)
                        FROM DEPARTMENTS D, LOCATIONS L, EMPLOYEES E
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                        AND D.LOCATION_ID=L.LOCATION_ID
                            AND L.LOCATION_ID=1700)
                            ;

-- 43. LAST_NAME �� 'Kochhar' �� ����� ������ ���� �� Ŀ�̼��� ���� 
--������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ�Ѵ�.
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE (SALARY, NVL(COMMISSION_PCT,0)) IN (SELECT SALARY, NVL(COMMISSION_PCT,0)
                                FROM EMPLOYEES
                                WHERE LAST_NAME='Kochhar'
                                );

-- 44. ���� ID �� SA_MAN �� ������� ���� �� �ִ� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ�Ѵ�.
SELECT  LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY>(SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE JOB_ID='SA_MAN');

-- 45. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT  EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID
                        FROM LOCATIONS L, DEPARTMENTS D
                        WHERE L.LOCATION_ID=D.LOCATION_ID
                            AND CITY LIKE 'T%'             
);

-- 46.  �� �μ��� ��� �������� �� �޴� ���Ϻμ� �ٹ��������
--      LAST_NAME, ����, �μ���ȣ �� �ش� �μ��� ��� ������ ��ȸ�Ѵ�.
--      ����� �μ��� ������ �������� �����Ѵ�.
SELECT E.LAST_NAME, E.SALARY, D.DEPARTMENT_ID, AVG(E.SALARY)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND E.SALARY>(SELECT AVG(SALARY)
                    FROM EMPLOYEES)
                    GROUP BY E.LAST_NAME, E.SALARY, D.DEPARTMENT_ID
                    ORDER BY D.DEPARTMENT_ID, E.SALARY;

-- 48. �ҼӺμ��� ��� �������� ���� ���� ������� last_name �� ��ȸ�Ѵ�.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE SALARY<(SELECT AVG(E.SALARY)
                FROM EMPLOYEES E, DEPARTMENTS D
                WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID);
                
-- 49. �� ��� �� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� ����� �����ϴ� ��� ������� last_name �� ��ȸ�Ѵ�.
SELECT DISTINCT E.LAST_NAME
FROM EMPLOYEES E, EMPLOYEES E1
WHERE E.DEPARTMENT_ID=E1.DEPARTMENT_ID
    AND E.HIRE_DATE<E1.HIRE_DATE
    AND E.SALARY<E1.SALARY;

--1. ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� �Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�. 
--   ��� �� �⵵�� �������� �������� �����Ͻÿ�. 
SELECT TO_CHAR(HIRE_DATE,'YYYY'), TRUNC(AVG(SALARY))             
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID=J.JOB_ID
    AND JOB_TITLE='Sales Manager'
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
ORDER BY TO_CHAR(HIRE_DATE,'YYYY');

--2. �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
--   ��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ���, �ش� ������ �������� ����Ͻÿ�. 
--   ��, ���ÿ� �� ���ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.
SELECT L.CITY, TRUNC(AVG(E.SALARY)), COUNT(*)
FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND L.LOCATION_ID=D.LOCATION_ID
GROUP BY L.CITY
HAVING COUNT(*)<10
ORDER BY AVG(E.SALARY);
 
--3. ��Public  Accountant���� ��å(job_title)���� ���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�. 
--   (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.)      
--   �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME||E.LAST_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J, JOB_HISTORY JH
WHERE J.JOB_ID=JH.JOB_ID
    AND E.EMPLOYEE_ID=JH.EMPLOYEE_ID
    AND J.JOB_TITLE='Public Accountant';


--4. �ڽ��� �Ŵ������� ����(salary)�� ���� �޴� �������� ��(last_name)�� ����(salary)�� �� ���Ͻÿ�. 
SELECT  E.LAST_NAME, E.SALARY
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND E.SALARY>M.SALARY;
    
--5. 2007�⿡ �Ի�(hire_date)�� �������� ���(employee_id), �̸�(first_name), ��(last_name), 
--   �μ���(department_name)�� ��ȸ�մϴ�.  
--   �̶�, �μ��� ��ġ���� ���� ������ ���, ��<Not Assigned>���� ����Ͻÿ�.

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, NVL(D.DEPARTMENT_NAME, '<Not Assigned>')
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID(+)
AND TO_CHAR(HIRE_DATE, 'YYYYMMDD') LIKE '2007%';

--6. ������(job_title)�� ��Sales Representative���� ���� �߿��� ����(salary)�� 9,000�̻�, 10,000 ������ 
--   �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID=J.JOB_ID
    AND JOB_TITLE='Sales Representative'
    AND SALARY BETWEEN 9000 AND 10000;

--7. �μ����� ���� ���� �޿��� �ް� �ִ� ������ �̸�, �μ��̸�, �޿��� ����Ͻÿ�. 
--   �̸��� last_name�� ����ϸ�, �μ��̸����� �������� �����ϰ�, 
--   �μ��� ���� ��� �̸��� ���� ���� �������� �����Ͽ� ����մϴ�. 
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, E.SALARY
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND E.SALARY = (SELECT MIN(E.SALARY)
                    FROM EMPLOYEES E, DEPARTMENTS D
                    WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID)
ORDER BY D.DEPARTMENT_NAME, E.LAST_NAME;

SELECT 
       E.LAST_NAME, A.*
  FROM EMPLOYEES E, 
      (
      SELECT 
             d.DEPARTMENT_NAME, MIN(e.SALARY) AS MIN_SALARY
        FROM EMPLOYEES e, DEPARTMENTS d 
       WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
       GROUP BY d.DEPARTMENT_NAME
      ) A 
 WHERE E.SALARY = A.MIN_SALARY
 ORDER BY A.DEPARTMENT_NAME ASC, E.LAST_NAME ASC
;
--8. EMPLOYEES ���̺��� �޿��� ���� �޴� ������� ��ȸ���� �� ���ó�� 6��°���� 10 ��°���� 
--   5���� last_name, first_name, salary�� ��ȸ�ϴ� sql������ �ۼ��Ͻÿ�.
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM (SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC)
WHERE ROWNUM>5 
    AND ROWNUM<=10;

--9. ����� �μ��� ���� ����(city)�� ��Seattle���� ����� �̸�, �ش� ����� �Ŵ��� �̸�, ��� �� �μ��̸��� ����Ͻÿ�. 
--   �̶� ����� �Ŵ����� ���� ��� ��<����>���̶�� ����Ͻÿ�. �̸��� last_name�� ����ϸ�, 
--   ����� �̸��� ������������ �����Ͻÿ�. 

--10. �� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�. ���� ������ ���� ���� �������� 
--    ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�. �� ���������� 30,000���� ū ������ ����Ͻÿ�. 

--11. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), ������(job_title), 
--    �μ� ��(department_name)�� ��ȸ�Ͻÿ�. 
--    �� ���ø�(city)�� ��Seattle���� ����(location)�� �μ� (department)�� �ٹ��ϴ� ������ �����ȣ �������������� ����Ͻÿ�.

--12. 2001~20003����̿� �Ի��� ������ �̸�(first_name), �Ի���(hire_date), �����ڻ�� (employee_id), 
--    ������ �̸�(fist_name)�� ��ȸ�մϴ�. ��, �����ڰ� ���� ��������� ��� ����� ���Խ��� ����Ѵ�.

--13. ��Sales�� �μ��� ���� ������ �̸�(first_name), �޿�(salary), �μ��̸�(department_name)�� ��ȸ�Ͻÿ�. 
--    ��, �޿��� 100�� �μ��� ��պ��� ���� �޴� ���� ������ ��µǾ�� �Ѵ�. 

--14. Employees ���̺��� �Ի��Ѵ�(hire_date)���� �ο����� ��ȸ�Ͻÿ�.

--15. �μ��� �������� �ִ�, �ּ�, ��ձ޿��� ��ȸ�ϵ�, 
--    ��ձ޿��� ��IT�� �μ��� ��ձ޿����� ����, ��Sales�� �μ��� ��պ��� ���� �μ� ������ ����Ͻÿ�. 

--16. �� �μ����� ������ �Ѹ� �ִ� �μ��� ��ȸ�Ͻÿ�. 
--    ��, ������ ���� �μ��� ���ؼ��� ��<�Ż��μ�>����� ���ڿ��� ��µǵ��� �ϰ�,
--    ��°���� ������ ���� �μ����� �������� ���� ���ĵǾ���Ѵ�. 

--17. �μ��� �Ի���� �������� ����Ͻÿ�. 
--    ��, �������� 5�� �̻��� �μ��� ��µǾ�� �ϸ� ��°���� �μ��̸� ������ �Ѵ�.

--18. ����(country_name) �� ����(city)�� �������� ��ȸ�Ͻÿ�. 
--    ��, �μ��� �������� ���� ���� �� �ֱ� ������ 106���� ������ ����� �ȴ�. 
--    �μ������� ���� ������ ������� ���ø� ��ſ� ��<�μ�����>���� ��µǵ��� �Ͽ� 107�� ��� ��µǰ� �Ѵ�.

--19. �� �μ��� �ִ� �޿����� ���̵�(employee_id), �̸�(first_name), �޿�(salary)�� ����Ͻÿ�. 
--    ��, �ִ� �޿��ڰ� ���� �μ��� ��ձ޿��� ���������� ����Ͽ� ��ձ޿��� ���� �� �ְ� �� ��.

--20. Ŀ�̼�(commission_pct)�� �������� ��ȸ�Ͻÿ�. 
--    Ŀ�̼��� �Ʒ�������ó�� 0.2, 0.25�� ��� .2��, 0.3, 0.35�� .3 ���·� ��µǾ�� �Ѵ�. 
--    ��, Ŀ�̼� ������ ���� �����鵵 �ִ� �� Ŀ�̼��� ���� ���� �׷��� ��<Ŀ�̼� ����>���� ��µǰ� �Ѵ�.

--21. Ŀ�̼�(commission_pct)�� ���� ���� ���� ���� 4���� �μ���(department_name), 
--    ������ (first_name), �޿�(salary), Ŀ�̼�(commission_pct) ������ ��ȸ�Ͻÿ�. 
--    ��°���� Ŀ�̼� �� ���� �޴� ������ ����ϵ� ������ Ŀ�̼ǿ� ���ؼ��� �޿��� ���� ������ ���� ��� �ǰ� �Ѵ�.

--Q1 �μ���, ������(first_name),�޿�,Ŀ�̼� �÷��� ���� �並 �ۼ��Ͻÿ�.
--�� Ŀ�̼� ����Ʈ�� ���� ��� 0���� ��ȯ

--Q2 �μ���, ��å, ������, �Ի����� ���� �並 �ۼ��Ͻÿ�.

--Q3 �μ����̺��� �����Ͽ� �� ���̺��� ����� �� ���̺� ������ �÷��� �߰��ϰ� �ʱⰪ�� ������ �� ������ �Ի� �� ���� ������ �÷��� �����ϴ� Ʈ���Ÿ� �ۼ��Ͻÿ�

--Q4 �μ�ID�� �Է��ϸ� �μ����� ��ȯ�ϴ� �Լ��� �ۼ��Ͻÿ�.

--Q4 �μ�ID�� �Է��ϸ� �ش� �μ��� ���� ����� ����ϴ� ���ν����� �ۼ��Ͻÿ�.

