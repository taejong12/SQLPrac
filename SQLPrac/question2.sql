-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY>=12000;

-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID=176;

-- 3. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 5000 AND 12000;

SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY<5000 OR SALARY>12000;

-- 4. 1998/02/20 일부터 1998/05/01 사이에 고용된 사원들의 
--LAST_NAME 사번, 고용일자를 조회한다.
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
    
-- 5. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.
    SELECT LAST_NAME, DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN(20,50)
    ORDER BY LAST_NAME;
    
-- 6. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다.
    SELECT LAST_NAME, SALARY
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID IN(20,50) 
        AND SALARY BETWEEN 5000 AND 12000;
        
-- 7. 2005년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
    SELECT LAST_NAME, HIRE_DATE
    FROM EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE,'YYYYMMDD') LIKE '2005%';

-- 8-1. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL
    OR MANAGER_ID<>'';

-- 8-2. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
     OR MANAGER_ID<>'';


-- 9. 커미션을 버는 모든 사원들의 LAST_NAME, 연봉 및 커미션을 조회한다.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

--    연봉 역순, 커미션 역순차로 정렬한다.
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC, COMMISSION_PCT DESC ;

-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '___a%';

-- 11. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' 
OR LAST_NAME LIKE '%e%';

SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%a%' 
AND LAST_NAME LIKE '%e%';

-- 12. 연봉이 2,500, 3,500, 7000 이 아니며 
--직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT *
FROM EMPLOYEES
WHERE SALARY NOT IN(2500, 3500, 7000)
    AND JOB_ID IN('SA_REP', 'ST_CLERK');

-- 13.직업이 AD_PRES 인 사람은 A 등급을, ST_MAN 인 사람은 B 등급을, 
--  IT_PROG 인 사람은 C 등급을,
--  SA_REP 인 사람은 D 등급을, ST_CLERK 인 사람은 E 등급을 기타는 0 을 부여하여 조회한다.
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

-- 14. 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회한다.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID;

-- 15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 
-- 90 부서 또한 포함한다.
SELECT DISTINCT E.JOB_ID, D.DEPARTMENT_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND (D.DEPARTMENT_ID<=30 
    OR D.DEPARTMENT_ID=90); 

-- 16. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT DISTINCT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE (E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.LOCATION_ID=L.LOCATION_ID)
    AND E.COMMISSION_PCT IS NOT NULL;

-- 16-1. 시애틀에 사는 사람 중 커미션을 버는 모든 사람들의 
--LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.LOCATION_ID=L.LOCATION_ID
    AND L.CITY='Seattle' 
    AND E.COMMISSION_PCT IS NOT NULL;


-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 
--LAST_NAME 및 HIRE_DATE 을 조회한다.
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE>(SELECT HIRE_DATE
                FROM EMPLOYEES
                WHERE LAST_NAME='DAVIES');
                
-- 18. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다.
SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND E.HIRE_DATE<M.HIRE_DATE; 

-- 19. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES;

-- 20. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT JOB_ID,  MAX(SALARY), MIN(SALARY), SUM(SALARY), TRUNC(AVG(SALARY))
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 21. 동일한 직업을 가진 사원들의 총 수를 조회한다.
SELECT JOB_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 22-1. 매니저로 근무하는 사원들의 총 수를 조회한다.
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


-- 23. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.
SELECT MAX(SALARY),MIN(SALARY),
        (MAX(SALARY)-MIN(SALARY))
FROM EMPLOYEES;

-- 24. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉이 6000 미만인 경우는 제외한다.
--     연봉 기준 역순으로 조회한다.
SELECT M.EMPLOYEE_ID, MIN(E.SALARY)
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND E.MANAGER_ID IS NOT NULL
GROUP BY M.EMPLOYEE_ID
HAVING MIN(E.SALARY)>=6000
ORDER BY MIN(E.SALARY) DESC;
    

-- 25. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉을 조회한다.
--     평균 연봉은 소수점 2 자리까지만 표현한다.
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, COUNT(*), TRUNC(AVG(E.SALARY),2)
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME, LOCATION_ID;

