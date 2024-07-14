SET IDENTITY_INSERT employee ON;
insert into employee(emploeeid,first_name,lastt_name)
values(12375,'mona','bahaa'),
(12346,'menna','kamel'),
(12347,'seif','ali'),
(12348,'lamees','mohammed'),
(12349,'eman','hamza'),
(12340,'wael','gebriel'),
(12350,'hamed','emaeil'),
(12351,'ahmed','salem'),
(12352,'youssef','zekry'),
(12353,'lamees','mohammed'),
(12354,'yasmeen','ali'),
(12355,'merna','masood'),
(12356,'ziad','mohamed'),
(12357,'gaber','othamn'),
(12358,'osama','rashed'),
(12359,'fatma','osama'),
(12260,'marwa','yaseen'),
(12361,'mariem','ameen'),
(12362,'mostafa','kamal'),
(12363,'ahmed','mohamed');

-- Update data in the employee table
UPDATE employee
SET lastt_name = 'UpdatedLastName'
WHERE 
    (emploeeid = 12346 AND first_name = 'menna') OR
    (emploeeid = 12350 AND first_name = 'hamed') OR
    (emploeeid = 12355 AND first_name = 'merna');

select*from employee
delete top (4) percent from employee;



insert into estate_type(type_name)
values('Residential'),
('Commercial'),
('Industrial'),
('Raw land'),
('Special use');
 SELECT* FROM estate_type

INSERT INTO [realestate].[dbo].[estate_status]([estate_status_name], [estate_statusID])
 values('Affordable Realty',1),
('Avenue Realty',2),
('Best Relocation',3),
('Big Block',4),
('Cascade Realty',5),
('Climb Real Estate',6),
('Core Realtors',7),
('Courtland Partners',8),
('Eco Agency',9),
('Equity Point Real Estate',10),
('FirstClose',11),
('Full Circle',12),
('Highrises Realty',13),
('Home Team',14),
('Iconic Development',15),
('Kale Realty',16),
('Landmark Network',17),
('Living Room Realty',18),
('Marker Real Estate',19),
('Modern Realty',20),
('My Dream Home',21),
('Next Home Realty Connection',22),
('Parker Realty',23),
('Premiere Property Group',24),
('Rapid Realty',25),
('Real Living',26),
('Request Real Estate',27),
('Sand and Sea',28),
('Sterling One',29),
('Sync Real Estate',30),
('Team Diva Real Estate',31),
('The Trophy Group',32),
('Top-Notch Realty',33),
('Unlock Real Estate',34),
('Urban Pacific Real Estate',35),
('Wise Cat Realtors',36);

-- Create a view with a left outer join between estate_status and estate_type tables



--update [realestate].[dbo].[estate_status] set estate_statusID = 732 where estate_statusID = 1;
-- Create a view joining estate_status and estate_type tables


delete from [realestate].[dbo].[estate_status]
where [estate_statusID] between 1 and 10;

select estate_statusID,[estate_status_name]
from [realestate].[dbo].[estate_status]
where [estate_statusID] <= 1 or [estate_status_name]='Affordable Realty';


select*from [realestate].[dbo].[estate_status]

SELECT COUNT(*) AS TotalRows
FROM [realestate].[dbo].[estate_status];

SELECT SUM(estate_statusID) AS TotalSum
FROM [realestate].[dbo].[estate_status];

-- Drop the existing foreign key constraint
ALTER TABLE [realestate].[dbo].[estate_status]
DROP CONSTRAINT FK_estate_status_estate_type;

-- Recreate the foreign key constraint with ON UPDATE SET NULL
ALTER TABLE [realestate].[dbo].[estate_status]
ADD CONSTRAINT FK_estate_status_estate_type
FOREIGN KEY ([estate_typeID]) REFERENCES [realestate].[dbo].[estate_type]([estate_typeID])
ON UPDATE SET NULL;

-- Update the estate_typeID in the estate_status table to test ON UPDATE SET NULL
UPDATE [realestate].[dbo].[estate_status]
SET [estate_type_id] = NULL
WHERE [estate_statusID] = 1;  -- Update the row where estate_statusID is 1 as an example


insert into[realestate].[dbo].[country]([country_id],[country_name])
VALUES(54,'Argentina'),
(61,'Australia'),
(973,'Bahrain'),
(55,'Brazil'),
(1,'Canada'),
(56,'Chile'),
(86,'China'),
(57,'Colombia'),
(45,'Denmark'),
(20,'Egypt'),
(33,'France'),
(49,'Germany'),
(30,'Greece'),
(62,'Indonesia'),
(964,'Iraq'),
(965,'Kuwait'),
(60,'Malaysia'),
(212,'Morocco');
select* from country

insert into [realestate].[dbo].[city]([city_name], [city_id], [country_idno])
values
('Toronto',1,1),
('Athens',30,30),
('Cairo',20,20),
('Paris',33,33),
('Vienna',43,43),
('Copenhagen',45,45),
('Berlin',49,49),
('Buenos Aires',54,54),
('Bogota',57,57),
('Sydney',61,61),
('Tbilisi',995,995),
('Kinshasa',243,243),
(' Helsinki',358,358),
(' Zagreb',385,385),
('San Salvador',503,503),
('Beirut',961,961),
(' Amman',962,962),
(' Kuwait City',965,965),
('Manama',973,973);
select* from [realestate].[dbo].[city]
SELECT *
FROM [realestate].[dbo].[country] AS c
FULL OUTER JOIN [realestate].[dbo].[city] AS ci ON c.country_id = ci.country_idno


CREATE VIEW vi AS
SELECT c.country_id, c.country_name, ci.city_id, ci.city_name
FROM [realestate].[dbo].[country] c
JOIN [realestate].[dbo].[city] ci ON c.country_id = ci.country_idno;

SELECT * FROM vi;



SELECT
    [city].[city_name],
    [city].[city_id],
    [country].[country_id],
    [country].[country_name]
FROM
    [realestate].[dbo].[city] AS [city]
INNER JOIN
    [realestate].[dbo].[country] AS [country] ON [city].[country_idno] = [country].[country_id];


	-- Example: Delete a row from the country table
DELETE FROM [realestate].[dbo].[country] WHERE [country_id] = 1;

-- Update city table to set country_idno to NULL for rows with deleted country
UPDATE [realestate].[dbo].[city]
SET [country_idno] = NULL
WHERE [country_idno] IS NOT NULL AND [country_idno] NOT IN (SELECT [country_id] FROM [realestate].[dbo].[country]);
 select * from [realestate].[dbo].[city]