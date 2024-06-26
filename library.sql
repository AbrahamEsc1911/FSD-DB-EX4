create database online_learning;

use online_learning;

create table user (
id int primary key auto_increment not null,
name varchar(35) not null,
role enum('student', 'teacher') default 'student',
is_active boolean default false,
created_at datetime default current_timestamp,
updated_at datetime default current_timestamp on update current_timestamp
);

create table courses (
id int primary key auto_increment not null,
name varchar(50) not null,
description text,
created_at datetime default current_timestamp
);

create table lessons (
user_id int,
foreign key (user_id) references user(id),
courses_id int,
foreign key (courses_id) references courses(id),
primary key (user_id, courses_id),
due_time datetime not null
);

create table tasks (
user_id int,
foreign key (user_id) references user(id),
courses_id int,
foreign key (courses_id) references courses(id),
primary key (user_id, courses_id),
created_at datetime default current_timestamp,
status enum('pending', 'doing', 'done') default 'pending'
);

create table exams (
user_id int,
foreign key (user_id) references user(id),
courses_id int,
foreign key (courses_id) references courses(id),
primary key (user_id, courses_id),
due_time datetime not null,
status enum('pending','aproved', 'failed') default 'pending'
);

create table grades (
user_id int,
foreign key (user_id) references user(id),
courses_id int,
foreign key (courses_id) references courses(id),
primary key (user_id, courses_id),
grades float(2, 1)
);                  