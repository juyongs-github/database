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



-- 집합 연산자
-- 합집합(UNION, UNION ALL), 교집합(INTERSECT), 차집합(MINUS)
-- UNION: 중복 제거, UNION ALL: 중복 제거 X
-- DEPTNO = 10, UNION DEPTNO = 20
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 20;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 10;

-- MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 10;

-- [실습]
-- 1. 사원 이름이 S로 끝나는 사원 데이터 조회
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- 2. 30번 부서에 근무하고 있는 사원 중에 JOB이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호 조회
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- 3. 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 다음 두 방식의 SELECT 문을 사용하여
-- 사원번호, 이름, 직책, 급여, 부서 번호를 출력
-- 1) 집합 연산자를 사용하는 방식
-- 2) 집합 연산자를 사용하지 않는 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20
AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND SAL > 2000;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000
MINUS
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (20, 30)
AND SAL > 2000;

-- 4. NOT BETWEEN A AND B 연산자를 사용하지 않고 급여가 2000 이상 3000 이하 범위 이외의 값을 가진 데이터 조회
SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000;

-- 5. 사원 이름에 E가 포함된 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌 사원명, 사번, 급여, 부서번호 조회
SELECT ENAME, EMPNO, SAL, DEPTNO 
FROM EMP
WHERE ENAME LIKE '%E%'
AND DEPTNO = 30
AND SAL NOT BETWEEN 1000 AND 2000;

-- 6. 추가 수당이 없고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중에서 사원이름의 두번째 글자가 L이 아닌 사원의 정보를 조회
SELECT *
FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';



-- 함수
-- 1. 문자 함수
-- UPPER(문자열) : 대문자 변환
-- LOWER(문자열) : 소문자 변환
-- INITCAP(문자열) : 첫글자는 대문자, 나머지 문자는 소문자
-- LENGTH(문자열) : 문자열 길이
-- LENGTHB(문자열) : 문자열의 바이트 길이
-- SUBSTR(문자열, 시작위치, 추출길이) : 문자열 부분추출
-- INSTR(대상문자열, 위치를 찾으려는 문자, 시작위치, 찾으려는 문자가 몇 번째인지) : 문자열에서 특정 문자 위치 찾기
-- REPLACE(문자열, 찾는문자, 바꿀문자) : 문자열 바꾸기
-- CONCAT(문자열1, 문자열2) : 문자열 합치기
-- TRIM(삭제옵션(선택), 삭제할문자 FROM 원본문자열(선택))
-- 1) 삭제옵션 : LEADING OR TRAILING OR BOTH
-- LTRIM(원본문자열, 삭제할문자열)
-- RTRIM(원본문자열, 삭제할문자열)
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

SELECT ENAME, LENGTH(ENAME), LENGTHB(ENAME)
FROM EMP;

-- DAUL(SYS 소유의 테이블, 더미 테이블)
-- 임시연산이나 함수의 결과값 확인 용도
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DAUL;

-- 사원명 길이가 5이상인 사원 조회
SELECT *
FROM EMP
WHERE LENGTH(ENAME) >= 5;

-- 직책명이 6자 이상인 사원 조회
SELECT *
FROM EMP
WHERE LENGTH(JOB) >= 6;

-- EMP 테이블에서 사원명을 세번째 글자부터 끝까지 출력
SELECT SUBSTR(ENAME, 3)
FROM EMP;

SELECT 
	INSTR('HELLO, ORACLE!', 'L') AS 첫번째,
	INSTR('HELLO, ORACLE!', 'L', 5) AS 두번째,
	INSTR('HELLO, ORACLE!', 'L', 2, 2) AS 세번째
FROM DUAL;

-- 사원명에 문자 S가 포함된 사원 조회
-- 1) LIKE 2) INSTR()
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

-- 010-4526-7858 => 010 4526 7858 OR 01045267858
SELECT 
	'010-4526-7858' AS BEFORE, 
	REPLACE('010-4526-7858', '-', ' ') AS REPLACE1, 
	REPLACE('010-4526-7858', '-') AS REPLACE2
FROM DUAL;

-- EMPNO, ENAME 합치기
-- CONCAT() OR ||
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO, CONCAT(':', ENAME))
FROM EMP;

SELECT EMPNO || ENAME, EMPNO || ':' || ENAME
FROM EMP;

-- TRIM()
SELECT 
	'[' || TRIM(' __Oracle__ ') || ']' AS TRIM,
	'[' || TRIM(LEADING FROM ' __Oracle__ ') || ']' AS TRIM_LEADING, -- LTRIM()
	'[' || TRIM(TRAILING FROM ' __Oracle__ ') || ']' AS TRIM_TRAILING, -- RTRIM()
	'[' || TRIM(BOTH FROM ' __Oracle__ ') || ']' AS TRIM_BOTH
