CREATE DATABASE FURAMA_RESORT;
USE FURAMA_RESORT;
CREATE TABLE position (
	position_id INT NOT NULL,
    position_name VARCHAR(50),
    primary key (position_id)
);
CREATE TABLE education_degree (
	education_degree_id INT NOT NULL,
    education_degree_name VARCHAR(50),
    PRIMARY KEY (education_degree_id)
);
CREATE TABLE division (
	division_id INT NOT NULL,
    division_name VARCHAR(50),
    PRIMARY KEY (division_id)
);
CREATE TABLE role (
	role_id INT NOT NULL,
    role_name VARCHAR(255),
    PRIMARY KEY (role_id)
);
CREATE TABLE user (
	userNAME VARCHAR(255),
    password VARCHAR(255),
    PRIMARY KEY (user_id)
);
CREATE TABLE customer_type (
	customer_type_id INT NOT NULL,
    customer_type_name VARCHAR(255),
    PRIMARY KEY (customer_type_id)
);
CREATE TABLE service_type (
	service_type_id INT NOT NULL,
    service_type_name VARCHAR(255),
    PRIMARY KEY (service_type_id)
);
CREATE TABLE rent_type (
	rent_type_id INT NOT NULL,
    rent_type_name VARCHAR(255),
    rent_type_cost DOUBLE,
    PRIMARY KEY (rent_type_id)
);
CREATE TABLE attach_service (
	attach_service_id INT NOT NULL,
    attach_service_name VARCHAR(255),
    attach_service_cost DOUBLE,
    attach_service_unit INT,
    attach_service_status VARCHAR(45),
    PRIMARY KEY (attach_service_id)
);
CREATE TABLE employee (
	employee_id INT NOT NULL,
    employee_name VARCHAR(255),
    employee_birthday DATE,
    employee_id_card VARCHAR(45),
    employee_salary DOUBLE,
    employee_phone VARCHAR(45),
    employee_email VARCHAR(45),
    employee_address VARCHAR(45),
    position_id INT,
    education_degree_id INT,
    division_id INT,
    PRIMARY KEY (attach_service_id),
    FOREIGN KEY (position_id) REFERENCES position (position_id),
    FOREIGN KEY (education_degree_id) REFERENCES position (education_degree_id),
    FOREIGN KEY (division_id) REFERENCES position (division_id)
);
CREATE TABLE user_role (
	role_id INT,
    username VARCHAR(50),
    FOREIGN KEY (role_id) REFERENCES role (role_id),
    FOREIGN KEY (username) REFERENCES user (username)
);

CREATE TABLE customer (
	customer_id INT,
    customer_type_id INT,
    customer_name VARCHAR(50),
    customer_birthday DATE,
    customer_gender BIT(1),
    customer_id_card VARCHAR(50),
    customer_phone VARCHAR(50),
    customer_email VARCHAR(50),
    customer_address VARCHAR(255),
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id)
);
CREATE TABLE service (
	service_id INT,
    service_name VARCHAR(50),
    service_area INT,
    service_cost DOUBLE,
    service_max_people INT,
    rent_type_id INT,
    service_type_id INT,
    standard_room VARCHAR(50),
    description_other_convenience VARCHAR(50),
    pool_area DOUBLE,
    number_of_floors INT,
    PRIMARY KEY (service_id),
    FOREIGN KEY (rent_type_id) REFERENCES rent_type(rent_type_id),
    FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id)
);
CREATE TABLE contract (
	contract_id INT,
);
CREATE TABLE contract_detail (
	contract_detail_id INT,
    contrai
);