-- SELECT(조회)

-- emp(사원) 테이블
-- empno(사번) : number(4,0) => 숫자, 4자리, 소수점 아래 자릿수는 0
-- ename(이름) : varchar2(10) => 문자
-- job(직무) : varchar2(9)
-- mgr(매니저-사수 사원번호)
-- hiredate(입사일)
-- sal(급여) : number(7,2)
-- comm(수당)
-- deptno(부서번호)

-- dept(부서) 테이블
-- deptno(부서번호)
-- dname(부서명)
-- loc(부서위치)

-- 조회 기본 구문
-- SELECT 열이름... FROM 테이블명;
-- SELECT 열이름... FROM 테이블명 WHERE 조건 나열;

-- 1) 전체 사원 조회 시 사원 모든 정보 추출
SELECT *
FROM EMP;

-- 2) 전체 사원 조회 시 사원 이름만 추출
SELECT ename
FROM EMP;

-- 3) 전체 사원 조회 시 사번, 사원명, 부서번호만 추출
SELECT empno, ename, deptno
FROM EMP;

-- 4) 전체 사원 조회 시 부서번호만 추출
SELECT deptno 
FROM EMP;

-- 5) 전체 사원 조회 시 부서번호만 추출(중복 데이터 제거)
SELECT DISTINCT deptno
FROM EMP;

-- 6) 별칭(alias)
SELECT ename 사원명
FROM EMP; -- O

SELECT ename 사원 이름
FROM EMP; -- X

SELECT ename "사원명"
FROM EMP; -- O

SELECT ename AS "사원 이름"
FROM EMP; -- O

-- 7) 연봉 구하기 (sal * 12 + comm)
SELECT empno, sal * 12 + comm AS "연봉"
FROM EMP;

-- 8) 오름차순, 내림차순 정렬 : ORDER BY 정렬기준 열이름... ASC(오름차순) OR DESC(내림차순)
-- ASC는 생략 가능
SELECT *
FROM EMP
ORDER BY sal ASC;

SELECT *
FROM EMP
ORDER BY sal DESC;

SELECT *
FROM EMP
ORDER BY sal DESC, ename ASC;

-- [실습]
-- empno : employee_no,
-- ename : employee_name,
-- mgr : manager,
-- sal : salary,
-- comm : commission,
-- deptno : department_no
-- 별칭 지정, 부서번호를 기준으로 내림차순 정렬, 단 부서번호가 같다면 이름 오름차순
SELECT
	empno AS employee_no,
	ename AS employee_name,
	mgr AS manager,
	sal AS salary,
	comm AS commission,
	deptno AS department_no
FROM EMP
ORDER BY department_no DESC, employee_name;

-- 부서번호가 30번인 사원정보 조회
SELECT *
FROM EMP
WHERE deptno = 30;

-- 사번이 7698인 사원정보 조회
SELECT *
FROM EMP
WHERE empno = 7698;

-- 부서번호가 30번 이고 사원직책이 salesman인 사원정보 조회
SELECT *
FROM EMP
WHERE deptno = 30
AND job = 'SALESMAN';

-- 부서번호가 30번 이거나 사원직책이 analyst인 사원정보 조회
SELECT *
FROM EMP
WHERE deptno = 30
OR job = 'ANALYST'

-- 연산자
-- =, >, <, >=, <=, AND, OR, !=, <>, ^=
-- IN, BETWEEN A AND B (A 이상 B 이하)
-- LIKE

-- 연봉이 36000인 사원 조회
SELECT *
FROM EMP
WHERE sal * 12 = 36000;

-- 급여가 3000 초과인 사원 조회
SELECT *
FROM EMP
WHERE sal > 3000;

-- 이름이 'F' 이후의 문자로 시작하는 사원 조회
SELECT *
FROM EMP
WHERE ename >= 'F';

-- 직무가 manager, salesman, clerk인 사원 조회
SELECT *
FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

SELECT *
FROM EMP
WHERE job IN ('MANAGER', 'SALESMAN', 'CLERK');

-- 직무가 manager, salesman, clerk이 아닌 사원 조회
SELECT *
FROM EMP
WHERE job NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

-- sal이 3000이 아닌 사원 조회
SELECT *
FROM EMP
WHERE sal != 3000;

SELECT *
FROM EMP
WHERE sal <> 3000;

SELECT *
FROM EMP
WHERE sal ^= 3000;

-- 부서번호가 10, 20번인 사원 조회
SELECT *
FROM EMP
WHERE deptno = 10 OR deptno = 20;

SELECT *
FROM EMP
WHERE deptno IN (10, 20);

-- 급여가 2000 이상 3000 이하인 사원 조회
SELECT *
FROM EMP
WHERE sal >= 2000 AND sal <= 3000;

SELECT *
FROM EMP
WHERE sal BETWEEN 2000 AND 3000;

-- 급여가 2000 이상 3000 이하가 아닌 사원 조회
SELECT *
FROM EMP
WHERE sal NOT BETWEEN 2000 AND 3000;

-- LIKE + 와일드 카드(%, _)
-- % : 길이와 상관 없이(문자 없는 경우도 포함) 모든 문자 데이터를 의미
-- _ : 한개의 문자 데이터를 의미
-- 사원명이 S로 시작하는 사원들의 정보 조회
SELECT *
FROM EMP
WHERE ename LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원들의 정보 조회
SELECT *
FROM EMP
WHERE ename LIKE '_L%';

-- 사원이름에 AM이 포함된 사원들의 정보 조회
SELECT *
FROM EMP
WHERE ename LIKE '%AM%';

-- 사원이름에 AM이 포합되지 않은 사원들의 정보 조회
SELECT *
FROM EMP
WHERE ename NOT LIKE '%AM%'

-- NULL 값 비교
SELECT *
FROM EMP WHERE comm IS NULL;

SELECT *
FROM EMP WHERE comm IS NOT NULL;