-- 26. 총 사원 수 및 2001, 2002, 2003, 2004 년도 별 고용된 사원들의 총 수를 다음과 같이 조회한다.
SELECT DISTINCT (SELECT COUNT(*)
        FROM EMPLOYEES) 총사원
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2001%') "2001 고용된 사원"
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2002%') "2002 고용된 사원"
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2003%') "2003 고용된 사원"
        ,(SELECT COUNT(*)
            FROM EMPLOYEES
            WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2004%') "2004 고용된 사원"
FROM EMPLOYEES;

(SELECT COUNT(TO_CHAR(HIRE_DATE,'YYYY'))
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2001%'
    OR TO_CHAR(HIRE_DATE,'YYYY') LIKE '2002%'
    OR TO_CHAR(HIRE_DATE,'YYYY') LIKE '2003%'
    OR TO_CHAR(HIRE_DATE,'YYYY') LIKE '2004%');
    
-- 27.  각 부서별 각 직업 별 연봉 총 합 및 각 부서별 연봉 총 합을 조회한다. 
SELECT E.DEPARTMENT_ID, E.JOB_ID, SUM(E.SALARY)
    ,(SELECT SUM(E1.SALARY)
        FROM EMPLOYEES E1
        WHERE E1.DEPARTMENT_ID=E.DEPARTMENT_ID
       ) AS DEPTSUM
FROM EMPLOYEES E
GROUP BY E.DEPARTMENT_ID, E.JOB_ID;

-- 28. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
--     결과값에서 Zlotkey 는 제외한다.
SELECT EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN(SELECT E.DEPARTMENT_ID
                        FROM EMPLOYEES E, DEPARTMENTS D
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                            AND LAST_NAME='Zlotkey'
                            );
                            
-- 29. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 을 조회한다.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY>(SELECT AVG(SALARY)
                FROM EMPLOYEES);

-- 30-1. LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT E.DEPARTMENT_ID
                        FROM EMPLOYEES E, DEPARTMENTS D
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                            AND LAST_NAME LIKE '%u%'
                            );

-- 30-2. (VIEW 이용) LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.

-- 31-1. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.
SELECT E.LAST_NAME, D.DEPARTMENT_ID, E.JOB_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.LOCATION_ID=1700;
    
-- 31-2. (VIEW 이용)위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.

-- 32. King 을 매니저로 두고 있는 모든 사원들의 LAST_NAME 및 연봉을 조회한다.
SELECT E.LAST_NAME, E.SALARY
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND M.LAST_NAME='King';
    
-- 33. EXECUTIVE 부서에 근무하는 모든 사원들의 부서 번호, LAST_NAME, JOB_ID 를 조회한다.
SELECT E.DEPARTMENT_ID, E.LAST_NAME, E.JOB_ID 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND D.DEPARTMENT_NAME='Executive';

-- 34-1. 회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이
--       근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT D.DEPARTMENT_ID
                        FROM EMPLOYEES E, DEPARTMENTS D
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                            AND SALARY>(SELECT AVG(SALARY)
                                        FROM EMPLOYEES)
                         AND LAST_NAME LIKE '%u%');

-- 34-2. (VIEW 이용)회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이
--       근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.

-- 35-1. ST_CLERK 인 직업 ID 를 가진 사원이 없는 부서 ID 를 조회한다.
--       NULL 값은 제외한다. (NOT EXISTS 사용)
SELECT DISTINCT DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN(
                            SELECT DISTINCT D.DEPARTMENT_ID
                            FROM EMPLOYEES E, DEPARTMENTS D
                            WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                                AND JOB_ID='ST_CLERK');

-- 36-1. 위치한 부서가 없는 국가 ID 및 국가 이름을 조회힌다.(NOT EXISTS 사용)
SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_ID NOT IN(SELECT C.COUNTRY_ID
                        FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
                        WHERE D.LOCATION_ID=L.LOCATION_ID
                        AND L.COUNTRY_ID=C.COUNTRY_ID);

-- 37. 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 를 조회한다.
SELECT EMPLOYEE_ID, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN(SELECT DISTINCT E.JOB_ID
                FROM EMPLOYEES E, JOB_HISTORY J
                WHERE E.EMPLOYEE_ID=J.EMPLOYEE_ID);


-- 41. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY IN(SELECT E.SALARY
                FROM EMPLOYEES E, DEPARTMENTS D
                WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                    AND COMMISSION_PCT IS NOT NULL);

-- 42. 위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.
SELECT LAST_NAME, DEPARTMENT_ID, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE (SALARY,NVL(COMMISSION_PCT,0)) IN(SELECT E.SALARY,NVL(E.COMMISSION_PCT,0)
                        FROM DEPARTMENTS D, LOCATIONS L, EMPLOYEES E
                        WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
                        AND D.LOCATION_ID=L.LOCATION_ID
                            AND L.LOCATION_ID=1700)
                            ;

