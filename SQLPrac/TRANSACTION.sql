/* 트랜잭션
    통장이체 K은행 DB 안에 A라는 사람의 통장 정보 또 다른 S은행 B라는 사람의 계좌
    SELECT값을 확인하고 정보를 가지고 계좌 이체라는 실행
    데이터 정보 수정 DML UPDATE
    이런 과정 자체가 하나의 트랜잭션이다
    이 과정을 처리해주는 작업 전체를 섹션이라고 한다
    내가 진행하는 과정 세션 안에 여러개의 트랜잭션이 돌아갈 수 있다


    TCL(DCL)
*/


--6 5000 7000 추가
INSERT INTO SAL_TCL(GRADE,LOSAL,HISAL)
VALUES(6, 5000,7000);

--5 3001 4999 수정
UPDATE SAL_TCL
SET LOSAL=3001, HISAL=4999
WHERE GRADE=5;

--3 삭제
DELETE FROM SAL_TCL WHERE GRADE=3;
DELETE FROM SAL_TCL WHERE GRADE=6;

ROLLBACK;

SELECT * FROM SAL_TCL;

COMMIT;

DELETE FROM SAL_TCL;

INSERT INTO SAL_TCL
VALUES(1, 1000, 2000);



