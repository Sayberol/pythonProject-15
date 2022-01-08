INSERT into colors (name)
select * from 
(select DISTINCT rtrim(color1)
from animals 
union
select DISTINCT rtrim(color2)
from animals where color2 is not NULL);

CREATE table colors(
	id integer primary key autoincrement,
	name varchar(30))
	
select *
from colors;
	
CREATE table animal_colors (
	animal_id int,
	color_id int)
	
insert into animal_colors
select animals."index",
	   colors.name
from animals
join colors on rtrim(animals.color1)=rtrim(colors.name);

insert into animal_colors
select animals."index"
	   colors.name
from animals;
join colors on rtrim(animals.color2)=rtrim(colors.name);

SELECT DISTINCT animal_id, "color_id"
from animal_colors;

drop table outcomes

CREATE table outcomes(
	outcome_id integer primary key autoincrement
	age_upon_outcome varchar(50),
	outcomes_subtype varchar(50),
	outcome_type varchar(50),
	outcome_mouth int,
	outcome_year int,
	animal_id
)

insert into outcomes (animal_id, outcome_subtype, outcome_type, outcome_mouth, outcome_year)
select DISTINCT animal_id, outcome_subtype, outcome_type, outcome_mouth, outcome_year
from animals;


create table animal_types(
	id integer primary key autoincrement,
	name varchar(30))
	
insert into animal_types(name)
select DISTINCT (animal_type) from animals 

select *
from animal_types;

create table breed(
	id integer primary key autoincrement,
	name varchar(30))

insert into breed(name)
select DISTINCT (breed)
from animals;

select *
from breed;

drop table animals_fin 

create table animals_fin(
	id integer primary key autoincrement,
	animal_id varchar(30),
	type_id int,
	name varchar(50),
	breed_id int,
	data_of_birth data
);

INSERT into animals_fin(animal_id)
values('10')

select animal_id
from animals;

INSERT into animal_fin(animal_id, type_id, name, breed_id, data_of_birth)
select DISTINCT animal_id, animal_types.id, animals.name, breed.id, date_of_birth
from animals
left join animal_types on animals.animal_type=animal_types.name
left join breed on animals.breed=breed.name
;

SELECT *
from animals_fin;

select * 
from outcomes
left join animals_fin on outcomes.animal_id=animal_id


SELECT * from animals_fin
left join outcomes on outcomes.animal_id=animal_id
WHERE animals_fin.id={idx}
