--use Estates_Locations;
--go

 
create table employee(
employee_id int,
first_name VARCHAR (64) NOT NULL,
last_name VARCHAR (64) NOT NULL,
constraint employee_pk primary key(employee_id)
);

--create TABLE estate_Estates_locations(
--id int  PRIMARY KEY,
--estate_name varchar(255),
--city_no int)


alter table estate_Estates_Locations
add constraint city_estate_fk foreign key(city_no) 
references city(city_id)

alter table estate_Estates_locations
add constraint estate_typeEstateslocations_fk foreign KEY(estate_type_No)
REFERENCES estate_type(estate_type_id);

alter table estate_Estates_locations
add floor_space decimal(8, 2) not null;

alter table estate_Estates_locations
add balconies_space decimal(8 ,  2) not null;

alter table estate_Estates_locations
add number_of_balconies int not null;

alter table estate_Estates_locations
add number_of_bedrooms int not null;
alter table estate_Estates_locations
add number_of_garages int not null;
alter table estate_Estates_locations
add number_of_parking_spaces int not null;

alter table estate_Estates_locations
add pets_allowed boolean not null;

alter table estate_Estates_locations
add estate_description text not null;

alter table estate_Estates_locations
add estate_statusNO int
alter table estate_Estates_locations
add constraint estate_statusNO_fk foreign key(estate_statusNO)
REFERENCES estate_status(estate_statusID);
;

create table estate_status(
estate_statusID int not null primary key,
estate_status_name varchar(84));

create table estate_type(
id int primary key,
type_name varchar(128))
alter table estate_type
EXEC sp_rename 'estate_type.id','estate_type_id';

--create table in_charge(
--incharge_id int primary key
--estate_id int);
--alter table in_charge
--add constraint estate_idNo_fk foreign key 
--REFERENCES charges(estate_id);
--employee_id int,
--alter table in_charge

--add constraint charge_employeeID_fk foreign key 
--REFERENCES estate_Estates_locations(id));
--date_from date not null,
--date_to date not null),

-- );

use realestate;
go

create table InCharge(
incharge_id int primary key,
estate_no int,
employee_no int,
date_from date,
date_to date);
alter table InCharge
add constraint unique_icharge_constraint unique(incharge_id)

alter table InCharge
add constraint employee_no_fk
foreign key(employee_no)
references [EstatesLocations].[employee](employee_id);

alter table InCharge
drop constraint estate_no_fk;
foreign key(estate_no)
references estate_status(estate_statusID);



create table country(country_id int primary key,
EXEC sp_rename 'country.id', 'country_id';
country_name varchar (128));

--alter table country
--alter column country_id int not null;
--)



use table city (
  city_id INT primary key,
  city_name VARCHAR(128),
  country_idno INT
);

-- alter table city
ALTER TABLE city_RE
  ALTER COLUMN city_id INT NOT NULL;

ALTER TABLE city_RE
  ADD CONSTRAINT city_pk PRIMARY KEY (city_id);

ALTER TABLE city_RE
  ADD CONSTRAINT country_idno_fk FOREIGN KEY (country_idno)
  REFERENCES country (country_id);

-- select data from city
SELECT * FROM [realestate].[dbo].[city];

ALTER TABLE [realestate].[dbo].[city]
ADD CONSTRAINT FK_City_Country
FOREIGN KEY ([country_idno])
REFERENCES [realestate].[dbo].[country]([country_id])
ON UPDATE CASCADE;





-- Drop the foreign key constraint
--ALTER TABLE [realestate].[dbo].[city]
--DROP CONSTRAINT [country_idno];

---- Update the primary key in [country] table
--UPDATE [realestate].[dbo].[country]
--SET [country_id] = new_country_id
--WHERE [country_id] = old_country_id

---- Re-add the foreign key constraint
--ALTER TABLE [realestate].[dbo].[city]
--ADD CONSTRAINT FK_City_Country
--FOREIGN KEY (country_idno)
--REFERENCES [realestate].[dbo].[country](country_id)
--ON UPDATE CASCADE;