-- 43. LAST_NAME 이 'Kochhar' 인 사원과 동일한 연봉 및 커미션을 버는 
--사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE (SALARY, NVL(COMMISSION_PCT,0)) IN (SELECT SALARY, NVL(COMMISSION_PCT,0)
                                FROM EMPLOYEES
                                WHERE LAST_NAME='Kochhar'
                                );

-- 44. 직업 ID 가 SA_MAN 인 사원들이 받을 수 있는 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.
SELECT  LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY>(SELECT MAX(SALARY)
                FROM EMPLOYEES
                WHERE JOB_ID='SA_MAN');

-- 45. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회한다.
SELECT  EMPLOYEE_ID, LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID
                        FROM LOCATIONS L, DEPARTMENTS D
                        WHERE L.LOCATION_ID=D.LOCATION_ID
                            AND CITY LIKE 'T%'             
);

-- 46.  각 부서별 평균 연봉보다 더 받는 동일부서 근무사원들의
--      LAST_NAME, 연봉, 부서번호 및 해당 부서의 평균 연봉을 조회한다.
--      결과는 부서별 연봉을 기준으로 정렬한다.
SELECT E.LAST_NAME, E.SALARY, D.DEPARTMENT_ID, AVG(E.SALARY)
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND E.SALARY>(SELECT AVG(SALARY)
                    FROM EMPLOYEES)
                    GROUP BY E.LAST_NAME, E.SALARY, D.DEPARTMENT_ID
                    ORDER BY D.DEPARTMENT_ID, E.SALARY;

-- 48. 소속부서의 평균 연봉보다 적게 버는 사원들의 last_name 을 조회한다.
SELECT LAST_NAME
FROM EMPLOYEES
WHERE SALARY<(SELECT AVG(E.SALARY)
                FROM EMPLOYEES E, DEPARTMENTS D
                WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID);
                
-- 49. 각 사원 별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 last_name 을 조회한다.
SELECT DISTINCT E.LAST_NAME
FROM EMPLOYEES E, EMPLOYEES E1
WHERE E.DEPARTMENT_ID=E1.DEPARTMENT_ID
    AND E.HIRE_DATE<E1.HIRE_DATE
    AND E.SALARY<E1.SALARY;

--1. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
--   출력 시 년도를 기준으로 오름차순 정렬하시오. 
SELECT TO_CHAR(HIRE_DATE,'YYYY'), TRUNC(AVG(SALARY))             
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID=J.JOB_ID
    AND JOB_TITLE='Sales Manager'
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
ORDER BY TO_CHAR(HIRE_DATE,'YYYY');

--2. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
--   평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 
--   단, 도시에 근 무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.
SELECT L.CITY, TRUNC(AVG(E.SALARY)), COUNT(*)
FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
    AND L.LOCATION_ID=D.LOCATION_ID
GROUP BY L.CITY
HAVING COUNT(*)<10
ORDER BY AVG(E.SALARY);
 
--3. ‘Public  Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오. 
--   (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.)      
--   이름은 first_name, last_name을 아래의 실행결과와 같이 출력한다.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME||E.LAST_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J, JOB_HISTORY JH
WHERE J.JOB_ID=JH.JOB_ID
    AND E.EMPLOYEE_ID=JH.EMPLOYEE_ID
    AND J.JOB_TITLE='Public Accountant';


--4. 자신의 매니저보다 연봉(salary)를 많이 받는 직원들의 성(last_name)과 연봉(salary)를 출 력하시오. 
SELECT  E.LAST_NAME, E.SALARY
FROM EMPLOYEES E, EMPLOYEES M
WHERE E.MANAGER_ID=M.EMPLOYEE_ID
    AND E.SALARY>M.SALARY;
    
--5. 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 이름(first_name), 성(last_name), 
--   부서명(department_name)을 조회합니다.  
--   이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시오.

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, NVL(D.DEPARTMENT_NAME, '<Not Assigned>')
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID(+)
AND TO_CHAR(HIRE_DATE, 'YYYYMMDD') LIKE '2007%';

--6. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 연봉(salary)이 9,000이상, 10,000 이하인 
--   직원들의 이름(first_name), 성(last_name)과 연봉(salary)를 출력하시오
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID=J.JOB_ID
    AND JOB_TITLE='Sales Representative'
    AND SALARY BETWEEN 9000 AND 10000;

