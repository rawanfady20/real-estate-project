use realestate;
go
--create schema client_contract;
create table client_Ccontract(
client_Ccontract_ID int not null primary key,
client_name varchar(255),
client_address varchar(255),
contact_person varchar(255),
phone varchar(84),
mobile varchar(84),
mail varchar(84),
client_details text)

create table contact(contact_id,
client_idNO int ,
employee_idNO int,
estate_idNO int,
contct_time timestamp,
contact_details text)

create table