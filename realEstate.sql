--
--  Create a Residential Real Estate Database
--

set termout on
set feedback on
prompt Residential Real Estate Database.  Please wait ...


drop table Branch		cascade constraint;
drop table Staff 		cascade constraint;
drop table Payroll    		cascade constraint;
drop table Property   		cascade constraint;
drop table Property_Features  	cascade constraint;
drop table Inspection    	cascade constraint;
drop table Advertise	   	cascade constraint;
drop table Client   		cascade constraint;
drop table Buyer  		cascade constraint;
drop table Renter   		cascade constraint;


create table Branch (
	branch_id	NUMBER(5),
	manager_id 	NUMBER(5),
	phone_number 	NUMBER(10),
	branch_name	VARCHAR(22),
	address_line1	VARCHAR(13),
	address_line2	VARCHAR(15),
	city		VARCHAR(10),
	state		VARCHAR(10),
	zipcode		NUMBER(5),
	country		VARCHAR(10),
	primary key 	(branch_id)
);

insert into Branch values (10001, 20001, 5125355001, 'Avery Ranch Branch',  '6102', 'Gun Bow Ct', 	'Austin', 'TX', '78746', 'USA');
insert into Branch values (10002, 20002, 5125355002, 'Cedar Park Branch',   '5210', 'Meadow Creek Dr',  'Austin', 'TX', '78747', 'USA');
insert into Branch values (10003, 20003, 5125355003, 'Circle C Branch',     '8916', 'Frock Ct', 	'Austin', 'TX', '78748', 'USA');
insert into Branch values (10004, 20004, 5125355004, 'Shady Hollow Branch', '1902', 'Rainy Meadow Dr', 'Austin', 'TX', '78766', 'USA');
insert into Branch values (10005, 20005, 5125355005, 'Steiner Ranch Branch','611',  'W Johanna St ', 	'Austin', 'TX', '78756', 'USA');

