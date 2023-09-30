create database student_manager;

use student_manager;

create table clazz
(
    id   int primary key auto_increment,
    name varchar(50) unique
);

create table student
(
    id    int primary key auto_increment,
    name  varchar(50),
    score double
);

alter table student add clazz_id int references clazz(id);

create table user
(
    id       int primary key auto_increment,
    username varchar(100) not null unique,
    password varchar(100) not null
);

create table role
(
    id   int primary key auto_increment,
    name varchar(50)
);

create table user_role
(
    id      int primary key auto_increment,
    user_id int,
    role_id int,
    foreign key (user_id) references user (id),
    foreign key (role_id) references role (id)
);

insert into clazz (name) values ('N0623C1');
insert into clazz (name) values ('N0723C1');
insert into clazz (name) values ('N0823C1');

insert into student (name, score) values ('Nguyễn Văn A', 9.6);
insert into student (name, score) values ('Nguyễn Văn B', 9.0);
insert into student (name, score) values ('Nguyễn Văn C', 5.6);

insert into user (id, username, password) VALUES (1, 'QuangNN', '$2a$12$XctRTksKl/0S70G4acoa5e8x3O91WpOwZt..nkJv8Zrfb4lb5II42');
insert into user (id, username, password) VALUES (2, 'user', '$2a$12$yCUs1N/jncjhpCMdNCHsTuWaB1WEZyOMpAFPzdQGg5988ZQ.71VIK');
insert into user (id, username, password) VALUES (3, 'admin', '$2a$12$O2hbzHcrdtnj1CFyn3D0KO69ImZiWZ18jf9HCZ//1OSsfo7wutSSK');

insert into role (id, name) VALUES (1, 'user');
insert into role (id, name) VALUES (2, 'admin');

insert into user_role (user_id, role_id) VALUES (1, 1);
insert into user_role (user_id, role_id) VALUES (1, 2);
insert into user_role (user_id, role_id) VALUES (2, 1);
insert into user_role (user_id, role_id) VALUES (3, 2);


select r.name as role from user u inner join user_role ur on u.id = ur.user_id
inner join role r on ur.role_id = r.id where u.username = ?;



select * from user where username like '%' and username like '%';

