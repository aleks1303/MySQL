show databases;
use oleks;

# пошук вибір
select * from users;
select * from cars;
select id, year, model from cars;
select * from users where name = 'oleg';
select * from users where name != 'oleg';

select * from users where name like '_i%';
select * from users where name like '_o_o%';

select * from users where age = 30;
select * from users where age != 30;
select * from users where age between 25 and 30;
select * from users where age not between 25 and 30;
select * from users where age >= 0 and age <= 55 and gender = 'female' or age = 30;


select * from users where age in (4, 18, 30, 16);
select * from users where age not in (4, 18, 30, 16);

select * from users where length (name) = 4;


# sort
select * from users order by name;
select * from users order by name desc; /*по алфавіту*/

select * from users where age >= 4 order by name;

select * from users order by age, name; /*сортуваня за декільками параметрами*/


# limit
select * from users limit 10 offset 5;


# агрекатні функції
max()
   min()
      avg() /*середнє арифматичне*/
        count()
             sum()


# min значення віку всіх користувачів
select min(age) as minAge from users; /*as дає псевдонім для JS об'єкту*/
select max(age) as maxAge from users;
select avg(age) as avgAge from users; /*середній вік users*/
select count(*) as countAge from users where age > 30;
select sum(age) as sumAge from users;

select min(age), gender from users where age> 25 group by gender;
select max(age), gender from users where age> 25 group by gender;
select * from users where age> (select avg(age) from users where age> 25 and gender = 'male' group by gender);/*більш складніший запит*/
select sum(age), gender from users where age> 25 group by gender;
select count(*), gender from users where age> 25 group by gender having count(*) > 2;


drop table users; /*видалення таблиці (! видалення без відновлення)*/


# створення власної таблиці
create table usersLibrary(
                             id int primary key auto_increment,
                             name varchar(25) not null,
                             age int not null
);
insert into usersLibrary (name, age) values ('Bogdan', 50);

# оновлення users (заміна)
update usersLibrary set name = 'Sophia' where id = 7;

# видалення user
delete from usersLibrary where id in (1,4,6);



