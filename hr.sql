-- 1. 사원번호가 176인 사원의 last_name, 부서번호 정보 조회
SELECT last_name, department_id
FROM EMPLOYEES
WHERE employee_id = 176;

-- 2. 연봉이 12000 이상 되는 직원들의 last_name, 급여 조회
SELECT last_name, salary
FROM EMPLOYEES
WHERE salary >= 12000;

-- 3. 연봉이 5000 ~ 12000 범위가 아닌 사람들의 last_name, 급여 조회
SELECT last_name, salary
FROM EMPLOYEES
WHERE salary < 5000 OR salary > 12000;

-- 4. 20, 50번 부서에 근무하는 사원들의 last_name, 부서번호를 오름차순 조회
SELECT last_name, department_id
FROM EMPLOYEES
WHERE department_id IN (20, 50)
ORDER BY 1, 2;

-- 5. 커미션을 받는 모든 사원들의 last_name, 급여, 커미션을 조회, 급여 내림차순, 커미션 내림차순 조회
SELECT last_name, salary, commission_pct
FROM EMPLOYEES
WHERE commission_pct > 0
ORDER BY salary DESC, commission_pct DESC;

-- 6. 연봉이 2500, 3500, 7000이 아니며 직무가 sa_rep, st_clerk인 사원 조회
SELECT *
FROM EMPLOYEES
WHERE salary * 12 NOT IN (2500, 3500, 7000)
AND job_id IN ('SA_REP', 'ST_CLERK');

-- 7. 2015-02-20 ~ 2015-05-01 사이에 고용된 사원들의 last_name, 사번, 고용일자 조회
-- 고용일자 내림차순
SELECT last_name, employee_id, hire_date
FROM EMPLOYEES
WHERE hire_date >= '20150220' AND hire_date <= '20150501'
ORDER BY hire_date DESC;

-- 8. 20, 50번 부서에 근무하는 사원들 중에서 연봉이 5000 ~ 12000인 사원들의 last_name, 급여를 조회 후 급여 오름차순 정렬
SELECT last_name, salary
FROM EMPLOYEES
WHERE department_id IN (20, 50)
AND salary BETWEEN 5000 AND 12000
ORDER BY salary

-- 9. 연봉이 5000 ~ 12000이 아닌 사원들의 last_name, 급여를 조회 후 급여의 오름차순 정렬
SELECT last_name, salary
FROM EMPLOYEES 
WHERE salary NOT BETWEEN 5000 AND 12000
ORDER BY salary;

-- 10. 2015-02-20 ~ 2015-05-01 사이에 고용된 사원들의 last_name, 사번, 고용일자 조회
-- 고용일자 내림차순
SELECT last_name, employee_id, hire_date
FROM EMPLOYEES
WHERE hire_date BETWEEN '20150220' AND '20150501'
ORDER BY hire_date DESC;

-- 11. last_name에 u가 포함되는 사원들의 사번, last_name 조회
SELECT employee_id, last_name
FROM EMPLOYEES
WHERE last_name LIKE '%u%';

-- 12. last_name에 네번째 글자가 a인 사원들의 last_name 조회
SELECT last_name
FROM EMPLOYEES
WHERE last_name LIKE '___a%';

-- 13. last_name에 a 혹은 e 글자가 있는 사원들의 last_name 조회 및 last_name 오름차순
SELECT last_name
FROM EMPLOYEES
WHERE last_name LIKE '%a%' OR last_name LIKE '%e%'
ORDER BY last_name;

-- 14. last_name에 a, e 글자가 포함된 사원들의 last_name을 조회하여 last_name으로 오름차순
SELECT last_name
FROM EMPLOYEES
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%'
ORDER BY last_name;

-- 15. manager_id가 없는 사원들의 last_name, job_id 조회
SELECT last_name, job_id
FROM EMPLOYEES
WHERE manager_id IS NULL;

-- 16. 직무가 ST_CLERK인 사원이 근무하고 있지 않은 부서 id 조회
-- 단, 부서번호가 NULL인 것은 제외
SELECT department_id
FROM EMPLOYEES
WHERE job_id <> 'ST_CLERK'
AND department_id IS NOT NULL;

