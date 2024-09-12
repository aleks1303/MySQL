use oleks;

select distinct name, age from oleks.users; /*унікальні значення без дублікатів*/

# використання декілька агрегатних функцій
select avg(age), sum(age) from oleks.users;

# теж саме але як в масиві
select avg(age) from oleks.users
union
select sum(age) from oleks.users;

# математичні дії
select id, price, price *2 as doublePrice from oleks.cars;

# текстове додавання з БД
select concat('My name is ', name, ' I`m ' ,age, ' gender - ', gender) as srtings from oleks.users;
select concat('My name is ', name, ' I`m ' ,age, ' gender - ', gender) as srtings from oleks.users;

# знайти в БД по шаблону з фронтенду
select * from oleks.users where concat('My name is ', name, ' I`m ' ,age, ' gender - ', gender) = 'My name is Max I`m 16 gender - male';

# пошук по алфавіту та кількості букв
select * from oleks.users where name >= 'max';

select * from oleks.users where age = id+17;

# нижній та верхній регістр
select lower(name) from oleks.users;
select upper(name) from oleks.users;


# з'єднання таблиць (client, application, department)
select * from oleks.application
join oleks.client on client.idClient = application.Client_idClient
where FirstName='igor';

# вибірка данних з однієї таблиці
select oleks.application. * from oleks.application
join oleks.client on client.idClient = application.Client_idClient
where FirstName='roman';

# вибірка данних з іншої об'єднаної таблиці з додатковою інфо з іншої таблиці
select oleks.client. *, oleks.application.CreditState from oleks.application
join oleks.client on client.idClient = application.Client_idClient
where FirstName='igor';

# об'єднання трьох табличок
select a. *, oleks.client.FirstName, City, d.DepartmentCity from oleks.client
join oleks.application a on client.idClient = a.Client_idClient
join oleks.department d on d.idDepartment = client.Department_idDepartment;


# створення та об'єднання таблиць
create table cities (
                        id int primary key auto_increment,
                        city varchar(20) not null
);

create table usersZoo (
                          id int primary key auto_increment,
                          name varchar(20) not null,
                          age int not null ,
                          city_id int null,
                          foreign key (city_id) references cities(id)
);

# об'єднануємо та шукаємо

select usersZoo.*, c.city from usersZoo
                                   join cities c on c.id = usersZoo.city_id
where city = 'lviv';

# left and right join
select * from usersZoo
                  join cities c on c.id = usersZoo.city_id;

select * from usersZoo left join cities c on c.id = usersZoo.city_id;
select * from usersZoo right join cities c on c.id = usersZoo.city_id;