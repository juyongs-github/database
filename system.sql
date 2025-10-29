-- c## 사용 안하도록 설정
-- 오라클 버전이 업데이트 되면서 사용자 아이디 앞에 c##을 붙이도록 설정되어 있음
-- hr 사용자 생성 => c##hr
ALTER SESSION SET "_oracle_script"=TRUE;
@C:\Source\database\db-sample-schemas-main\db-sample-schemas-main\human_resources\hr_install.SQL
sys AS sysdba

-- GRANT : 권한 부여
-- SCOTT에게 VIEW 만들 수 있는 권한 주기
GRANT CREATE VIEW TO SCOTT;

-- SCOTT에게 SYNONYM 만들 수 있는 권한 주기
GRANT CREATE SYNONYM TO SCOTT;