FROM DUAL;

SELECT 
	'[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
	'[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
	'[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM2,
	'[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
	'[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM2,
	'[' || TRIM(BOTH FROM ' __Oracle__ ') || ']' AS TRIM_BOTH
FROM DUAL;

-- 2. 숫자함수
-- ROUND(숫자, 반올림위치) : 반올림
-- TRUNC(숫자, 버림위치) : 버림
-- CEIL(숫자) : 지정된 숫자보다 큰 정수 중 가장 작은 정수 반환
-- FLOOR(숫자) : 지정된 숫자보다 작은 정수 중 가장 큰 정수 반환
-- MOD(숫자, 반올림위치) : 지정된 숫자를 나눈 나머지 반환
SELECT
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND0,
	ROUND(1234.5678, 1) AS ROUND1,
	ROUND(1234.5678, 2) AS ROUND2,
	ROUND(1234.5678, -1) AS ROUND_MINUS1,
	ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC0,
	TRUNC(1234.5678, 1) AS TRUNC1,
	TRUNC(1234.5678, 2) AS TRUNC2,
	TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
	TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

SELECT MOD(15, 6), MOD(10, 2), MOD(11, 2)
FROM DUAL;

-- 3. 날짜함수
-- 날짜 데이터 + 숫자 : 이후 날짜 반환
-- 날짜 데이터 - 숫자 : 이전 날짜 반환
-- 날짜 데이터 - 날짜 데이터 : 두 날짜 데이터 간의 일수 차이 반환
-- 날짜 데이터 + 날짜 데이터 : 연산 불가
-- ADD_MONTHS(날짜데이터, 더할개월수)
-- MONTHS_BETWEEN(날짜데이터1, 날짜데이터2)
-- NEXT_DAY(날짜데이터, 요일문자)
-- LAST_DAY(날짜데이터)
-- SYSDATE : ORACLE에서 시스템 날짜 출력 (CURRENT_DATE, CURRENT_TIMESTAMP)
SELECT SYSDATE, SYSDATE + 1, SYSDATE - 1, CURRENT_DATE, CURRENT_TIMESTAMP
FROM DUAL;

SELECT ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- EMP 테이블에서 입사 50주년이 되는 날짜 구하기
SELECT HIREDATE, ADD_MONTHS(HIREDATE, 12 * 50)
FROM EMP;

-- 입사한지 40년이 넘은 사원 조회
SELECT *
FROM EMP
WHERE ADD_MONTHS(HIREDATE, 12 * 40) < SYSDATE;

SELECT 
	EMPNO, 
	HIREDATE, 
	SYSDATE, 
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
	MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
	TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
FROM EMP;

SELECT SYSDATE, LAST_DAY(SYSDATE), NEXT_DAY(SYSDATE, '월요일')
FROM DUAL;

-- 4. 형변환 함수
-- TO_CHAR() : 날짜, 숫자 데이터를 문자로 변환 (★유용하게 쓰임)
-- TO_NUMBER() : 문자 데이터를 숫자로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

SELECT 
	SYSDATE, 
	TO_CHAR(SYSDATE, 'MM'), 
	TO_CHAR(SYSDATE, 'MON'), 
	TO_CHAR(SYSDATE, 'MONTH'), 
	TO_CHAR(SYSDATE, 'DD'), 
	TO_CHAR(SYSDATE, 'DAY')
FROM DUAL;

SELECT 
	SYSDATE, 
	TO_CHAR(SYSDATE, 'HH24:MI:SS'), 
	TO_CHAR(SYSDATE, 'HH12:MI:SS AM'), 
	TO_CHAR(SYSDATE, 'HH:MI:SS P.M.')
FROM DUAL;

SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME = 'SMITH';

SELECT EMPNO, ENAME, EMPNO + 'ABCD'
FROM EMP
WHERE ENAME = 'SMITH';

SELECT SAL, TO_CHAR(SAL, '$999,999'), TO_CHAR(SAL, 'L999,999')
FROM EMP;

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999'), '1300' + 1500
FROM DUAL;

SELECT TO_DATE('20251027', 'YYYY-MM-DD'), TO_DATE('20251027', 'YYYY/MM/DD')
FROM DUAL;

SELECT TO_DATE('2025-10-27') - TO_DATE('2025-09-23')
FROM DUAL;

-- NULL 처리 함수
-- 1. NVL(컬럼명, 반환할 데이터) : NULL일 경우 반환할 데이터 반환
-- 2. NVL2(컬럼명, NULL이 아닐 때 반환할 데이터, NULL이 아닐 경우 반환할 데이터)
-- NULL + NULL = NULL
-- 숫자 + NULL = NULL
SELECT EMPNO, ENAME, SAL, COMM, COMM + SAL
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL(COMM, 0) + SAL
FROM EMP;

