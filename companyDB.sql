
-- employee table
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
First_Name varchar(40),
Last_Name varchar(40),
Date_of_Birth DATE,
sex varchar(1),
salary float,
super_id INT,
branch_id INT
);


-- branch table 
CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name varchar(40),
manager_id INT,
man_start_date DATE,
FOREIGN KEY(manager_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE Employee 
ADD FOREIGN KEY(branch_id) 
REFERENCES Branch(branch_id) 
ON DELETE SET NULL;

ALTER TABLE Employee 
ADD FOREIGN KEY(super_id) 
REFERENCES Employee(emp_id) 
ON DELETE SET NULL;

-- client table
CREATE TABLE client(
  client_id INT PRIMARY KEY,
  client_name varchar(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);

--works_with
CREATE TABLE works_with(
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id,client_id),
  FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) ON DELETE SET NULL,
  FOREIGN KEY(client_id) REFERENCES Client(client_id) ON DELETE SET NULL
);

-- branch_supplier table
CREATE TABLE branch_supplier(
  branch_id INT,
  supplier_name varchar(40),
  supply_type varchar(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
);
