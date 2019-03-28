-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-27 22:39:21.312
DROP TABLE IF EXISTS ClockIn, ClockOut, Departments, Members, Pro_members, Programs, Staff, Payment;
-- tables
-- Table: ClockIn
CREATE TABLE ClockIn (
    in_id int NOT NULL,
    date date NOT NULL,
    in_time time NOT NULL,
    Staff_staff_id int NOT NULL,
    CONSTRAINT ClockIn_pk PRIMARY KEY (in_id)
);

-- Table: ClockOut
CREATE TABLE ClockOut (
    out_id int NOT NULL,
    ClockIn_in_id int NOT NULL,
    out_time time NOT NULL,
    CONSTRAINT ClockOut_pk PRIMARY KEY (out_id)
);

-- Table: Departments
CREATE TABLE Departments (
    depart_id int NOT NULL AUTO_INCREMENT,
    name varchar(15) NOT NULL,
    type varchar(15) NOT NULL,
    email varchar(10) NOT NULL,
    CONSTRAINT Departments_pk PRIMARY KEY (depart_id)
);

-- Table: Members
CREATE TABLE Members (
    mem_id int NOT NULL,
    FName int NOT NULL,
    LName int NOT NULL,
    type varchar(15) NOT NULL,
    cost double(8,2) NOT NULL,
    DOB date NOT NULL,
    email varchar(20) NOT NULL,
    CONSTRAINT Members_pk PRIMARY KEY (mem_id)
);

-- Table: Pro_members
CREATE TABLE Pro_members (
    Members_mem_id int NOT NULL,
    Programs_pro_id int NOT NULL,
    CONSTRAINT Pro_members_pk PRIMARY KEY (Members_mem_id,Programs_pro_id)
);

-- Table: Programs
CREATE TABLE Programs (
    pro_id int NOT NULL,
    type varchar(15) NOT NULL,
    Departments_depart_id int NOT NULL,
    CONSTRAINT Programs_pk PRIMARY KEY (pro_id)
);

-- Table: Staff
CREATE TABLE Staff (
    staff_id int NOT NULL AUTO_INCREMENT,
    FName varchar(15) NOT NULL,
    LName varchar(15) NOT NULL,
    type varchar(15) NOT NULL,
    email varchar(20) NOT NULL,
    phone varchar(10) NOT NULL,
    Departments_depart_id int NOT NULL,
    CONSTRAINT Staff_pk PRIMARY KEY (staff_id)
);

-- Table: payment
CREATE TABLE payment (
    pay_id int NOT NULL,
    pay_type varchar(10) NOT NULL,
    rate double(8,2) NOT NULL,
    Staff_staff_id int NOT NULL,
    CONSTRAINT payment_pk PRIMARY KEY (pay_id)
);

-- foreign keys
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

-- End of file.
