create table dogs
(
    id integer not null primary key,
    name varchar(50) not null
);

insert into dogs values (1, 'Cachorro 1');
insert into dogs values (2, 'Cachorro 1');
insert into dogs values (3, 'Cachorro 1');

create table cats
(
    id integer not null primary key,
    name varchar(50) not null
);

insert into cats values (1, 'Gato 1');
insert into cats values (2, 'Gato 1');
insert into cats values (3, 'Gato 1');
 
select unique name 
from dogs
union
select name
from cats;
