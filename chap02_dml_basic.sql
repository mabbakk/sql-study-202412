CREATE TABLE GOODS (
    ID NUMBER(6) PRIMARY KEY,
    GOODS_NAME VARCHAR(50) NOT NULL,
    PRICE NUMBER(10) DEFAULT 1000,
    CREATED_AT DATE
);


-- 데이터 생성 : INSERT
INSERT INTO GOODS
    (ID, GOODS_NAME, PRICE, CREATED_AT)
VALUES
    (1, '선풍기', 120000, SYSDATE);
    
INSERT INTO GOODS
    (ID, GOODS_NAME, PRICE, CREATED_AT)
VALUES
    (2, '세탁기', 2000000, SYSDATE);
    
INSERT INTO GOODS
    (ID, GOODS_NAME, CREATED_AT)
VALUES
    (3, '달고나', SYSDATE);
    
-- NOT NULL 제약 조건으로 인해 생성 불가능
    INSERT INTO GOODS
    (ID, PRICE, CREATED_AT)
VALUES
    (4,2000000, SYSDATE);
    
    INSERT INTO GOODS
    (ID, GOODS_NAME)
VALUES
    (5, '계란');
    
INSERT INTO GOODS
    (GOODS_NAME, ID, CREATED_AT)
VALUES
    ('건조기',6, SYSDATE);
    
-- VALUES 앞에 컬럼명을 생략하면
-- 테이블 생성시 정해진 컬럼순서대로
-- 값을 모조리 넣어야 함
INSERT INTO GOODS
VALUES
    (7, '탕수육', 30000, SYSDATE);
    
    
-- 데이터 수정 : UPDATE
UPDATE GOODS
SET GOODS_NAME = '에어컨'
WHERE ID = 1;
    
UPDATE GOODS
SET
    GOODS_NAME = '짜장면'
    , PRICE = 8000
WHERE ID = 3;
    
COMMIT;
    
-- WHERE 조건절이 없는 UPDATE
-- 굉장히 위험!!데이터가 망가질 수 있음
-- 모든 회원들의 나이를 한 살씩 올릴 때 쓴다!
UPDATE GOODS
SET PRICE = 9999;

-- ID는 웬만하면 바꾸면 안 됨!!
UPDATE GOODS
SET ID = 11
WHERE ID = 2;

UPDATE GOODS
SET PRICE = NULL
WHERE ID = 6;

--NOT NULL 제약 조건은 NULL값 수정 불가
UPDATE GOODS
SET GOODS_NAME = NULL
WHERE ID = 6;

-- 데이터 삭제 : DELETE
DELETE FROM GOODS
WHERE ID = 1;

COMMIT;

--WHERE절이 없는 DELETE는 전체삭제 효과를 지닌다.
-- 그러나 이것은 복구가 가능, TRUNCATE TABLE은 복구 불가능
DELETE FROM GOODS;
ROLLBACK;

TRUNCATE TABLE GOODS;
    
--데이터 조회 : SELECT
SELECT * FROM GOODS;

SELECT
    CERTI_CD
    , CERTI_NM
    , ISSUE_INSTI_NM
FROM TB_CERTI
;

SELECT
    CERTI_NM
    , CERTI_CD
    , ISSUE_INSTI_NM
FROM TB_CERTI
;

-- 내가 보고싶은 데이터만 골라서 볼 수 있음
SELECT  
    CERTI_NM
    , ISSUE_INSTI_NM
FROM TB_CERTI
;

-- SELECT 뒤에 ALL이 항상 숨어있음
-- DISTINCT : 중복 제거
SELECT DISTINCT
    ISSUE_INSTI_NM
FROM TB_CERTI
;

-- * : 모든 컬럼 조회
-- 실무에서 * 사용 X
SELECT
    *
FROM TB_CERTI
;
-- 컬럼 별칭 지정 (ALIAS)
-- AS는 생략 가능!, 경우에 따라 ""도 생략 가능!!
-- 그러나 별칭에 띄어쓰기가 있을 경우 "" 생략 XX
SELECT
    EMP_NM AS 사원명
    , ADDR "사원의 주소"
FROM TB_EMP
;

--문자열 결합
SELECT
    '자격증 정보: ' || CERTI_NM AS CERTI_DETAIL
FROM TB_CERTI
;

SELECT
    CERTI_NM || '(' || ISSUE_INSTI_NM ||')' AS CERTI_DETAIL
FROM TB_CERTI
;







    