--7. 부서별로 가장 적은 급여를 받고 있는 직원의 이름, 부서이름, 급여를 출력하시오. 
--   이름은 last_name만 출력하며, 부서이름으로 오름차순 정렬하고, 
--   부서가 같은 경우 이름을 기준 으로 오름차순 정렬하여 출력합니다. 
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
--8. EMPLOYEES 테이블에서 급여를 많이 받는 순서대로 조회했을 때 결과처럼 6번째부터 10 번째까지 
--   5명의 last_name, first_name, salary를 조회하는 sql문장을 작성하시오.
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM (SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC)
WHERE ROWNUM>5 
    AND ROWNUM<=10;

--9. 사원의 부서가 속한 도시(city)가 ‘Seattle’인 사원의 이름, 해당 사원의 매니저 이름, 사원 의 부서이름을 출력하시오. 
--   이때 사원의 매니저가 없을 경우 ‘<없음>’이라고 출력하시오. 이름은 last_name만 출력하며, 
--   사원의 이름을 오름차순으로 정렬하시오. 

--10. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다. 연봉 총합이 가장 높은 업무부터 
--    업무명(job_title)과 연봉 총합을 조회하시오. 단 연봉총합이 30,000보다 큰 업무만 출력하시오. 

--11. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 업무명(job_title), 
--    부서 명(department_name)을 조회하시오. 
--    단 도시명(city)이 ‘Seattle’인 지역(location)의 부서 (department)에 근무하는 직원을 사원번호 오름차순순으로 출력하시오.

--12. 2001~20003년사이에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 
--    관리자 이름(fist_name)을 조회합니다. 단, 관리자가 없는 사원정보도 출력 결과에 포함시켜 출력한다.

--13. ‘Sales’ 부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오. 
--    단, 급여는 100번 부서의 평균보다 적게 받는 직원 정보만 출력되어야 한다. 

--14. Employees 테이블에서 입사한달(hire_date)별로 인원수를 조회하시오.

--15. 부서별 직원들의 최대, 최소, 평균급여를 조회하되, 
--    평균급여가 ‘IT’ 부서의 평균급여보다 많고, ‘Sales’ 부서의 평균보다 적은 부서 정보만 출력하시오. 

--16. 각 부서별로 직원이 한명만 있는 부서만 조회하시오. 
--    단, 직원이 없는 부서에 대해서는 ‘<신생부서>’라는 문자열이 출력되도록 하고,
--    출력결과는 다음과 같이 부서명이 내림차순 으로 정렬되어야한다. 

--17. 부서별 입사월별 직원수를 출력하시오. 
--    단, 직원수가 5명 이상인 부서만 출력되어야 하며 출력결과는 부서이름 순으로 한다.

--18. 국가(country_name) 별 도시(city)별 직원수를 조회하시오. 
--    단, 부서에 속해있지 않은 직원 이 있기 때문에 106명의 직원만 출력이 된다. 
--    부서정보가 없는 직원은 국가명과 도시명 대신에 ‘<부서없음>’이 출력되도록 하여 107명 모두 출력되게 한다.

--19. 각 부서별 최대 급여자의 아이디(employee_id), 이름(first_name), 급여(salary)를 출력하시오. 
--    단, 최대 급여자가 속한 부서의 평균급여를 마지막으로 출력하여 평균급여와 비교할 수 있게 할 것.

--20. 커미션(commission_pct)별 직원수를 조회하시오. 
--    커미션은 아래실행결과처럼 0.2, 0.25는 모두 .2로, 0.3, 0.35는 .3 형태로 출력되어야 한다. 
--    단, 커미션 정보가 없는 직원들도 있는 데 커미션이 없는 직원 그룹은 ‘<커미션 없음>’이 출력되게 한다.

--21. 커미션(commission_pct)을 가장 많이 받은 상위 4명의 부서명(department_name), 
--    직원명 (first_name), 급여(salary), 커미션(commission_pct) 정보를 조회하시오. 
--    출력결과는 커미션 을 많이 받는 순서로 출력하되 동일한 커미션에 대해서는 급여가 높은 직원이 먼저 출력 되게 한다.

--Q1 부서명, 직원명(first_name),급여,커미션 컬럼을 갖는 뷰를 작성하시요.
--단 커미션 포인트가 없을 경우 0으로 반환

--Q2 부서명, 직책, 직원명, 입사일을 갖는 뷰를 작성하시오.

--Q3 부서테이블을 복사하여 새 테이블을 만들고 그 테이블에 직원수 컬럼을 추가하고 초기값을 셋팅한 후 직원의 입사 및 퇴사시 직원수 컬럼을 조정하는 트리거를 작성하시오

--Q4 부서ID를 입력하면 부서명을 반환하는 함수를 작성하시오.

--Q4 부서ID를 입력하면 해당 부서의 직원 목록을 출력하는 프로시저를 작성하시오.

