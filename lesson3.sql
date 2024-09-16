/*таблиця: зв'язки багато до багатьох і один до одного*/

use oleks;

create table skills (
                        id int primary key auto_increment,
                        skill varchar(20) not null
);

create table usersSchool (
                             id int primary key auto_increment,
                             username varchar(20) not null ,
                             password varchar(200) not null
);

create table user_skills (
                             user_id int not null,
                             skill_id int not null,
                             primary key (user_id, skill_id),
                             foreign key (user_id) references usersSchool(id),
                             foreign key (skill_id) references skills(id)
);

select * from usersSchool
                  join user_skills us on usersSchool.id = us.user_id
                  join skills s on s.id = us.skill_id
                  join profile p on usersSchool.id = p.user_id
;


create table profile (
                         id int primary key auto_increment,
                         name varchar(20) not null ,
                         age int not null,
                         user_id int not null unique,
                         foreign key (user_id) references usersSchool(id)
);