create table Staff (
	staff_id#	NUMBER(5),
	branch_id	NUMBER(5) references Branch(branch_id),
	phone_number 	NUMBER(10),
	first_name	VARCHAR(15),
	last_name	VARCHAR(15),
	gender		CHAR(1) CHECK (gender in ('M', 'F')),
	email		VARCHAR(20),
	address_line1	VARCHAR(13),
	address_line2	VARCHAR(15),
	city		VARCHAR(10),
	state		VARCHAR(10),
	zipcode		NUMBER(5),
	country		VARCHAR(10),
	PRIMARY KEY	(staff_id#)
);

insert into Staff values (20001, 10001, 5127007001, 'Scott',   'Bayer', 'M',   'scott@gmail.com', 	'9100', 'Cahill Dr ', 	'Austin', 'TX', '78756', 'USA');
insert into Staff values (20002, 10002, 5127007002, 'Ashley',  'Pill',  'F',   'ashley@gmail.com',      '2110', 'Stafford St ', 'Austin', 'TX', '78757', 'USA');
insert into Staff values (20003, 10003, 5127007003, 'Christy', 'Dixon', 'F',  'christy@gmail.com', 	'3009', 'Firwood Dr', 	'Austin', 'TX', '78757', 'USA');
insert into Staff values (20004, 10004, 5127007004, 'Desiree', 'Ashby', 'F',  'desiree@gmail.com', 	'3423', 'Glenlake Dr ', 'Austin', 'TX', '78759', 'USA');
insert into Staff values (20005, 10005, 5127007005, 'Timothy', 'Bush',   'F', 'tomithy@gmail.com', 	'7002', 'Kildare Cv ', 	'Austin', 'TX', '78746', 'USA');
insert into Staff values (20006, 10001, 5127007006, 'Oliver',  'Twist',  'M',  'oviver@gmail.com',      '3883', 'Elder Cir  ', 	'Austin', 'TX', '78745', 'USA');
insert into Staff values (20007, 10002, 5127007007, 'Stan',    'Poel',   'M',   'stan@gmail.com', 	'7023', 'Willow St  ', 	'Austin', 'TX', '78751', 'USA');
insert into Staff values (20008, 10003, 5127007008, 'Katy',    'Schultz','F',   'katy@gmail.com', 	'9003', 'Dry Oak CV ', 	'Austin', 'TX', '78752', 'USA');
insert into Staff values (20009, 10004, 5127007009, 'Lucent',  'Dudly',  'M',   'dudly@gmail.com', 	'1111', 'Glenwood Dr ', 'Austin', 'TX', '78752', 'USA');
insert into Staff values (20010, 10005, 5127007011, 'Shan',    'Neale',  'M',  'kneale@gmail.com',      '2231', 'Woodlake Dr ', 'Austin', 'TX', '78753', 'USA');


alter session set nls_date_format = 'mm-dd-yyyy';	

create table Payroll (
	staff_id#	NUMBER(5),
	designation	VARCHAR(18),
	salary		NUMBER(5),
	join_date	DATE,
	commission	NUMBER(2),
	PRIMARY KEY	(staff_id#)
);

insert into Payroll values (20001, 'Manager', 65000, '11-11-2001', 3);
insert into Payroll values (20002, 'Manager', 62000, '02-01-2002', 3);
insert into Payroll values (20003, 'Manager', 62000, '03-01-2002', 3);
insert into Payroll values (20004, 'Manager', 60000, '04-01-2003', 3);
insert into Payroll values (20005, 'Manager', 60000, '05-01-2003', 3);
insert into Payroll values (20006, 'Assistant Manager', 50000, '06-02-2004', 2);
insert into Payroll values (20007, 'Junior Staff', 40000, '02-02-2012', 1);
insert into Payroll values (20008, 'Assistant Manager', 50000, '06-02-2004', 2);
insert into Payroll values (20009, 'Assistant Manager', 50000, '06-02-2004', 2);
insert into Payroll values (20010, 'Assistant Manager', 50000, '06-02-2004', 2);

create table property(
	property_id	NUMBER(5),
	staff_id#	NUMBER(5) references Staff(staff_id#),
	branch_id	NUMBER(5) references Branch(branch_id),
	house_type	CHAR(10),
	available	CHAR(1) CHECK (available in ('Y', 'N')),
	sale_rent	char(20), 
	address_line1	VARCHAR(13),
	address_line2	VARCHAR(16),
	city		VARCHAR(10),
	state		VARCHAR(10),
	zipcode		NUMBER(5),
	country		VARCHAR(10),	
	PRIMARY KEY	(property_id)
);

insert into property values (40001, 20001, 10001, 'House', 'Y', 'Private Sale', '5003', 'Indigo Dr ',   'Austin', 'TX', '78745', 'USA');
insert into property values (40002, 20002, 10002, 'House', 'Y', 'Private Sale', '6001', 'Zillow St  ',  'Austin', 'TX', '78745', 'USA');
insert into property values (40003, 20003, 10003, 'House', 'Y', 'Auction Sale', '7002', 'Kildare Cv ',  'Austin', 'TX', '78745', 'USA');
insert into property values (40004, 20004, 10004, 'House', 'N', 'Private Sale', '2441', 'Gracy Dr ',    'Austin', 'TX', '78745', 'USA');
insert into property values (40005, 20005, 10005, 'House', 'Y', 'Private Sale', '1033', 'Indigo Dr ',   'Austin', 'TX', '78745', 'USA');
insert into property values (40006, 20006, 10001, 'Condo', 'Y', 'Rent', 	'2033', 'Vindiya Dr ',  'Austin', 'TX', '78745', 'USA');
insert into property values (40007, 20007, 10002, 'House', 'Y', 'Rent', 	'4033', 'Nile Dr ',     'Austin', 'TX', '78745', 'USA');
insert into property values (40008, 20008, 10003, 'House', 'Y', 'Rent', 	'7033', 'Colorado Dr ', 'Austin', 'TX', '78745', 'USA');
insert into property values (40009, 20009, 10004, 'Condo', 'Y', 'Rent', 	'9033', 'Boston Dr ',   'Austin', 'TX', '78745', 'USA');
insert into property values (40010, 20010, 10005, 'House', 'Y', 'Rent', 	'6033', 'Ganga Dr ',    'Austin', 'TX', '78745', 'USA');

create table Client (
	Client_id#	NUMBER(5),
	property_id	NUMBER(5) references Property(property_id),
	phone_number 	NUMBER(10),
	first_name	VARCHAR(15),
	last_name	VARCHAR(11),
	gender		CHAR(1) CHECK (gender in ('M', 'F')),
	email		VARCHAR(20),
	address_line1	VARCHAR(13),
	address_line2	VARCHAR(16),
	city		VARCHAR(10),
	state		VARCHAR(10),
	zipcode		NUMBER(5),
	country		VARCHAR(10),
	PRIMARY KEY	(Client_id#)
);

insert into Client values (30001, 40001, 5129008001, 'Mickey',    'Tana',  'M',  'micky@gmail.com', 	'1100', 'Tinita Dr ', 	'Austin', 'TX', '78756', 'USA');
insert into Client values (30002, 40002, 5129008002, 'Minnie',    'Rana',  'F',   'mini@gmail.com',	'2110', 'Stassney St ', 'Austin', 'TX', '78757', 'USA');
insert into Client values (30003, 40003, 5129008003, 'Donald',   ' Dixon', 'M',  'dduck@gmail.com', 	'3000', 'Pinkney Dr', 	'Austin', 'TX', '78757', 'USA');
insert into Client values (30004, 40004, 5129008004, 'Goofy',     'Sana',  'M',  'goofy@gmail.com', 	'4000', 'Ginita Dr ', 	'Austin', 'TX', '78759', 'USA');
insert into Client values (30005, 40005, 5129008005, 'Pluto',     'Landay', M', 'pluto@gmail.com', 	'7002', 'Davis Lane ', 	'Austin', 'TX', '78746', 'USA');
insert into Client values (30006, 40006, 5129008011, 'John',      'Wana',  'M',  'mjohn@gmail.com', 	'1440', 'Buvana Dr ', 	'Austin', 'TX', '78756', 'USA');
insert into Client values (30007, 40007, 5129008022, 'Jack',      'Jana',  'M',   'jack@gmail.com',	'2550', 'Stassney St ', 'Austin', 'TX', '78757', 'USA');
insert into Client values (30008, 40008, 5129008033, 'Jill',      'Nixon', 'F',  'jill@gmail.com', 	'3660', 'Wisteria Dr', 	'Austin', 'TX', '78757', 'USA');
insert into Client values (30009, 40009, 5129008044, 'Gregoria',  'Gomez', 'F',  'gomez@gmail.com', 	'4770', 'Huffman lane', 'Austin', 'TX', '78759', 'USA');
insert into Client values (30010, 40010, 5129008055, 'Kaif',      'Kapoor','M', 'kkaif@gmail.com', 	'8802', 'Harvard Dr ', 	'Austin', 'TX', '78746', 'USA');

create table Property_Features (
	property_id	NUMBER(5),
	listed_date	DATE,
	listed_price	NUMBER(8),
	sold_price	NUMBER(8),
	ocean_view	VARCHAR(12),
	Sq_ft		NUMBER(5),
	Lot_size	NUMBER(6),
	bedroom		NUMBER(2),
	bathroom	NUMBER(2),
	sale_type	CHAR(4),	
	PRIMARY KEY	(property_id) 
);

insert into Property_Features values (40001, '05-04-2014', 235000, 240000, 'green belt', 2200, 5800, 2, 2, 'PISD');
insert into Property_Features values (40002, '05-25-2014', 275000, 270000, 'ocean view', 2300, 6000, 2, 2, 'PISD');
insert into Property_Features values (40003, '06-03-2014', 285000, 290000, 'null', 2400, 6100, 3, 2, 'AUSD');
insert into Property_Features values (40004, '07-05-2014', 335000, 336000, 'green belt', 3200, 7800, 3, 3, 'PISD');
insert into Property_Features values (40005, '07-15-2014', 349000, 340000, 'null', 3200, 8000, 4, 3, 'PISD');


create table Inspection(
	property_id	NUMBER(5),
	inspection_date	DATE,
	insp_time	VARCHAR(8),
	PRIMARY KEY	(property_id)
);

insert into Inspection values (40001, '05-14-2014', '11:10:00');	
insert into Inspection values (40002, '06-15-2014', '13:21:00');
insert into Inspection values (40003, '06-23-2014', '09:12:00');
insert into Inspection values (40004, '07-25-2014', '10:15:00');
insert into Inspection values (40005, '08-03-2014', '11:00:00');

create table Advertise(
	property_id	NUMBER(5),
	newspaper	VARCHAR(30),
	adv_date	DATE,
	cost		NUMBER(5),
	comments	VARCHAR(120),
	PRIMARY KEY	(property_id)
);

insert into Advertise values (40001, 'Austin Statesman','05-11-2014',  '1000', 'Green belt view, 2 bed, 2 bath, 2200 sq. ft' );	
insert into Advertise values (40002, 'Houston Herald',	'06-11-2014', '1000',  'Ocean view, 2 bed, 2 bath, 2300 sq. ft' ) );
insert into Advertise values (40003, 'Deccan Chronicle', '06-20-2014', '1000', 'Newly renovated, 3 bed, 2 bath, 2400 sq.ft' );
insert into Advertise values (40004, 'Sunday Times', 	'07-20-2014', '1000', 'Green belt view, 3 bed, 3 bath, 3200 sq. ft' );
insert into Advertise values (40005, 'Daily Digest', 	'08-01-2014', '1000', 'Very Spacious floor plan, 4 bed, 3 bath, 3200 sq. ft' );

create table Buyer(
	Client_id	NUMBER(5),
	property_id	NUMBER(5) REFERENCES Property(property_id),
	min_price 	NUMBER(8),
	max_price	NUMBER(8),
	location	VARCHAR(18),
	min_sq_ft	NUMBER(5),
	max_sq_ft	NUMBER(5),
	min_lot_size	NUMBER(5),
	max_lot_size	NUMBER(5),
	bedroom		NUMBER(1),
	bathroom	NUMBER(1),
	PRIMARY KEY	(Client_id)
);

insert into Buyer values (30001, 40001, 225000, 250000, 'Round Rock', 	2200, 2400, 5000, 6000, 2, 2);
insert into Buyer values (30002, 40002, 225000, 270000, 'Cedar Park', 	2200, 2400, 5000, 6000, 2, 2);
insert into Buyer values (30003, 40003, 275000, 290000, 'Shady Hollow', 2200, 2800, 5000, 7000, 2, 2);
insert into Buyer values (30004, 40004, 305000, 350000, 'Circle C', 	3200, 3400, 6000, 8000, 2, 2);
insert into Buyer values (30005, 40005, 325000, 360000, 'Great hills',  3200, 3600, 6000, 8000, 2, 2);


create table Renter(
	Client_id	NUMBER(5),
 	property_id	NUMBER(5) REFERENCES Property(property_id),
	Monthly_pymt	NUMBER(8),
	Lease_begin	DATE,
	Lease_end	DATE,
	Owner_id	NUMBER(5),
	PRIMARY KEY	(Client_id)
);

insert into Renter values (30006, 40006, 1100, '01-01-2013', '01-01-2014', 30010);
insert into Renter values (30007, 40007, 1200, '02-01-2013', '02-01-2014', 30011);
insert into Renter values (30008, 40008, 1300, '03-01-2013', '03-01-2014', 30012);
insert into Renter values (30009, 40009, 1220, '04-01-2013', '04-01-2014', 30013);
insert into Renter values (30010, 40010, 1400, '05-01-2013', '05-01-2014', 30014);