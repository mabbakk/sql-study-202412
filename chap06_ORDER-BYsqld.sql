-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치
-- 모든 데이터가 깔끔하게 나온 상태에서 정렬

-- 사원 번호(emp_no) 오름차순
SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

-- 사원 이름(emp_nm) 내림차순
SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm DESC
;

--사원 코드(dept_cd) 오름차순
SELECT 
    emp_no
    , emp_nm
    , addr
    , dept_cd
FROM tb_emp
ORDER BY dept_cd ASC, emp_nm DESC  -- 부서 코드가 똑같으면 사원 이름으로 정렬
;

SELECT 
    emp_no AS 사번
    , emp_nm 이름  --AS 생략 가능
    , dept_cd 부서코드
FROM tb_emp
ORDER BY 이름 DESC
;

SELECT 
    emp_no AS 사번
    , emp_nm 이름  --AS 생략 가능
    , dept_cd 부서코드
FROM tb_emp
ORDER BY 3, 1 DESC --3 뒤에 ASC 생략, 3 : 부서코드 dept_cd, 부서코드로 정렬 후 1번(사번) 내림차순으로 정렬.
;


SELECT 
    emp_no AS 사번
    , emp_nm 이름
    , dept_cd 부서코드
FROM tb_emp
ORDER BY 부서코드, 1 DESC
;

-- 오라클에서 정렬시 null을 가장 큰 값으로 취급. 내림차->null이 가장 위로, 오름차->null이 가장 아래로.
SELECT
    emp_nm
    , direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;


SELECT    --5
    emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his    --1
WHERE pay_de BETWEEN '20190101' AND '20191231'    --2
GROUP BY emp_no    --3
HAVING AVG(pay_amt) >= 4500000    --4
ORDER BY 2  DESC    --6
;






















