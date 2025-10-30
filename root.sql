-- 사용할 데이터베이스 지정
USE sakila;

-- customer 테이블 조회
SELECT *
FROM customer;

-- address_id가 200 미만 데이터 조회
SELECT *
FROM customer
WHERE address_id < 200;

-- address_id가 5 ~ 10 범위에 해당하는 데이터 조회
SELECT *
FROM customer
WHERE address_id BETWEEN 5 AND 10;

-- first_name 이 MARIA인 데이터 조회
SELECT *
FROM customer
WHERE first_name = 'MARIA';

-- first_name 열에서 데이터가 A, B, C 순으로 'MARIA' 보다 앞에 위치한 데이터 조회
SELECT *
FROM customer
WHERE first_name < 'MARIA';

-- first_name이 'M' ~ 'O' 사이의 데이터가 아닌 데이터 조회
SELECT *
FROM customer
WHERE first_name NOT BETWEEN 'M' AND 'O';

-- first_name이 'MARIA', 'LINDA'인 데이터 조회
SELECT *
FROM customer
WHERE first_name IN ('MARIA', 'LINDA');

-- first_name이 'A'로 시작하는 데이터 조회
SELECT *
FROM customer
WHERE first_name LIKE 'A%';

-- first_name이 'A'로 시작하고 문자열 길이가 3인 데이터 조회
SELECT *
FROM customer
WHERE first_name LIKE 'A%'
AND LENGTH(first_name) = 3;

-- first_name이 'A'로 시작하고 'A'로 끝나면서 문자열 길이가 4인 데이터 조회
SELECT *
FROM customer
WHERE first_name LIKE 'A%A'
AND LENGTH(first_name) = 4;

-- film 테이블
-- special_features를 기준으로 그룹화 후 count() 사용
SELECT COUNT(*)
FROM film
GROUP BY special_features;

-- special_features, rating을 기준으로 그룹화 후 rating이 G인 데이터 조회
SELECT special_features, rating
FROM film
GROUP BY special_features, rating
HAVING rating = 'G';

-- address 테이블
-- address_id가 200 미만 데이터 조회
SELECT *
FROM address
WHERE address_id < 200;

-- address_id가 5 ~ 10 범위에 해당하는 데이터 조회
SELECT *
FROM address
WHERE address_id BETWEEN 5 AND 10;

-- address2 열 데이터가 널이 아닌 데이터 조회
SELECT *
FROM address
WHERE address2 IS NOT NULL;

-- city 테이블
-- country_id가 103 or 86 이면서, city 열이 'Cheju', 'Sunnvvale', 'Dallas'인 데이터 조회
SELECT *
FROM city
WHERE country_id IN (103, 86)
AND city IN ('Cheju', 'Sunnyvale', 'Dallas');

-- PAYMENT 테이블
-- PAYMENT_DATE가 2005-07-09 미만인 행 조회
SELECT *
FROM payment
WHERE payment_date < '20050709'

-- LIMIT : 특정 조건에 해당하는 데이터 중에서 상위 n개의 데이터 보기 / 범위 지정해서 보기
-- customer 테이블에서 store_id 내림차순, first_name 오름차순으로 10개 데이터 보기
SELECT *
FROM customer
ORDER BY store_id DESC, first_name
LIMIT 10;

-- LIMIT N1, N2 : 상위 N1 다음행부터 N2개의 행 조회
-- 101번째부터 10개
SELECT *
FROM customer
ORDER BY store_id DESC, first_name
LIMIT 100, 10;

-- LIMIT ~ OFFSET
-- 100개 건너뛰고 101번째 10개 가져오기
SELECT *
FROM customer
ORDER BY customer_id
LIMIT 10 OFFSET 100;

-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS EXAM;

