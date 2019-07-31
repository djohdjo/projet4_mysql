USE dbtest;

-- -----------------------------------------------------
-- Table customers
-- -----------------------------------------------------
--unique
-- ALTER TABLE customers ADD UNIQUE(phone);


--pour supprimer : ALTER TABLE customers DROP FOREIGN KEY customers_ibfk_1;

ALTER TABLE customers ADD CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber) ON DELETE NO ACTION ON UPDATE CASCADE;


-- -----------------------------------------------------
-- Table employees
-- -----------------------------------------------------


--pour supprimer : ALTER TABLE customers DROP FOREIGN KEY employees_ibfk_1;
--pour supprimer : ALTER TABLE customers DROP FOREIGN KEY employees_ibfk_2;

ALTER TABLE employees ADD CONSTRAINT employees_ibfk_1 FOREIGN KEY (reportsTo) REFERENCES employees (employeeNumber) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE employees ADD CONSTRAINT employees_ibfk_2 FOREIGN KEY (officeCode) REFERENCES offices (officeCode) ON DELETE NO ACTION ON UPDATE CASCADE;


-- -----------------------------------------------------
-- Table offices;
-- -----------------------------------------------------
--unique
ALTER TABLE offices; ADD UNIQUE(phone);


-- -----------------------------------------------------
-- Table orderdetails
-- -----------------------------------------------------

--pour supprimer : ALTER TABLE orderdetails DROP FOREIGN KEY orderdetails_ibfk_1 ;
--pour supprimer : ALTER TABLE orderdetails DROP FOREIGN KEY orderdetails_ibfk_2;

ALTER TABLE orderdetails ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE orderdetails ADD CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (productCode) REFERENCES products (productCode) ON DELETE NO ACTION ON UPDATE CASCADE;


-- -----------------------------------------------------
-- Table orders
-- -----------------------------------------------------

--pour supprimer : ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1 ;


ALTER TABLE orders ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE NO ACTION ON UPDATE CASCADE;

-- -----------------------------------------------------
-- Table payments
-- -----------------------------------------------------
--pour supprimer : ALTER TABLE payments DROP FOREIGN KEY payments_ibfk_1 ;

ALTER TABLE payments ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE NO ACTION ON UPDATE CASCADE;




-- -----------------------------------------------------
-- Table products
-- -----------------------------------------------------
--pour supprimer : ALTER TABLE payments DROP FOREIGN KEY products_ibfk_1 ;

ALTER TABLE products ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (productLine) REFERENCES productlines (productLine) ON DELETE NO ACTION ON UPDATE CASCADE;





