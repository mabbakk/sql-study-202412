-- WHERE 조건절 : 데이터를 필터링
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd = 1
;

-- PK로 필터링하면 무조건 0건 또는 1건이 조회됨
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE emp_no = 1000000003
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd != 1
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd <> 1 -- NOT EQUAL
;

-- 90년대생들만 필터링
SELECT 
    EMP_NO
    , EMP_NM
    , ADDR
    ,BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE >= '19900101'
    AND BIRTH_DE <= '19991231'
;


-- 사이 데이터를 조회 : BETWEEN A AND B
SELECT 
    EMP_NO
    , EMP_NM
    , ADDR
    , BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231'
;

-- 90년대생이 아닌 사람들 -> BETWEEN 앞에 NOT만 붙이면 됨
SELECT 
    EMP_NO
    , EMP_NM
    , ADDR
    , BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE NOT BETWEEN '19900101' AND '19991231'
;

-- IN 연산자 : OR연산
SELECT 
    EMP_NO
    ,EMP_NM
    , DEPT_CD
FROM TB_EMP
WHERE DEPT_CD = 100002
        OR DEPT_CD = 100007
        OR DEPT_CD = 100009
;

-- 위 코드를 IN을 활용하여 아래와 같이 변환
SELECT 
    EMP_NO
    ,EMP_NM
    , DEPT_CD
FROM TB_EMP
-- 위의 OR 연산과 결과가 같음.
WHERE DEPT_CD IN (100002, 100007, 100009)
;

-- 위에 해당하지 않는 다른 데이터들 ? -> IN 앞에 NOT만 붙이기.
SELECT 
    EMP_NO
    ,EMP_NM
    , DEPT_CD
FROM TB_EMP
-- 위의 OR 연산과 결과가 같음.
WHERE DEPT_CD NOT IN (100002, 100007, 100009)
;

-- LIKE 연산
-- 특정 단어가 포함된 검색
-- 와일드카드 매핑(%: 0글자 이상, _: 딱 1글자)


-- 용인시에만 사는 사람들 필터링
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE ADDR LIKE '%용인%'
;

-- 이름이 이 로 시작하는 사람들 필터링
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '이%'
;

-- 이_ : 성이 이, 이름이 외자인 사람 
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '이__'
;

-- 이름이 심으로 끝나는 사람들 필터링
SELECT 
    EMP_NO
    ,EMP_NM
    ,ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '%심'
;

SELECT 
    EMAIL
FROM USER
WHERE EMAIL LIKE '_A%@%.COM'  -- BANANA123@GMAIL.COM이 이 코드에 필터링됨.
;

-- 성씨가 김씨이면서
-- 부서가 100003, 100004 중에 하나면서
-- 90년대생인 사원의 
-- 사번, 이름, 생일, 부서코드를  조회
SELECT
    EMP_NO
    ,EMP_NM
    ,BIRTH_DE
    , DEPT_CD
FROM TB_EMP
WHERE 1 = 1   --무조건 TRUE가 나오는 조건 생성
  -- 아래 나머지 조건들 AND 처리 가능 (+ 주석 또한 가능)
    AND EMP_NM LIKE '김%'
    AND DEPT_CD IN (100003, 100004)
    AND BIRTH_DE BETWEEN '19900101' AND '19991231'
;

-- NULL값 조회
-- NULL 조회는 무조건 IS NULL
SELECT
    EMP_NO
    , EMP_NM
    , DIRECT_MANAGER_EMP_NO
FROM TB_EMP
-- NULL 조회는 꼭 !!! 앞에 IS를 붙여야 조회 가능! = NULL 아님!!
WHERE DIRECT_MANAGER_EMP_NO IS NULL
;

-- 상사가 없는 사람이 아닌 사람들 필터링
SELECT
    EMP_NO
    , EMP_NM
    , DIRECT_MANAGER_EMP_NO
FROM TB_EMP              --NOT은 IS 뒤에!!
WHERE DIRECT_MANAGER_EMP_NO IS NOT NULL
;

-- 연산자 우선 순위
-- NOT > AND > OR
SELECT
    EMP_NO
    , EMP_NM
    , ADDR
FROM TB_EMP
WHERE EMP_NM LIKE '김%'  --김씨이면서
    AND (ADDR LIKE '%일산%'   -- 일산에 사는사람
        OR ADDR LIKE '%수원%')  -- 김씨가 아니어도 수원 사는 사람이 다 잡혀옴!
;      --OR이 먼저 실행되어야 하므로 괄호를 쳐줌!
