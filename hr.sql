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