-- 17. COMMISSION_PCT가 NULL이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT를 구하여 
-- 사번, FIRST_NAME, JOB_ID 조회
SELECT employee_id, first_name, job_id, salary * commission_pct AS commission
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL

-- 함수
-- 18. FIRST_NAME이 Curtis인 사람의 first_name, last_name, email, phone_number, job_id 조회
-- 단, job_id 결과는 소문자로 출력
SELECT first_name, last_name, email, phone_number, LOWER(job_id)
FROM EMPLOYEES
WHERE first_name = 'Curtis';

-- 19. 부서번호가 60, 70, 80, 90인 사원들의 사원번호, first_name, hire_date, job_id 조회
-- 단, job_id가 IT_PROG인 사원의 경우 프로그래머로 변경하여 출력
SELECT employee_id, first_name, hire_date, REPLACE(job_id, 'IT_PROG', '프로그래머')
FROM EMPLOYEES
WHERE department_id IN (60, 70, 80, 90);

-- 20. job_id가 AD_PRES, PU_CLERK인 사원들의 사원번호, first_name, last_name, 부서번호, job_id 조회
-- 단, 사원명은 first_name과 last_name을 연결하여 출력
SELECT first_name || ' ' || last_name, department_id, job_id
FROM EMPLOYEES
WHERE job_id IN ('AD_PRES', 'PU_CLERK');

-- 다중행 함수
-- 21. 회사 내의 최대연봉 및 최소연봉의 차이를 조회
-- sal_gap
SELECT MAX(SALARY) - MIN(SALARY) AS sal_gap
FROM EMPLOYEES;

-- 22. 매니저로 근무하는 사원들의 총 숫자 조회
SELECT COUNT(DISTINCT MANAGER_ID) AS 매니저수
FROM EMPLOYEES;

-- 23. 매니저가 없는 사원들은 제외하고 매니저가 관리하는 사원들 중에서
-- 최소 급여를 받는 사위 조회(단, 매니저가 관리하는 사원 중에서 연봉이 6000 미만인 사원 제외)
-- 매니저아이디 최소급여
SELECT MANAGER_ID, MIN(SALARY)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
HAVING MIN(SALARY) >= 6000
ORDER BY MANAGER_ID;

-- JOIN
-- 24. 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기
-- EMPLOYEES SELF JOIN
SELECT 
	E1.FIRST_NAME || ' ' || E1.LAST_NAME AS 내이름, 
	E1.HIRE_DATE AS 내입사일, 
	E2.FIRST_NAME || ' ' || E2.LAST_NAME AS 담당매니저이름, 
	E2.HIRE_DATE AS 담당매니저입사일
FROM EMPLOYEES E1
JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID
AND E1.HIRE_DATE < E2.HIRE_DATE;

-- 25. 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
-- EMPLOYEES, DEPARTMENTS, LOCATIONS
SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, L.CITY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID
WHERE L.CITY LIKE 'T%';

-- 26. 위치 ID가 1700인 사원들의 사번, LAST_NAME, 부서번호, 연봉 조회
-- EMPLOYEES, DEPARTMENTS
SELECT E.EMPLOYEE_ID, E.LAST_NAME, D.DEPARTMENT_ID, E.SALARY
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.LOCATION_ID = 1700;

-- 27. 부서명, 위치ID, 각 부서별 사원총수, 부서별 평균연봉 조회, 평균연봉은 소수점 2째자리 까지만
-- EMPLOYEES, DEPARTMENTS
SELECT
	D.DEPARTMENT_NAME,
	D.LOCATION_ID,
	COUNT(*) AS 사원총수,
	ROUND(AVG(E.SALARY), 2) AS 평균연봉
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.LOCATION_ID;

-- 28. Executive 부서에 근무하는 모든 사원들의 LAST_NAME, 부서번호, 부서명, JOB_ID 조회
-- EMPLOYEES, DEPARTMENTS
SELECT E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.JOB_ID
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'Executive';

