/*PL/SQL(Procedural language extention to SQL) SQL Ȯ�� ���� ���
    Procedure : ���� ���� �ϳ� �̻��� ���
    Function : ������ �ݵ�� �ִ� ���(��ǲ �ƿ�ǲ)
    Trigger : Ư���� �̺�Ʈ�� �߻��ϸ� �ڵ����� ����
    
    package : ���ν���, �Լ�, ���� �� ���� ��.
    
    �����
    DECLARE
        ���� ��� Ŀ�� �� ���� �κ� // ����
        
    �����
    BEGIN
        ������ ��� ���, �ݺ���, �Լ� ������ ����Ǵ� �κ� // �ʼ�
        
    ���� ó����
    EXCEPTION
        ���ܻ��� ó���ϴ� �κ� // ����
        
    ���๮ �����
    END // �ʼ�
    
    DBMS_OUTPUT.PUT_LINE(��³���)
    
    IDENTIFIER [CONSTANT] DATATYPE    [:= | DEFAULT EXPRESSION ]
    ������      �������     ������Ÿ��    LITERAL, ����, ǥ����(�Լ�, ������)
    PASSWORD CONSTANT VARCHAR2 :='2341';
    PASSWORD CONSTANT VARCHAR2 DEFAULT '1234';
    
    
    �ݺ���
    FOR INDEX IN ���۰�..���� LOOP
        ���๮
        ���๮
        ....
    END LOOP;
    
    LOOP
        ���๮
        EXIT [WHEN CONDITION]
    END LOOP;
    
    
    
    
*/

CALL PROCTEST1();
