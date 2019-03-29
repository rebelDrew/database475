-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-28 22:54:51.075
ALTER TABLE ClockIn DROP FOREIGN KEY ClockIn_Staff;
ALTER TABLE ClockOut DROP FOREIGN KEY ClockOut_ClockIn;
ALTER TABLE Pro_members DROP FOREIGN KEY Pro_members_Members;
ALTER TABLE Pro_members DROP FOREIGN KEY Pro_members_Programs;
ALTER TABLE Programs DROP FOREIGN KEY Programs_Departments;
ALTER TABLE Staff DROP FOREIGN KEY Staff_Departments;
ALTER TABLE payment DROP FOREIGN KEY payment_Staff;

DROP TABLE IF EXISTS ClockIn;
DROP TABLE IF EXISTS ClockOut;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Pro_members;
DROP TABLE IF EXISTS Programs;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS payment;
-- tables
-- Table: ClockIn
CREATE TABLE ClockIn (
    in_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    recordDate date NOT NULL,
    in_time time NOT NULL,
    Staff_staff_id int NOT NULL
);

-- Table: ClockOut
CREATE TABLE ClockOut (
    out_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClockIn_in_id int NOT NULL,
    out_time time NOT NULL
);

-- Table: Departments
CREATE TABLE Departments (
    depart_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(15) NOT NULL,
    department_type varchar(15) NOT NULL,
    email varchar(30) NOT NULL
);

-- Table: Members
CREATE TABLE Members (
    mem_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FName varchar(20) NOT NULL,
    LName varchar(20) NOT NULL,
    member_type varchar(15) NOT NULL,
    cost double(8,2) NOT NULL,
    DOB date NOT NULL,
    email varchar(20) NOT NULL
);

-- Table: Pro_members
CREATE TABLE Pro_members (
    Members_mem_id int NOT NULL,
    Programs_pro_id int NOT NULL,
    experienceLevel varchar(10) NOT NULL,
    PRIMARY KEY(Members_mem_id, Programs_pro_id)
);

-- Table: Programs
CREATE TABLE Programs (
    pro_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    program_type varchar(25) NOT NULL,
    Departments_depart_id int NOT NULL
);

-- Table: Staff
CREATE TABLE Staff (
    staff_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FName varchar(15) NOT NULL,
    LName varchar(15) NOT NULL,
    staff_type varchar(15) NOT NULL,
    email varchar(20) NOT NULL,
    phone varchar(10) NOT NULL,
    Departments_depart_id int NOT NULL
);

-- Table: payment
CREATE TABLE payment (
    pay_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pay_type varchar(10) NOT NULL,
    rate double(8,2) NOT NULL,
    Staff_staff_id int NOT NULL
);

-- -- foreign keys
-- Reference: ClockIn_Staff (table: ClockIn)
ALTER TABLE ClockIn ADD CONSTRAINT ClockIn_Staff FOREIGN KEY ClockIn_Staff (Staff_staff_id)
    REFERENCES Staff (staff_id);

-- Reference: ClockOut_ClockIn (table: ClockOut)
ALTER TABLE ClockOut ADD CONSTRAINT ClockOut_ClockIn FOREIGN KEY ClockOut_ClockIn (ClockIn_in_id)
    REFERENCES ClockIn (in_id);

-- Reference: Pro_members_Members (table: Pro_members)
ALTER TABLE Pro_members ADD CONSTRAINT Pro_members_Members FOREIGN KEY Pro_members_Members (Members_mem_id)
    REFERENCES Members (mem_id);

-- Reference: Pro_members_Programs (table: Pro_members)
ALTER TABLE Pro_members ADD CONSTRAINT Pro_members_Programs FOREIGN KEY Pro_members_Programs (Programs_pro_id)
    REFERENCES Programs (pro_id);

-- Reference: Programs_Departments (table: Programs)
ALTER TABLE Programs ADD CONSTRAINT Programs_Departments FOREIGN KEY Programs_Departments (Departments_depart_id)
    REFERENCES Departments (depart_id);

-- Reference: Staff_Departments (table: Staff)
ALTER TABLE Staff ADD CONSTRAINT Staff_Departments FOREIGN KEY Staff_Departments (Departments_depart_id)
    REFERENCES Departments (depart_id);

-- Reference: payment_Staff (table: payment)
ALTER TABLE payment ADD CONSTRAINT payment_Staff FOREIGN KEY payment_Staff (Staff_staff_id)
    REFERENCES Staff (staff_id);

-- -- End of file.
