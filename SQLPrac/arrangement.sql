/*집합연산자
    1. UNION 합집합
    2. UNION ALL 중복허용
    3. INTERSECT 교집합
    4. MINUS 차집합
    
    BETWEEN 연산자
    
    BETWEEN A AND B : A와? B 사이의 내용을 검색해서 나타내라는 의미입니다.
    
    SELECT column_name(s)
    FROM table_name
    WHERE column_name BETWEEN value1 AND value2;

*/

/* DML
    SELECT 데이터 조회
    INSERT 데이터 삽입 
    UPDATE 데이터 수정
    DELETE 데이터 삭제
    
    UPDATE
    
    UPDATE TB
    SET COL1=VAL1, COL2=VAL2,...
    WHERE CON;
*/

/* INSERT
    INSERT INTO TB(COL1, COL2...)
    VALUES ( VAL1,VAL2,VAL3...)
*/

/* DELETE
    DELETE FROM TB WHERE CON;
*/

/* 
    GROUP BY
    
    SELECT COLS (COUNT MAX MIN SUM AVG)
    FROM TB
    WHERE CONDITION
    GROUP BY COLS

    HAVING절의 기본 사용법
    SELECT 조회할 열1 이름, 열2 이름,...,열N 이름
    FROM 조회할 테이블 이름
    WHERE 조회할 행을 선별하는 조건식
    GROUP BY 그룹화할 열 지정(여러 개 지정 가능)
    HAVING 출력 그룹을 제한하는 조건식
    ORDER BY 정렬하려는 열 지정
    
    HAVING
    
    SELECT COLS
    FROM TB
    WHERE CON
    GROUP BY COLS
    HAVING CON
    ORDER BY COLS
    
    제작하는 회사를 벤더라고 한다
    
    JOIN
    데이터와 데이터를 연결해주는
*/

/*WITH(VIEW 개념과 비슷)
    WITH
    별칭 AS SELECT.....
    
    SELECT
    FROM 별칭
*/

WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO=10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D
WHERE E10.DEPTNO=D.DEPTNO;

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10
,(SELECT * FROM DEPT) D
WHERE E10.DEPTNO=D.DEPTNO;

