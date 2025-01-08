

-- 서브쿼리 EXISTS문
-- 강남에 사는 사원이 있는 부서 정보를 모두 출력
-- 우리가 원하는 정보는 사원의 정보가 아니라 강남에 사는 사원이 있는 부서의 정보.
SELECT
    emp_nm
    , addr
    , dept_cd
FROM tb_emp
WHERE addr LIKE '%강남%'
;

SELECT
    dept_cd
    , dept_nm
FROM tb_dept 
WHERE dept_cd IN ('100009', '100010')
;

SELECT
    dept_cd
    , dept_nm
FROM tb_dept 
WHERE dept_cd IN (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE addr LIKE '%강남%'
)
;

SELECT
    D.dept_cd
    , D.dept_nm
FROM tb_dept D    
WHERE EXISTS (    -- EXSITS를 존재하는 이라고 해석 X, 안쪽에 있는 JOIN 조건에 만족하는 녀석들만 남겨라!, NOT EXSITS: 아래 JOIN 조건에 맞지 않는 녀석들만 추출!
    SELECT
        E.dept_cd  -- EXSITS에서 안쪽 SELECT는 아무 의미가 없음! 고로 1이나 'HELLO'같은 아무 내용이나 넣어도 전혀 지장이 없음.
    FROM tb_emp E
    WHERE E.addr LIKE '%강남%'
        AND D.dept_cd = E.dept_cd
)
;


-- # 다중 컬럼 서브쿼리
--  : 서브쿼리의 조회 컬럼이 2개 이상인 서브쿼리

-- 부서원이 2명 이상인 부서 중에서 각 부서의 
-- 가장 연장자의 사번과 이름 생년월일과 부서코드를 조회

SELECT 
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN (
                        SELECT 
                            dept_cd, MIN(birth_de)
                        FROM tb_emp
                        GROUP BY dept_cd
                        HAVING COUNT(*) >= 2
                    )
ORDER BY A.emp_no
;



-- 인라인 뷰 서브쿼리 (FROM절에 쓰는 서브쿼리)

-- 각 사원의 사번과 이름과 평균 급여정보를 조회하고 싶다.
SELECT 
    A.emp_no, A.emp_nm, B.pay_avg
FROM tb_emp A 
JOIN (   -- 테이블 양이 많을 수록 연산 수가 많아지므로 부하 가능성 UP -> 필터링 후 JOIN연산.
                 SELECT 
                    emp_no, AVG(pay_amt) AS pay_avg
                 FROM tb_sal_his
                 GROUP BY emp_no
        ) B
ON A.emp_no = B.emp_no
ORDER BY A.emp_no
;

SELECT 
    A.emp_no, A.emp_nm, AVG(B.PAY_AMT)
FROM tb_emp A 
JOIN TB_SAL_HIS B
ON A.emp_no = B.emp_no
GROUP BY A.EMP_NO, A.EMP_NM 
ORDER BY A.emp_no
;


-- 스칼라 서브쿼리 (SELECT, INSERT, UPDATE절에 쓰는 서브쿼리)

-- 사원의 사번, 사원명, 부서명, 생년월일, 성별코드를 조회

SELECT
    E.emp_no
    , E.emp_nm
    -- 부서명 하나만 조회해오면 되는데 굳이 JOIN을 할 필요가 없다.
    -- 서브쿼리 ! -> 부서 정보에서 부서명만 추출하는 SELECT문 삽입 + 별칭 선언
    , (SELECT D.dept_nm FROM tb_dept D  WHERE E.dept_cd = D.dept_cd) AS dept_nm  -- 별칭 부여!
    , E.birth_de
    , E.sex_cd
FROM tb_emp E
;


-- 연관 서브쿼리 : 단독 실행 불가능한 서브쿼리
-- 비연관 서브쿼리 : 단독 실행 가능한    "
