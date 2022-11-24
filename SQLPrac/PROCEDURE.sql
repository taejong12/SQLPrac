/*PL/SQL(Procedural language extention to SQL) SQL 확장 절차 언어
    Procedure : 리턴 값이 하나 이상인 경우
    Function : 리턴이 반드시 있는 경우(인풋 아웃풋)
    Trigger : 특정한 이벤트가 발생하면 자동으로 실행
    
    package : 프로시저, 함수, 변수 등 묶는 것.
    
    선언부
    DECLARE
        변수 상수 커서 값 선언 부분 // 선택
        
    실행부
    BEGIN
        절차적 언어 제어문, 반복문, 함수 로직이 기술되는 부분 // 필수
        
    예외 처리부
    EXCEPTION
        예외사항 처리하는 부분 // 선택
        
    실행문 종료부
    END // 필수
    
    DBMS_OUTPUT.PUT_LINE(출력내용)
    
    IDENTIFIER [CONSTANT] DATATYPE    [:= | DEFAULT EXPRESSION ]
    변수명      상수지정     데이터타입    LITERAL, 변수, 표현식(함수, 연산자)
    PASSWORD CONSTANT VARCHAR2 :='2341';
    PASSWORD CONSTANT VARCHAR2 DEFAULT '1234';
    
    
    반복문
    FOR INDEX IN 시작값..끝값 LOOP
        실행문
        실행문
        ....
    END LOOP;
    
    LOOP
        실행문
        EXIT [WHEN CONDITION]
    END LOOP;
    
    
    
    
*/

CALL PROCTEST1();
