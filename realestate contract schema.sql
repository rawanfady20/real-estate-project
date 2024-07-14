use realestate;
go
--create table contracts_and_transactions.transaction_type(transaction_id int not null primary key,
--transaction_type_name varchar(84))

--create table  contracts_and_transactions.payment_frequency(payment_id int not null primary key,
--payment_freq_name varchar(84))

--create table contract_type( contract_id int not null primary key,
--contract_type_name varchar(84),
--fee_percentage decimal(8, 4))

--create table clientcntract_and_transaction(clientcontract_transaction_id int not null primary key,
--client_name varchar(255),
--client_address varchar(255),
--contract_person varchar(255),
--phone varchar(84),
--mobile varchar(84),
--mail varchar(84),
--client_details text)

create table contract(
contract_id int not null primary key,
employee_idNO int ,
constraint employee_contract_fk foreign key (employee_idNO)
references EstatesLocations.employee (employee_id)
contract_type_idNO int,

constraint contract_idNO_fk foreign key (contract_type_idNO)
references contract_type (contract_id)
contract_details text,
payment_freqIDNO int;

constraint paymentfreq_contract_fk foreign key(payment_freqIDNO)
references contracts_and_transactions.payment_frequency(payment_id);
number_of_invoices int,
payment_amount decimal(10, 2),
fee_percentage decimal(5, 2),
fee_amount decimal(10, 2),
date_signed date,
start_date date,
end_date date,
);