-- 29. 각 사원별 소속부서에서 자신보다 늦게 고용 되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 이름 조회
-- 이름은 FIRST_NAME, LAST_NAME을 연결하여 출력
-- EMPLOYEES SELF JOIN
SELECT 
	E1.FIRST_NAME || ' ' || E1.LAST_NAME, 
	E1.HIRE_DATE, 
	E1.SALARY, 
	E2.FIRST_NAME || ' ' || E2.LAST_NAME, 
	E2.HIRE_DATE, 
	E2.SALARY
FROM EMPLOYEES E1
JOIN EMPLOYEES E2
ON E1.HIRE_DATE < E2.HIRE_DATE
AND E1.SALARY < E2.SALARY;

-- 서브쿼리
-- 30. JOB_ID가 'SA_MAN'인 사원들의 최대 연봉보다 높게 받는 사원들의 LAST_NAME, JOB_ID, SALARY 조회
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY > ALL (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN');

-- 31. 커미션을 받는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서번호, 급여 조회
SELECT LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL);

-- 32. 회사 전체 평균 연봉보다 더 버는 사원들 중 LAST_NAME에 u가 들어있는 사원들이 근무하는 부서에서
-- 근무하는 사원들의 사번, last_name, salary 조회
-- 단, 평균연봉은 반올림한 후 비교
SELECT EMPLOYEE_ID, LAST_NAME, SALARY 
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (
	SELECT DISTINCT EMPLOYEE_ID
	FROM EMPLOYEES
	WHERE SALARY > (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES)
	AND LAST_NAME LIKE '%u%'
);

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY 
FROM EMPLOYEES E, (
	SELECT DISTINCT EMPLOYEE_ID
	FROM EMPLOYEES
	WHERE SALARY > (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES)
	AND LAST_NAME LIKE '%u%'
) D
WHERE E.EMPLOYEE_ID = D.EMPLOYEE_ID;

-- 33. 위치ID가 1700인 사원들의 급여, 커미션 추출 뒤 추출된 사원들의 급여와 커미션이 동일한 사원정보 출력
-- 사번, 이름(FIRST_NAME + LAST_NAME), 부서번호, 급여
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE (SALARY, NVL(COMMISSION_PCT, 0)) IN (
	SELECT E.SALARY, NVL(E.COMMISSION_PCT, 0)
	FROM EMPLOYEES E, DEPARTMENTS D
	WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
	AND D.LOCATION_ID = 1700
);

-- 34. 총 사원 수 및 2011, 2012, 2013, 2014년도 별 고용된 사원들의 총 수 조회
-- SELECT 절에 사용하는 서브쿼리로 작성
SELECT  
	DISTINCT (SELECT COUNT(*) FROM EMPLOYEES) AS 총사원수,
	(SELECT COUNT(*) FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') HAVING TO_CHAR(HIRE_DATE, 'YYYY') = '2011') AS "2011년 입사자",
	(SELECT COUNT(*) FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') HAVING TO_CHAR(HIRE_DATE, 'YYYY') = '2012') AS "2012년 입사자",
	(SELECT COUNT(*) FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') HAVING TO_CHAR(HIRE_DATE, 'YYYY') = '2013') AS "2013년 입사자",
	(SELECT COUNT(*) FROM EMPLOYEES GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') HAVING TO_CHAR(HIRE_DATE, 'YYYY') = '2014') AS "2014년 입사자"
FROM EMPLOYEES;

SELECT  
	DISTINCT (SELECT COUNT(*) FROM EMPLOYEES) AS 총사원수,
	(SELECT COUNT(*) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2011') AS "2011년 입사자",
	(SELECT COUNT(*) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2012') AS "2012년 입사자",
	(SELECT COUNT(*) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2013') AS "2013년 입사자",
	(SELECT COUNT(*) FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2014') AS "2014년 입사자"
FROM EMPLOYEES;

SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
HAVING TO_CHAR(HIRE_DATE, 'YYYY') BETWEEN '2011' AND '2014'
ORDER BY TO_CHAR(HIRE_DATE, 'YYYY');