SELECT EMPNO, ENAME, SAL, COMM, NVL2(COMM, 'O', 'X'), NVL2(COMM, SAL * 12 + COMM, SAL * 12)
FROM EMP;

-- DECODE(), CASE(): 상황에 따라 다른 데이터를 반환
-- 직책이 MANAGER인 사원은 급여의 10%, SALESMAN인 사원은 급여의 5%, ANALYST인 사원은 그대로, 나머지 3%만큼 인상된 급여 구하기
SELECT 
	EMPNO, 
	ENAME, 
	JOB, 
	SAL, 
	DECODE(JOB, 'MANAGER', SAL * 1.1, 'SALESMAN', SAL * 1.05, 'ANALYST', SAL, SAL * 1.03) AS 급여
FROM EMP;

SELECT 
	EMPNO, 
	ENAME, 
	JOB, 
	SAL, 
	CASE JOB
		WHEN 'MANAGER' THEN SAL * 1.1 
		WHEN 'SALESMAN' THEN SAL * 1.05
		WHEN 'ANALYST' THEN SAL
		ELSE SAL * 1.03 
	END AS 급여
FROM EMP;

-- COMM이 NULL인 경우에는 해당없음, 0인 경우에는 수당없음, 0보다 큰 경우에는 수당 800
SELECT
	EMPNO,
	ENAME,
	COMM,
	CASE
		WHEN COMM IS NULL THEN '해당없음'
		WHEN COMM = 0 THEN '수당없음'
		WHEN COMM > 0 THEN '수당 : ' || COMM
	END AS COMM_TEXT
FROM EMP;

-- EMP 테이블에서 사원의 월 평균 근무일수는 21.5일
-- 하루 근무시간을 8시간으로 봤을 때 사원의 하루급여(DAY_PAY), 시급(TIME_PAY)를 계산하여 결과를 출력
-- 하루 급여는 소수 셋째 자리에서 버리고, 시급은 소수 둘째 자리에서 반올림
SELECT EMPNO, ENAME, SAL, TRUNC(SAL / 21.5, 2) AS DAY_PAY, ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP;

-- EMP 테이블에서 사원은 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 사원이 정직원이 되는 날짜(R_JOB)을
-- YYYY-MM-DD 형식으로 출력. 단, 추가수당이 없는 사원의 추가 수당은 N/A로 출력
-- EMPNO, ENAME, HIREDATE, R_JOB, COMM 출력
SELECT
	EMPNO,
	ENAME,
	HIREDATE,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
	NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)를 아래의 조건을 기준으로 변환해서 CHG_MGR 열에 출력
-- 조건
-- 직속 상관의 번호가 없는 경우 0000
-- 직속 상관의 사원번호 앞 두자리가 75일 때 5555
-- 직속 상관의 사원번호 앞 두자리가 76일 때 6666
-- 직속 상관의 사원본호 앞 두자리가 77일 때 7777
-- 직속 상관의 사원번호 앞 두자리가 78일 때 8888
-- 그 외 직속상관 사원 번호일 때 본래 직속상관의 사원번호 그대로 출력
SELECT
	EMPNO,
	ENAME,
	HIREDATE,
	MGR,
	CASE
		WHEN TO_CHAR(MGR) IS NULL THEN '0000'
		WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '75' THEN '5555'
		WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '76' THEN '6666'
		WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '77' THEN '7777'
		WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '78' THEN '8888'
	ELSE TO_CHAR(MGR) END AS CHG_MGR
FROM EMP;

-- 다중행 함수
-- SUM(), AVG(), COUNT(), MAX(), MIN()
SELECT SUM(SAL), AVG(SAL), MAX(SAL), MIN(SAL), COUNT(SAL)
FROM EMP;

SELECT SUM(DISTINCT SAL), AVG(DISTINCT SAL), MAX(DISTINCT SAL), MIN(DISTINCT SAL), COUNT(DISTINCT SAL)
FROM EMP;

-- 10번 부서의 급여 총계, 평균 구하기
SELECT SUM(SAL), AVG(SAL)
FROM EMP
WHERE DEPTNO = 10;

-- 20번 부서의 제일 오래된 입사일 구하기
SELECT MIN(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

-- 20번 부서의 제일 최신 입사일 구하기
SELECT MAX(HIREDATE)
FROM EMP
WHERE DEPTNO = 20;

-- GROUP BY : 결과값을 원하는 열로 묶어 출력
-- 부서별 급여평균 조회
-- 다중행 함수 옆에 올 수 있는 컬럼은 GROUP BY에 사용한 컬럼만 가능
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 부서별, 직무별 급여 평균 조회
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- 부서별 추가수당 평균 조회
SELECT DEPTNO, AVG(NVL(COMM, 0))
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 부서별, 직무별 급여 평균 조회(단, 평균이 2000 이상 그룹 조회)
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- EMP 테이블을 이용하여 부서번호, 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT) 조회
-- 단, 평균급여 출력 시 소수점을 제외하고 각 부서번호별로 출력
SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT JOB AS 직책, COUNT(*) AS 인원수
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3;

