-- SQL statements for creating schema:
create table branch(
	branchID varchar(5),
	branchName varchar (20) not null, 
	location varchar(20) not null, 
	primary key (branchID)
);

create table sales(
branchID varchar(5),
qtr numeric (1,0),
year numeric(4,0),
qtrly_Sales numeric (10,2),
primary key (branchID, qtr, year),
foreign key (branchID) references branch(branchID) );

create table department( 
	deptName varchar(20), 
	mgrID varchar(5), 
	primary key (deptName) );
-- FOREIGN KEY LATER ADDED

create table employee (
	empID varchar(5),
	first_name varchar(20) not null, 
	last_name varchar(20) not null, 
	dob varchar(10),
	sex char(1),
	salary numeric(8,2),
	deptName varchar(20),
	branchID varchar(5),
	primary key (empID),
	foreign key (branchID) references branch(branchID), 
	foreign key (deptName) references department(deptName) );
	
-- AFTER INSERTING “manager” VALUES INTO EMPLOYEE TABLE, RUN QUERY -->
ALTER TABLE department ADD FOREIGN KEY (mgrID) REFERENCES employee(empID) ON DELETE SET NULL;

create table supplier (
	empID varchar(5),
 	supplierName varchar (20) not null, totalCost numeric(10,2),
	Commision numeric(7,2),
	primary key (empID,supplierName,totalCost), 
	foreign key (empID) references employee(empID) );
 
-- INSERTING DUMMY VALUES INTO THE RELATIONS:
INSERT INTO branch VALUES (1, 'Headquarters','Toronto');
INSERT INTO branch VALUES (2, 'PrestigeTbay','Thunder Bay'); 
INSERT INTO branch VALUES (3, 'PrestigeKenora','Kenora'); 
INSERT INTO branch VALUES (4, 'PrestigeNipigon','Nipigon'); 
INSERT INTO branch VALUES (5, 'Prestige Warehouse1','Winnipeg');

INSERT INTO sales VALUES (5, 1, 2021, 512021.35); 
INSERT INTO sales VALUES (5, 2, 2021, 512221.45); 
INSERT INTO sales VALUES (3, 1, 2021, 312021.55); 
INSERT INTO sales VALUES (2, 1, 2021, 212021.65);
INSERT INTO sales VALUES (4, 1, 2021, 412021.75); 
INSERT INTO sales VALUES (4, 4, 2021, 345678.25);

INSERT INTO department VALUES ('Accounts', 6); 
INSERT INTO department VALUES ('Sales', 7); 
INSERT INTO department VALUES ('Warehouse', 8); 
INSERT INTO department VALUES ('Purchasing', 9);
-- only 4 dummy values as only 4 departments

INSERT INTO employee VALUES (6, 'Avneet', 'Kaur', '26/11/1982', 'F', '200000', 'Accounts', 1 );
INSERT INTO employee VALUES (7, 'Yousef', 'Pièrre', '27/12/1983', 'M', '190000', 'Sales', 1 );
INSERT INTO employee VALUES (8, 'Shahira', 'Xeni', '28/09/1987', 'F', '118000', 'Warehouse', 1 );
INSERT INTO employee VALUES (9, 'Gouthami', 'Shprintza', '29/07/1997', 'F','210000', 'Purchasing', 1 );
INSERT INTO employee VALUES (10, 'Ethan', 'Fell', '25/10/1980', 'M', '40000','Sales', 3 );
INSERT INTO employee VALUES (11, 'Heena', 'Joseph', '30/10/1980', 'F', '65000','Warehouse', 5 );
INSERT INTO employee VALUES (12, 'Ivan', 'Bogumir', '31/03/2000', 'M', ‘42000’,'Purchasing', 1 );
-- ADDED SOME MORE ROWS SO MORE DIVERSE QUERY OPERATIONS CAN BE APPLIED LATER!

INSERT INTO supplier VALUES (12, 'Always Pan', 67000, totalCost*0.09); 
INSERT INTO supplier VALUES (14, 'CookWare', 89700.6, totalCost*0.09); 
INSERT INTO supplier VALUES (17, 'GoodCook ', 92700.6, totalCost*0.09); 
INSERT INTO supplier VALUES (12, 'Always Pan ', 82700.6, totalCost*0.09); 
-- 9% OF THE TOTAL SALE IS COMMISSION