/* DDL
    CREATE 데이터베이스, 테이블 등을 생성
    ALTER 테이블을 수정
    DROP 데이터베이스, 테이블을 삭제
    TRUNCATE 테이블을 초기화
    
    CREATE
    CREATE TABLE TB
    (COL DATATYPE 기본값(생략가능) NULL(생략가능));
    
    CREATE(복사)
    CREATE TABLE 새로운만들테이블명
    AS SELECT * FROM 복사할테이블명;
    
    ALTER
    1. 테이블 컬럼 추가하기
    [문법] ALTER TABLE?테이블명 ADD(컬럼명 데이타타입(사이즈));

    2. 테이블 컬럼 수정하기
    [문법] ALTER TABLE?테이블명 MODIFY(컬럼명 테이타타입(사이즈));
    
    3. 테이블 컬럼 삭제하기
    [문법] ALTER TABLE 테이블명 DROP COLUMN?컬럼명

    4. 테이블 컬럼 이름 변경하기
    [문법] ALTER TABLE 테이블명 RENAME COLUMN 원래컬럼명 TO 바꿀컬럼명;

    DROP
    DROP TABLE 테이블 이름;
    DROP CONSTRAINT 제약조건 이름;
    
    TRUNCATE
    TRUNCATE TABLE 테이블 이름;
    
    제약 조건(constraint)
    1. NOT NULL
    2. UNIQUE
    3. PRIMARY KEY
    4. FOREIGN KEY
    5. DEFAULT
    6. CHECK
    
    1. NOT NULL - NOT NULL을 사용하게 되면 인서트시 꼭 데이터값이 들어가야만 합니다.
    테이블 생성시 제약조건 추가법
    
    -CREATE TABLE 테이블명(
    컬럼명 데이터타입() NOT NULL);
    
    생성 후에 NOT NULL 제약조건 추가법
    
    -ALTER TABLE 테이블명 MODIFY 컬럼명 NOT NULL;
    
    2. UNIQUE - 고유값(중복X)
    
    -CREATE TABLE 테이블명(
    컬럼명 데이터타입() UNIQUE);
    -CREATE TABLE 테이블명( // CONSTRAINT명 생성
    컬럼명 데이터타입() CONSTRAINT 제약조건명 UNIQUE(컬럼명));
    -CREATE TABLE 테이블명(
    컬럼명 데이터타입(),
    CONSTRAINT 제약조건명 UNIQUE(컬럼명));
    
    3. PRIMARY KEY(NOT NULL,UNIQUE)
    
    -CREATE TABLE 테이블명(
    컬럼명 데이터타입() PRIMARY KEY
    );
     -CREATE TABLE 테이블명(
    컬럼명 데이터타입(),
    CONSTRAINT 제약조건명 PRIMARY KEY (컬럼명)
    );
    
    4.FOREIGN KEY
    외래키 (Foreign Key)
    기본키(Primary Key) 값이 있는 테이블을 다른 테이블 간 연결을 설정할때 사용된다.
    PK(Primary Key 기본키)를 가지고 오는 테이블이 외래키(FK Foreign Key)를 가지게 된다.
    기본키(PK)를 가지고 있는 테이블(부모테이블)이 생성되어야, 외래키(FK)를 가지는 테이블(자식테이블)을 생성할 수 있다.
    Foreign Key의 이름은 중복되서는 안된다.

    -CREATE TABLE 테이블명1(
    컬럼명1 데이터타입 PRIMARY KEY
    );
    CREATE TABLE 테이블명2(
    컬럼명1 데이터 타입,
    CONSTRAINT 제약조건명 FOREIGN KEY(컬럼명1)
    REFERENCES 참조할 테이블명1(참조할 컬럼명1) ON DELETE CASCADE);
    
    ON DELETE CASCADE- 참조되는 부모 테이블의 행에 대한 DELETE를 허용한다.
    즉. 참조되는 부모테이블 값이 삭제되면 연쇄적으로 자식테이블 값 역시 삭제됩니다.

    5. DEFAULT
    CREATE TABLE 테이블명(
    컬럼명 데이터타입 DEFAULT 기본값);
    
    ALTER TABLE 테이블명
    MODIFY 컬럼명 DEFAULT 기본값

    6. CHECK
    테이블 생성시
    CREATE TABLE 테이블명(
    컬럼명 데이터타입 CONSTRAINT 제약조건명 CHECK(조건 또는 범위));
    
    테이블 생성 후
    ALTER TABLE 테이블명
    ADD CONSTRAINT 제약조건명 CHECK(조건 또는 범위);


1. 테이블 복사하기 스키마 & 데이터
CREATE TABLE 새로만들테이블명 AS
SELECT * FROM 복사할테이블명 [WHERE 절]
?
?

2. 테이블 구조만 복사하기
CREATE TABLE?새로만들테이블명?AS
SELECT * FROM?복사할테이블명?WHERE 1=2 [where절에 '참'이 아닌 조건을 넣어줌]
?
?

3. 테이블은 이미 생성되어 있고 데이터만 복사 (테이블 구조가 동일할 때)
INSERT INTO?복사할테이블명?SELECT * FROM 테이블명?[WHERE 절]
--Sample SQL
INSERT INTO TB_BOARD_TEMP SELECT * FROM TB_BOARD;
?
?

4. 테이블은 이미 생성되어 있고 데이터만 복사 (테이블 구조가 다를 때)
INSERT INTO?복사할테이블명?(NUM, TITLE, CONTENTS) SELECT NUM, TITLE, CONTENTS FROM?테이블명


    DCL
    GRANT 특정 데이터베이스 사용자에게 특정 작업에 대한 수행 권한을 부여
    REVOKE 특정 데이터베이스 사용자에게 특정 작업에 대한 수행 권한을 박탈, 회수
    COMMIT 트랜잭션의 작업을 저장
    ROLLBACK 트랜잭션의 작업을 취소, 원래대로 복구
    
    트랜잭션
    ROLLBACK;
    COMMIT;

    뷰생성
    CREATE VIEW 뷰이름 AS SELECT문

    INDEX 생성
    CREATE [UNIQUE] INDEX [스키마명.]인덱스명
      ON [스키마명.]테이블명 (컬럼1 [, 컬럼2, 컬럼3, ...])
    
    시퀀스생성
    CREATE SEQUENCE 스키마명.시퀀스명
        INCREMENT BY 1 (증가값(1씩 증가))
        START WITH 1 (시작값)
        MINVALUE 1 (최솟값)
        MAXVALUE 9999 (최댓값)
        NOCYCLE (최댓값 도달시 시작값부터 다시 반복)
        NOCACHE (CACHE를 사용할지 여부)
        NOORDER; (요청 순서대로 값을 생성할지 여부)

    NOCYCLE|CYCLE: NOCYCLE(반복안함), CYCLE(시퀀스의 최댓값에 도달 시 최솟값 1부터 다시시작)
    NOCACHE|CACHE: NOCACHE(사용안함), CACHE(캐시를 사용하여 미리 값을 할당해 놓아서 속도가 빠르며, 동시 사용자가 많을 경우 유리)
    NOORDER|ORDER: NOORDER(사용안함), ORDER(요청 순서로 값을 생성하여 발생 순서를 보장하지만 조금의 시스템 부하가 있음)
    
    
*/
