create table pracmyfile(
    id number constraint pracmyfile_pk primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(200) not null,
    nfile varchar2(100) not null,
    regdate date default sysdate not null
);