-- 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT TO_CHAR(HIREDATE, 'YYYY') AS 입사년도, DEPTNO AS 부서번호, COUNT(*) AS 인원수
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

-- JOIN : 여러 테이블을 하나의 테이블처럼 사용
-- 1. 내부 JOIN(INNER JOIN)
-- 2. 외부 JOIN(OUTER JOIN)
--     1) LEFT OUTER JOIN
--     2) RIGHT OUTER JOIN
--     3) FULL OUTER JOIN : LEFT OUTER JOIN +(UNION) RIGHT OUTER JOIN (구문은 따로 없음)

-- 사원정보 + 부서정보 조회
-- 내부조인 + 등가조인
SELECT *
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL >= 2000;

-- 비등가 조인 + 내부 조인
SELECT *
FROM EMP E
JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 셀프 조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS 매니저명
FROM EMP E1
JOIN EMP E2
ON E1.MGR = E2.EMPNO;

-- 외부 조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS 매니저명
FROM EMP E1
LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS 매니저명
FROM EMP E1
RIGHT JOIN EMP E2
ON E1.MGR = E2.EMPNO;

-- + 부서명 조회
SELECT E.DEPTNO, D.DNAME, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(*) AS CNT
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME
ORDER BY E.DEPTNO;

-- TABLE 3개 연동
-- 부서번호, 부서명, 사원번호, 사원명, 매니저번호, 급여, 급여등급
-- 부서명 : DEPT
-- 사번, 사원명, 매니저번호, 급여, 부서번호 : EMP
-- 급여등급 : SALGRADE
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.MGR, E.SAL, S.GRADE
FROM EMP E
JOIN DEPT D

ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT *
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 서브쿼리 : 메인쿼리 외에 SELECT 구문이 여러개 존재
-- 1) 단일행 서브쿼리 : 서브쿼리 실행 결과가 행 하나
-- → 연산자 종류 : >, <, >=, <=, <>, !=, ^=, =
-- 2) 다중행 서브쿼리 : 서브쿼리 실행 결과가 행 여러개
-- → 연산자 종류 : IN, ANY(=SOME), ALL, EXIST
-- - IN : 서브쿼리 결과 중 하나라도 일치한 데이터가 있다면 TRUE 반환
-- - ANY, SOME : 서브쿼리 결과가 하나 이상이면 TRUE
-- - ALL : 
-- JONES의 급여보다 높은 급여를 받는 사원 데이터 조회
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

-- WARD 사원보다 빨리 입사한 사원 조회
SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균급여보다 높은 급여를 받는 사원 조회
-- 부서 정보 추가로 조회
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 20
AND E.SAL > (SELECT AVG(SAL) FROM EMP);

SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT *
FROM EMP
WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 30번 부서의 최대 급여보다 적은 급여를 받는 사원 조회
SELECT *
FROM EMP
WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- 30번 부서의 최소 급여보다 많은 급여를 받는 사원 조회
SELECT *
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- 30번 부서의 최소 급여보다 더 적은 급여를 받는 사원 조회
SELECT *
FROM EMP
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- 30번 부서의 최대 급여보다 더 많은 급여를 받는 사원 조회
SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

-- 서브쿼리 결과가 하나 이상 나오면 TRUE 반환
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 30);

-- 다중열 서브쿼리
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- FROM 절 서브쿼리 (= 인라인 뷰)
SELECT E10.*, D.*
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- SELECT 절 서브쿼리 (= 스칼라 서브쿼리)
SELECT 
	E.EMPNO, 
	E.ENAME, 
	E.JOB,
	(SELECT GRADE FROM SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL) AS SALGRADE, 
	DEPTNO,
	(SELECT DNAME FROM DEPT D WHERE E.DEPTNO = D.DEPTNO) AS DNAME
FROM EMP E;

-- 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보 조회
-- 정보 : 사번, 이름, 직무, 급여, 부서번호, 부서명
SELECT 
	E.EMPNO, 
	E.ENAME, 
	E.JOB, 
	E.SAL, 
	E.DEPTNO, 
	(SELECT D.DNAME FROM DEPT D WHERE D.DEPTNO = E.DEPTNO) AS DNAME
FROM EMP E
WHERE E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

-- 자신의 부서 내에서 최고 연봉과 동일한 급여를 받는 사원 조회
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 10번 부서에 근무하는 사원 중 30번 부서에 없는 직책인 사원의 사번, 이름, 직무, 부서번호, 부서명, 부서위치 조회
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO = 10 AND E.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);