-- -----------------------------------------------------
-- Schema dbtest 
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS dbtest ;

CREATE SCHEMA IF NOT EXISTS dbtest  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE dbtest  ;


/*Table structure for table customers*/

DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers (
  customerNumber int(11) NOT NULL AUTO_INCREMENT,
  customerName varchar(50) NOT NULL,
  contactLastName varchar(50) NOT NULL,
  contactFirstName varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  addressLine1 varchar(50) NOT NULL,
  addressLine2 varchar(50) DEFAULT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) DEFAULT NULL,
  postalCode varchar(15) DEFAULT NULL,
  country varchar(50) NOT NULL,
  salesRepEmployeeNumber int(11) DEFAULT NULL,
  creditLimit decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (customerNumber)
);


/* Table structure for table employees*/ 


DROP TABLE IF EXISTS employees;

CREATE TABLE IF NOT EXISTS employees (
  employeeNumber int(11) NOT NULL AUTO_INCREMENT,
  lastName varchar(50) NOT NULL,
  firstName varchar(50) NOT NULL,
  extension varchar(10) NOT NULL,
  email varchar(100) NOT NULL,
  officeCode varchar(10) NOT NULL,
  reportsTo int(11) DEFAULT NULL,
  jobTitle varchar(50) NOT NULL,
  PRIMARY KEY (employeeNumber),
  KEY reportsTo (reportsTo),
  KEY officeCode (officeCode)
);

/*Table structure for table offices*/

DROP TABLE IF EXISTS offices;

CREATE TABLE IF NOT EXISTS offices (
  officeCode int(11) NOT NULL AUTO_INCREMENT,
  city varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  addressLine1 varchar(50) NOT NULL,
  addressLine2 varchar(50) DEFAULT NULL,
  state varchar(50) DEFAULT NULL,
  country varchar(50) NOT NULL,
  postalCode varchar(15) NOT NULL,
  territory varchar(10) NOT NULL,
  PRIMARY KEY (officeCode)
);

/*Table structure for table orderdetails*/

DROP TABLE IF EXISTS orderdetails;

CREATE TABLE IF NOT EXISTS orderdetails (
  orderNumber int(11) NOT NULL AUTO_INCREMENT,
  productCode varchar(15) NOT NULL,
  quantityOrdered int(11) NOT NULL,
  priceEach decimal(10,2) NOT NULL,
  orderLineNumber smallint(6) NOT NULL,
  PRIMARY KEY (orderNumber,productCode),
  KEY productCode (productCode)  
);

/*Table structure for table payments*/

DROP TABLE IF EXISTS payments;

CREATE TABLE IF NOT EXISTS payments (
  customerNumber int(11) NOT NULL AUTO_INCREMENT,
  checkNumber varchar(50) NOT NULL,
  paymentDate date NOT NULL,
  amount decimal(10,2) NOT NULL,
  PRIMARY KEY (customerNumber,checkNumber)  
);


/*Table structure for table productlines*/

DROP TABLE IF EXISTS productlines;

CREATE TABLE IF NOT EXISTS productlines (
  productLine int(11) NOT NULL AUTO_INCREMENT,
  textDescription varchar(4000) DEFAULT NULL,
  htmlDescription mediumtext,
  image mediumblob,
  PRIMARY KEY (productLine)
);


/*Table structure for table products*/

DROP TABLE IF EXISTS products;

CREATE TABLE IF NOT EXISTS products (
  productCode int(11) NOT NULL AUTO_INCREMENT,
  productName varchar(70) NOT NULL,
  productLine varchar(50) NOT NULL,
  productScale varchar(10) NOT NULL,
  productVendor varchar(50) NOT NULL,
  productDescription text NOT NULL,
  quantityInStock smallint(6) NOT NULL,
  buyPrice decimal(10,2) NOT NULL,
  MSRP decimal(10,2) NOT NULL,
  PRIMARY KEY (productCode),
  KEY productLine (productLine)
);