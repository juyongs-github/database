-- department(학과)
-- 학과코드(dept_id), 학과명(dept_name)
-- 'A001', '데이터사이언스'
CREATE TABLE department(
	dept_id VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

-- student(학생)
-- 학번(student_id), 이름(name), 키(height), 학과코드(학과 테이블 참조)
-- '20250001', '홍길동', 163.5
CREATE TABLE student(
	student_id VARCHAR(8) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	height DECIMAL(5, 2),
	dept_id VARCHAR(4),
	CONSTRAINT FK_STUDENT_DEPARTMENT FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

-- professor(교수)
-- 교수코드(prof_id), 교수명(prof_name), 학과코드(학과 테이블 참조)
-- 'P001', '김유진'
CREATE TABLE professor(
	prof_id VARCHAR(4) PRIMARY KEY,
	prof_name VARCHAR(50) NOT NULL,
	dept_id VARCHAR(4),
	CONSTRAINT FK_PROFESSOR_DEPARTMENT FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

-- subject(과목)
-- 과목코드(subj_id), 교수코드(교수 테이블 참조), 시작일(start_date), 종료일(end_date), 과목명(subj_name)
-- 'S001', '2025-03-01', '2025-06-30', '파이썬'
CREATE TABLE subject(
	subj_id VARCHAR(8) PRIMARY KEY,
	prof_id VARCHAR(4),
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	subj_name VARCHAR(100) NOT NULL,
	CONSTRAINT FK_SUBJECT_PROFESSOR FOREIGN KEY(prof_id) REFERENCES professor(prof_id)
);

-- enrollment(수강)
-- 수강코드(enroll_id), 학생코드(학생 테이블 참조), 과목코드(과목 테이블 참조), 수강일자(enroll_date)
-- 1(자동증가), '2025-06-30'
CREATE TABLE enrollment(
	enroll_id INT AUTO_INCREMENT PRIMARY KEY,
	student_id VARCHAR(8),
	subj_id VARCHAR(8),
	enroll_date DATE NOT NULL,
	CONSTRAINT FK_ENROLLMENT_STUDENT FOREIGN KEY(student_id) REFERENCES student(student_id),
	CONSTRAINT FK_ENROLLMENT_SUBJECT FOREIGN KEY(subj_id) REFERENCES subject(subj_id)
);

-- 각 테이블에 데이터 INSERT
INSERT INTO department
VALUES('A001', '데이터사이언스');

INSERT INTO department
VALUES('A002', '경영학과');

INSERT INTO student
VALUES('20250001', '홍길동', 163.5, 'A002');

INSERT INTO student(student_id, name, dept_id)
VALUES('20250002', '성춘향', 'A001');

INSERT INTO professor
VALUES('P001', '김유진', 'A001');

INSERT INTO subject
VALUES('S001', 'P001', '2025-03-01', '2025-06-30', '파이썬');

INSERT INTO enrollment(student_id, subj_id, enroll_date)
VALUES('20250001', 'S001', NOW()); -- 날짜만 원하면 CURDATE()

-- 각 테이블 데이터 확인
SELECT *
FROM department;

SELECT *
FROM student;

SELECT *
FROM professor;

SELECT *
FROM subject;

SELECT *
FROM enrollment;