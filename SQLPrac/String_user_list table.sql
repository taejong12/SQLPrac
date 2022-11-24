create table user_list(
    name varchar2(30) primary key,
    password varchar2(100),
    authority varchar2(30),
    enabled number(1)
);

insert into user_list values('user', '$2a$10$Qfiuy/aGrouhGLoCDVLb9.EB0rlo.FoKnOscn.ZNkU/ouPtFBqj.m', 'ROLE_USER', 1);

insert into user_list values('admin', '$2a$10$OXz5jyRNu.F4I/6VtY5O8eGsdUNCkCEps2DBHBf147Ah2ny0vAtBC', 'ROLE_ADMIN', 1);

insert into user_list values('admin1', '$2a$10$OXz5jyRNu.F4I/6VtY5O8eGsdUNCkCEps2DBHBf147Ah2ny0vAtBC', 'ROLE_ADMIN', 1);

select * from user_list;

commit;