-- 테이블 생성
-- 데이터 타입
-- 1. 숫자형 : TINYINT(1Byte), SMALLINT(2Byte), MEDIUMINT(3Byte), INT(4Byte), BIGINT(8Byte)
-- 2. 실수형 : 고정소수점(DECIMAL, NUMERIC) / 부동소수점(FLOAT, DOUBLE) 형식
-- 3. 문자형 : CHAR(N) - 고정길이, VARCHAR(N) - 가변길이
-- 4. 날짜형 : TIME / DATE / DATETIME / TIMESTAMP
CREATE TABLE TABLE1(
	COL1 INT,
	COL2 VARCHAR(50),
	COL3 DATETIME
);

CREATE TABLE TABLE2(
	COL1 INT AUTO_INCREMENT PRIMARY KEY,
	COL2 VARCHAR(50),
	COL3 DATETIME
);

INSERT INTO TABLE2(COL1, COL2, COL3)
VALUES(3, 'TEST', '2025-10-30');

INSERT INTO TABLE2(COL2, COL3)
VALUES('TEST', '2025-10-30');

SELECT *
FROM TABLE2;

-- 현재 AUTO_INCREMENT로 생성된 마지막 값 확인
SELECT LAST_INSERT_ID();

-- AUTO_INCREMENT 시작값 변경
ALTER TABLE TABLE2 AUTO_INCREMENT = 100;

-- AUTO_INCREMENT 증가값 변경
-- 전체 AUTO_INCREMENT 값에 영향을 미침
-- SET @@AUTO_INCREMENT_INCREMENT = 5;

CREATE TABLE EXAM_INSERT_SELECT_FROM(
	COL1 INT,
	COL2 VARCHAR(10)
);

CREATE TABLE EXAM_INSERT_SELECT_TO(
	COL1 INT,
	COL2 VARCHAR(10)
);

INSERT INTO EXAM_INSERT_SELECT_FROM(COL1, COL2)
VALUES(1, 'Do');

INSERT INTO EXAM_INSERT_SELECT_FROM(COL1, COL2)
VALUES(2, 'it');

INSERT INTO EXAM_INSERT_SELECT_FROM(COL1, COL2)
VALUES(3, 'MySQL');

-- EXAM_INSERT_SELECT_FROM => EXAM_INSERT_SELECT_TO
INSERT INTO EXAM_INSERT_SELECT_TO
SELECT *
FROM EXAM_INSERT_SELECT_FROM;

SELECT *
FROM EXAM_INSERT_SELECT_TO;

CREATE TABLE EXAM_SELECT_NEW
AS SELECT * FROM EXAM_INSERT_SELECT_FROM;

SELECT *
FROM EXAM_SELECT_NEW;

-- 날짜 타입 비교
-- NOW() : ORACLE의 SYSDATE와 같은 역할
CREATE TABLE EXAM_DATE_TABLE(
	COL1 DATE,
	COL2 TIME,
	COL3 DATETIME,
	COL4 TIMESTAMP
);

INSERT INTO EXAM_DATE_TABLE
VALUES(NOW(), NOW(), NOW(), NOW());

SELECT *
FROM EXAM_DATE_TABLE;

-- 사용자 생성
-- 아이디 대소문자 구별함
-- localhost : 내 컴퓨터(로컬) 접속만 가능
-- '%' : 모든 IP에서 접속가능 (외부 접속 허용)
CREATE USER 'TEST2'@'localhost' IDENTIFIED BY 12345;
CREATE USER 'TEST2'@'%' IDENTIFIED BY 12345;

-- 권한 부여
GRANT 권한목록 ON 데이터베이스.테이블 TO '사용자이름'@'호스트'
GRANT SELECT, INSERT, UPDATE ON EXAM.TABLE1 TO 'TEST1'@'LOCALHOST';

GRANT ALL PRIVILEGES ON EXAM.* TO 'TEST1'@'LOCALHOST';
-- 변경사항 반영
FLUSH PRIVILEGES;

-- 사용자 삭제
DROP USER 'TEST1'@'LOCALHOST';

-- 비밀번호 변경
ALTER USER 'TEST1'@'LOCALHOST' IDENTIFIED BY 12345;